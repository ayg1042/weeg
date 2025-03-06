package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class FController {
	
	@GetMapping("/weverserank") // 위버스 에스파 그룹랭킹
	public String rank() {
		return "rank";
	}
	
	
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
	
	@GetMapping("/weverseaespa") // 위버스 에스파 페이지 캐릭터 랭킹 
	public String weverseAespa() {
		return "weverse_aespa";
	}
	
	@GetMapping("/jellyshop") //젤리 구매 페이지
	public String jellyShop() {
		return "jelly_shop";
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
	
	@GetMapping("/modal")
	public String modal() {
		return "modal";
	}
	
	
}
