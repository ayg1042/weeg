package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.character.CharacterDto;
import com.java.dto.item.ItemDto;
import com.java.dto.item.ItemInfoDto;
import com.java.dto.member.MemberDto;
import com.java.service.CharacterService;
import com.java.service.MemberService;
import com.java.service.ModalService;
import com.java.service.ModalServiceImpl;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired HttpSession session;
	@Autowired CharacterService characterService;
	@Autowired MemberService memberService;
	@Autowired ModalService modalService;
	@Autowired ModalServiceImpl modalServiceImpl;
	
	@GetMapping("")
	public String admin() {
		return "/admin/admin_login";
	}
	
	// 회원관리
	@GetMapping("/main")
	public String main(Model model) {
		// 회원전체리스트
		List<MemberDto> memberDto = memberService.findAll();
		System.out.println(memberDto);
		model.addAttribute("memberList", memberDto);
		return "/admin/admin_main";
	}
	
	// 회원 상세보기
	@GetMapping("/memView")
	public String memview(int user, Model model) {
		// 회원 1명 정보 가져오기
		MemberDto memberDto = memberService.findByUserId(user);
		// 해당 회원의 캐릭터 가져오기
		List<CharacterDto> characterDtos = characterService.getCharactersByUserId(user);
		int chListSize = (characterDtos != null) ? characterDtos.size() : 0;
		
		model.addAttribute("member", memberDto);
		model.addAttribute("chListSize", chListSize);
		model.addAttribute("chList", characterDtos);
		return "/admin/admin_memView";
	}
	
	// 회원삭제
	@PostMapping("/memDelete")
	@ResponseBody
	public String memDelete(int userId) {
		System.out.println("에이잭스 확인 : "+userId);
		memberService.deleteById(userId);
		return "회원이 삭제되었습니다.";
	}
	
	@GetMapping("/notice")
	public String board() {
		return "/admin/admin_notice";
	}
	
	@GetMapping("/noticeView")
	public String noticeView() {
		return "/admin/admin_noticeView";
	}
	
	// 아이템 리스트
	@GetMapping("/items")
	public String items(@RequestParam(required = false) String category, Model model) {
		// 아이템리스트 가져오기
		Collection<? extends ItemDto> itemLists = new ArrayList<>();
		
		if (category == null || "0".equals(category)) {// 아이템 전체
			itemLists = modalService.getAllItems();
        }else {// 체크된 아이템 리스트
        	List<Integer> item_type = new ArrayList<>();
    		if("4".equals(category)) {
    			item_type.add(Integer.parseInt(category));
    			item_type.add(Integer.parseInt(category)+1);
    		}else if("6".equals(category)) {
    			item_type.add(Integer.parseInt(category));
    			item_type.add(Integer.parseInt(category)+1);
    			item_type.add(Integer.parseInt(category)+2);
    			item_type.add(Integer.parseInt(category)+3);
    			item_type.add(Integer.parseInt(category)+4);
    		}else {
    			item_type.add(Integer.parseInt(category));
    		}
    		itemLists = modalService.findByItemInfo_ItemType_ItemTypeIdIn(item_type);
    	}
        
		model.addAttribute("items", itemLists);
		model.addAttribute("selectedCategories", category);
		
		return "/admin/admin_items";
	}
	
	// 아이템 추가
	@GetMapping("/itemAdd")
	public String itemAdd() {
		return "/admin/admin_itemAdd";
	}
	// 아이템 정보 추가
	@PostMapping("/itemAdd")
	@ResponseBody
	@Transactional
	public String itemAdd(
			@RequestParam("itemName") String itemName,
			@RequestParam("price") int price,
			@RequestParam("itemInfoId") int itemInfoId,
	        @RequestParam("category") String category,
	        @RequestPart MultipartFile file) throws Exception {
		
		String imgName = "";
		if(!file.isEmpty()) {
			imgName = file.getOriginalFilename();
			System.out.println("파일이름 : "+imgName);
			String url = "C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/items/"+category+"/";
			File f = new File(url+imgName); //파일객체 생성
			file.transferTo(f); //파일올리기
		}
		
		ItemDto item = new ItemDto();
		ItemInfoDto info = new ItemInfoDto();
		info.setItemInfoId(itemInfoId);
		item.setName(itemName);
		item.setImage(imgName);
		item.setPrice(price);
		item.setItemInfo(info);
		
		modalServiceImpl.addItem(item);
		
		return "1";
	}
	
}
