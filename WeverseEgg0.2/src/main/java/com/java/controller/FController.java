package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.character.CharacterDto;
import com.java.dto.character.InvenDto;
import com.java.dto.character.SaveStyleDto;
import com.java.dto.character.StyleDto;
import com.java.dto.item.ItemDto;
import com.java.dto.item.ItemInfoDto;
import com.java.dto.item.ItemTypeDto;
import com.java.entity.character.StyleEntity;
import com.java.service.ModalService;

import jakarta.servlet.http.HttpSession;


@Controller
public class FController {
	
	@Autowired ModalService modalServiceImpl;
	@Autowired HttpSession session;
	
	@GetMapping("/index") //테스트 페이지
	public String index(Model model) {
		List<ItemTypeDto> itemType = modalServiceImpl.getAllItemTypes();
		List<ItemInfoDto> itemInfo = modalServiceImpl.getAllItemInfo();
		System.out.println(itemInfo);
		model.addAttribute("itemTypeList", itemType);
		model.addAttribute("itemInfoList", itemInfo);
		return "index";
	}
	
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
	
	@PostMapping("/itemInfoAdd")
	@ResponseBody
	@Transactional
	public String itemInfoAdd(@RequestParam("itemType") String itemType,
			@RequestParam(value = "charm", defaultValue = "0") int charm,
            @RequestParam(value = "dance", defaultValue = "0") int dance,
            @RequestParam(value = "rap", defaultValue = "0") int rap,
            @RequestParam(value = "vocal", defaultValue = "0") int vocal,
            @RequestParam(value = "entertainment", defaultValue = "0") int entertainment,
            @RequestParam(value = "fatgue_recovery", defaultValue = "0") int fatigueRecovery) {

		ItemInfoDto info = new ItemInfoDto(); ItemTypeDto type = new ItemTypeDto();
		type.setItemTypeId(Integer.parseInt(itemType)); info.setItemType(type);
		info.setCharm(charm); info.setDance(dance); info.setRap(rap);
		info.setVocal(vocal); info.setEntertainment(entertainment);
		info.setFatigueRecovery(fatigueRecovery);
		
		modalServiceImpl.addItemInfo(info);

		return "1";
	}
	
	@GetMapping("/") // 위버스 로그인 안 된 페이지
	public String index1() {
		return "main";
	}
	
	@GetMapping("/loggedIn") // 위버스 로그인 된 메인 페이지
	public String index2() {
		return "main2";
	}
	
	@GetMapping("/aespa") // 위버스 에스파 페이지 캐릭터 랭킹 
	public String weverseAespa() {
		return "weverse_aespa";
	}
	
	@GetMapping("/eggmain") // 에그 메인 게임 시작 페이지
	public String eggMain() {
		return "egg_main";
	}
	
	@GetMapping("/wemypage") // 위버스 마이페이지 (대표캐릭터 선택)
	public String weMypage() {
		return "weMyPage";
	}
	
	@GetMapping("/wenotice") // 위버스 공지사항
	public String weNotice() {
		return "weNotice";
	}
	
	@GetMapping("/weNoticeView") // 위버스 공지사항 뷰페이지
	public String weNoticeView() {
		return "weNoticeView";
	}
	
	@GetMapping("/modal")
	public String modal(Model model) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		
//		전체 아이템 리스트
		List<ItemDto> items = modalServiceImpl.getAllItems();
		model.addAttribute("shopList",items);
		
		// 캐릭터 스타일
		
		List<StyleDto> style = modalServiceImpl.getAllStyle(character.getCharacter_id());
		if(style == null) {
			model.addAttribute("styleList", 0);
		}else {			
			for(int i = 0; i < style.size(); i++) {
				String type = style.get(i).getItem().getItemInfo().getItemType().getItemType();
				if(Integer.parseInt(type) == 1) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("hat", img);
					model.addAttribute("hat_id", itemId);
				}else if (Integer.parseInt(type) == 2) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("outfit", img);
					model.addAttribute("outfit_id", itemId);
				}else if (Integer.parseInt(type) == 3) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("pet", img);
					model.addAttribute("pet_id", itemId);
				}else if (Integer.parseInt(type) == 6) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("pot", img);
					model.addAttribute("pot_id", itemId);
				}else if (Integer.parseInt(type) == 7) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("sofa", img);
					model.addAttribute("sofa_id", itemId);
				}else if (Integer.parseInt(type) == 8) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("carpet", img);
					model.addAttribute("carpet_id", itemId);
				}else if (Integer.parseInt(type) == 9) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("drawer", img);
					model.addAttribute("drawer_id", itemId);
				}else if (Integer.parseInt(type) == 10) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("frame", img);
					model.addAttribute("frame_id", itemId);
				}
			}
		}
		
		
		// 케릭터 인벤토리
		List<InvenDto> Inven = modalServiceImpl.getCharacterInven(character.getCharacter_id());
		model.addAttribute("invenList", Inven);
		model.addAttribute("character", character);
		
		return "modal";
	}
	
	@Transactional
	@ResponseBody
	@PostMapping("/buyItem") //회원정보수정 저장
	public String memDelete(String itemId) {
		// 세션에서 가져올꺼임
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		List<InvenDto> Inven = modalServiceImpl.getCharacterInven(character.getCharacter_id());
		
		// 중복아이템 확인
		Set<Integer> invenItemIds = Inven.stream()
                .map(inven -> inven.getItemId().getItemId())
                .collect(Collectors.toSet());

		if (invenItemIds.contains(Integer.parseInt(itemId))) {
			return "2";
		}
		
		// 케릭터 결제로직
		ItemDto item = modalServiceImpl.getItem(Integer.parseInt(itemId));
		
		int coin = character.getCoin() - item.getPrice();
		if(coin < 0) {
			return "0";
		}
		character.setCoin(coin);
		modalServiceImpl.characterSave(character);
		// 결제
		
		InvenDto Inven1 = new InvenDto();
		Inven1.setCharacterId(character);
		Inven1.setItemId(item);
		modalServiceImpl.buyItem(Inven1);
		session.setAttribute("character", character);
		
		return "1";
	}
	
	@Transactional
	@ResponseBody
	@PostMapping("/styleSave")
	public String styleSave(@RequestBody ArrayList<SaveStyleDto> styleList) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		
		modalServiceImpl.deleteStyleByUserId(character.getCharacter_id());
		for (SaveStyleDto item : styleList) {
			if(item.getItemId() != "") {
				StyleDto dto = new StyleDto();
				ItemDto iDto = new ItemDto();
				iDto.setItemId(Integer.parseInt(item.getItemId()));
				dto.setCharacter(character);
				dto.setItem(iDto);
				modalServiceImpl.styleSave(dto);
			}
				
        }
		return "1";
	}
	
	@Transactional
	@ResponseBody
	@PostMapping("/itemUse")
	public String itemUse(String invenId, String itemId) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		
		// 사용 로직
		ItemDto item = modalServiceImpl.getItem(Integer.parseInt(itemId));
		if(character.getFatigue() == 0) return "0";
		int fatigue = character.getFatigue() - item.getItemInfo().getFatigueRecovery();
		if(fatigue < 0) fatigue = 0;
		character.setFatigue(fatigue);
		
		// 해당 아이템 삭제
		modalServiceImpl.deleteInvenItem(Integer.parseInt(itemId));
		
		session.setAttribute("character", character);
		return "1";
	}
	
	
	@GetMapping("/rank") // 랭킹 페이지
	public String rank() {
		return "rank";
	}

	
	
}
