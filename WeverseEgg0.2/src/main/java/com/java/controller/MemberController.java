package com.java.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.dto.member.MemberDto;
import com.java.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class MemberController {
	
	@Autowired MemberService memberService;
	
	//로그인 메인페이지
	@GetMapping("/login") 
	public String login() {
		return "login/weverse_login_main";
	}
	
	// 이메일 입력 페이지
	@PostMapping("/login")
	public String login(@RequestParam("email") String email, 
			HttpSession session, Model model) {
	    MemberDto memberDto = memberService.findByEmail(email);

	    if (memberDto != null) { // 회원 정보가 존재할 경우
	        model.addAttribute("email", memberDto.getEmail());
	        return "/login/weverse_login"; // 비밀번호 입력 페이지
	    } else { // 회원 정보가 없을 경우
	        model.addAttribute("email", email);
	        session.setAttribute("email", email);
	        return "redirect:/login/login-1"; // 회원가입 페이지
	    }
	}
	
	// 입력한 이메일 >> 회원정보가 없는 이메일 (회원가입 가능 알림 창)
	@GetMapping("/login-1")
	public String login1(){
		return "login/weverse_login-1";
	}
	
	// 회원가입 페이지1 >> 비밀번호 생성 페이지
	@GetMapping("/join")
	public String join() {
		return "login/weverse_join_newpw";
	}
	
	@PostMapping("/join")
	public String join(String newpw, String newpwchk,
			HttpSession session) {
		session.setAttribute("pw", newpw);
		return "redirect:/login/nickname";
	}
	
	// 회원가입 페이지2 >> 닉네임 생성 페이지
	@GetMapping("/nickname")
	public String nickname() {
		return "/login/weverse_join_nickname";
	}
	
	@PostMapping("/nickname")
	public String nickname(String nickname,
			HttpSession session) {
		String email = (String) session.getAttribute("email");
		String pw = (String) session.getAttribute("pw");
		
		// 이메일, 비밀번호, 닉네임을 DB에 저장
	    boolean result = memberService.createAccount(email, pw, nickname);
	    System.out.println("회원가입 유무 : "+result);
		return "login/weverse_join_welcome";
	}
	
	// 입력한 이메일 >> 회원정보가 있는 이메일 (로그인페이지)
	@GetMapping("/login-2")
	public String login2() {
		return "/login/weverse_login";
	}
	
	@PostMapping("/login-2")
	public String login2(String email, String pw, Model model,
			HttpSession session, RedirectAttributes redirectAttributes) {
		MemberDto memberDto = memberService.findByEmailAndPw(email, pw);
		if (memberDto != null) { // 회원 정보가 존재할 경우
			session.setAttribute("session_id", email);
			session.setAttribute("session_nick", memberDto.getNickname());
			System.out.println(memberDto.getNickname());
	        return "redirect:/"; // 비밀번호 입력 페이지
	    } else { // 회원 정보가 없을 경우
	    	model.addAttribute("email", email);
	    	model.addAttribute("message", "비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	        return "/login/weverse_login"; // 회원가입 페이지
	    }
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 삭제
		return "main";
	}
	
	
	
	
	
	
	

}
