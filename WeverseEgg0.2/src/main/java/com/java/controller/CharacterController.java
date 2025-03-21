package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.java.dto.character.CharacterDto;
import com.java.dto.member.MemberDto;
import com.java.entity.character.ArtistEntity;
import com.java.entity.character.CharacterEntity;
import com.java.entity.group.ArtistNameEntity;
import com.java.entity.group.GroupEntity;
import com.java.entity.member.MemberEntity;
import com.java.service.CharacterService;
import com.java.service.MemberService;
import com.java.service.ModalService;

import jakarta.servlet.http.HttpSession;


@Controller
public class CharacterController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	CharacterService characterService;
	@Autowired
	HttpSession session;
	@Autowired ModalService modalServiceImpl;
	
	// 캐릭터 선택 페이지 열기
	@GetMapping("/choiceCharacter")
	public String choiceCharacter(Model model,
			@SessionAttribute(name = "session_id", required = false) MemberDto memberDto) {
		// 회원 정보 없으면 로그인
		if (memberDto == null) {
		        return "redirect:/login/login";
		    }
		// 로그인한 사용자 정보 가져오기
		int user_id = memberDto.getUser_id();
		int jelly = memberService.getByJelly(user_id);
		
	    // 사용자의 캐릭터 목록 불러오기
        List<CharacterDto> list = characterService.getCharactersByUserId(user_id);
        if(list != null) {
        	model.addAttribute("list", list);
        	model.addAttribute("jelly", jelly);
			return "choiceCharacter";
        }
        model.addAttribute("jelly", jelly);
        model.addAttribute("list", null);
        return "choiceCharacter";
	}
	
	@PostMapping("/choiceCharacter")
	public String buyCharacter(@SessionAttribute(name = "session_id", required = false) MemberDto memberDto) {
		// 로그인한 사용자 정보 가져오기
		int id = memberDto.getUser_id();
		memberService.buyCharacter(id);
		return "choiceCharacter";
	}

	// 캐릭터 생성시 스토리 페이지
	@GetMapping("/startStory") 
	public String startStory() {
		return "startStory";
	}
	
	@GetMapping("/addCharacter")
	public String addCharacter() {
		MemberDto dto = (MemberDto)session.getAttribute("session_id");
		dto.setJelly(dto.getJelly() - 30);
		
		memberService.buyCharacter(dto);
		
		return "startStory";
	}
	
	
	// 캐릭터 생성, 닉네임 입력 페이지
	@GetMapping("/nickname_input") 
	public String nickname_input() {
		return "nickname_input";
	}
	
	// 캐릭터 생성, 닉네임 저장
	@PostMapping("/nickname_input") 
	public String nickname_input(@RequestParam("nicinput") String nickname, Model model) {
		// 로그인한 사용자 정보 가져오기
		int user_id = (Integer)session.getAttribute("session_userId");
		
		MemberDto member = new MemberDto();
		member.setUser_id(user_id);
		member.setEmail((String)session.getAttribute("session_email"));
		member.setNickname((String)session.getAttribute("session_nickname"));
		
		// 캐릭터 생성
		CharacterEntity character = new CharacterEntity();
	    character.setNickName(nickname); // 닉네임 설정
	    character.setGender("여성"); // 기본값 설정 (예제)
	    character.setMember(MemberEntity.From(member)); // 사용자 정보 연결
	    character.setCoin(100000); // 기본 코인 지급
	    character.setHealth(100); // 기본 체력
	    character.setFatigue(0); // 기본 피로도
	    character.setDance(0); // 기본 댄스 능력치
	    character.setVocal(0);
	    character.setRap(0);
	    character.setEntertainment(0);
	    character.setCharm(0);
	    character.setPopularity(0);
	    character.setRank(0);
	    character.setExpression("기본");

	    // 캐릭터 저장
	    // 캐릭터 생성 후 세션 저장
	    CharacterDto characterDto = CharacterDto.unit(characterService.save(character));
	    session.setAttribute("character", characterDto);
	    
		return "redirect:/modal";
	}
	
	@ResponseBody
	@PostMapping("/selectCharacter")
	public String selectCharacter(@RequestParam("character_id") int characterId) {
		CharacterDto dto = characterService.getCharacterByCharacterId(characterId);
		session.setAttribute("character", dto);
		return "1";
	}
	

	

	
	

}
