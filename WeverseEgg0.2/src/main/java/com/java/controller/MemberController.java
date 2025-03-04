package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class MemberController {
	
	@GetMapping("/login") //로그인 메인페이지
	public String login() {
		return "login/weverse_login_main";
	}
	

}
