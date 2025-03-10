package com.java.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.character.CharacterDto;
import com.java.dto.character.InvenDto;
import com.java.dto.character.SaveStyleDto;
import com.java.dto.character.StyleDto;
import com.java.dto.item.ItemDto;
import com.java.entity.character.StyleEntity;
import com.java.service.ModalService;

import jakarta.servlet.http.HttpSession;


@Controller
public class FController {
	
	@Autowired ModalService modalServiceImpl;
	
	@GetMapping("/index") //테스트 페이지
	public String index() {
		return "main";
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
		CharacterDto test = new CharacterDto();
		test.setCharacter_id(1);
		
//		전체 아이템 리스트
		List<ItemDto> items = modalServiceImpl.getAllItems();
		model.addAttribute("shopList",items);
		
		// 캐릭터 스타일
		
		List<StyleDto> style = modalServiceImpl.getAllStyle(test.getCharacter_id());
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
		List<InvenDto> Inven = modalServiceImpl.getCharacterInven(test.getCharacter_id());
		model.addAttribute("invenList", Inven);
		
		return "modal";
	}
	
	@ResponseBody
	@PostMapping("/buyItem") //회원정보수정 저장
	public String memDelete(String itemId) {
		// 세션에서 가져올꺼임
		CharacterDto test = new CharacterDto();
		test.setCharacter_id(1);
		
		// 케릭터 결제로직
		
		// 결제
		
		InvenDto Inven = new InvenDto();
		ItemDto item = new ItemDto();
		item.setItemId(Integer.parseInt(itemId));
		Inven.setCharacterId(test);
		Inven.setItemId(item);
		modalServiceImpl.buyItem(Inven);
		
		return "1";
	}
	
	@Transactional
	@ResponseBody
	@PostMapping("/styleSave")
	public String styleSave(@RequestBody ArrayList<SaveStyleDto> styleList) {
		CharacterDto test = new CharacterDto();
		test.setCharacter_id(1);
		modalServiceImpl.deleteStyleByUserId(test.getCharacter_id());
		for (SaveStyleDto item : styleList) {
			if(item.getItemId() != "") {
				StyleDto dto = new StyleDto();
				ItemDto iDto = new ItemDto();
				iDto.setItemId(Integer.parseInt(item.getItemId()));
				dto.setCharacter(test);
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
		System.out.println("인벤 아이디 = " + invenId + ", 아이템 아이디 = " + itemId);
		// 사용 로직
		return "1";
	}
	
	
	@GetMapping("/rank") // 랭킹 페이지
	public String rank() {
		return "rank";
	}
}
