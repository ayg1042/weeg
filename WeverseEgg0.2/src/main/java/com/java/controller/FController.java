package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class FController {
	
	@GetMapping("/index")
	public String index() {
		return "main";
	}
	
	@GetMapping("/") // 메인 게임 시작 페이지
	public String eggMain() {
		return "egg_main";
	}
	
	@GetMapping("/wemypage") // 위버스 마이페이지 (대표캐릭터 선택)
	public String weMypage() {
		return "weMyPage";
	}
	
	@GetMapping("/wenotice")
	public String weNotice() {
		return "weNotice";
	}
	
	@GetMapping("/modal")
	public String modal() {
		return "modal";
	}
	
	
}
