package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.java.dto.character.CharacterDto;
import com.java.dto.member.MemberDto;
import com.java.service.CharacterService;

import jakarta.servlet.http.HttpSession;


@Controller
public class CharacterController {
	
	@Autowired
	CharacterService characterService;
	@Autowired
	HttpSession session;
	
	// 캐릭터 선택 페이지 열기
	@GetMapping("/choiceCharacter") 
	public String choiceCharacter(Model model) {
		
		session.setAttribute("session_id",  new MemberDto());
		
		// 세션에서 로그인한 사용자 ID 가져오기
	    MemberDto sessionId = (MemberDto) session.getAttribute("session_id");
	    
	    // 사용자의 캐릭터 목록 불러오기
        List<CharacterDto> list = characterService.getCharactersByUserId(sessionId.getUser_id());
        System.out.println(list);
        if(list != null) {
        	model.addAttribute("list", list);
			return "choiceCharacter";
        }
        model.addAttribute("list", null);
        
        return "choiceCharacter";
	}
	
	// 캐릭터 생성시 스토리 페이지
	@GetMapping("/startStory") 
	public String startStory() {
		return "startStory";
	}
	
	

}
