package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.dto.member.MemberDto;

import ch.qos.logback.core.model.Model;


@Controller
public class FController {
	
	@GetMapping("/")
	public String index() {
		return "main";
	}
	
	/*singin*/ 
	@GetMapping("/singin")
	public String singin() {
		return "login/weverse_login_main";
	}
	
	@PostMapping("/singin")
	public String singin(String email) {
		
		return "login/weverse_login_main";
	}
	
	@GetMapping("/jelly_shop")
	public String jelly_shop() {
		return "jelly_shop";
	}
	
	@GetMapping("/main2")
	public String index2() {
		return "main2";
	}
	
	@GetMapping("/modal")
	public String modal() {
		return "modal";
	}
	
	
}
