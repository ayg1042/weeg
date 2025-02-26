package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FController {
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/") // 메인 게임 시작 페이지
	public String eggMain() {
		return "egg_main";
	}
	
}
