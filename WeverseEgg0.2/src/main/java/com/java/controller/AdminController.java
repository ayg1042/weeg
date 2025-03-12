package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.character.CharacterDto;
import com.java.dto.member.MemberDto;
import com.java.service.CharacterService;
import com.java.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired HttpSession session;
	@Autowired CharacterService characterService;
	@Autowired MemberService memberService;
	
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

}
