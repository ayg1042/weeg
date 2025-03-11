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
import org.springframework.web.bind.annotation.RequestParam;
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
	@Autowired HttpSession session;
	
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
	
	@GetMapping("/wenotice") // 위버스에그 공지사항
	public String weNotice() {
		return "weNotice";
	}
	
	@GetMapping("/weNoticeView") // 위버스에그 공지사항 뷰페이지
	public String weNoticeView() {
		return "weNoticeView";
	}
	
	@GetMapping("/weEventView") // 위버스에그 이벤트 뷰페이지
	public String weEventView() {
		return "weEventView";
	}
	
	@GetMapping("/weBoard") // 위버스에그 자유게시판
	public String weBoard() {
		return "weBoard";
	}
	
	@GetMapping("/weBoardView") // 위버스에그 자유게시판 뷰페이지
	public String weBoardView() {
		return "weBoardView";
	}
	
	@GetMapping("/weBoardWrite") // 위버스에그 자유게시판 글작성 페이지
	public String weBoardWrite() {
		return "weBoardWrite";
	}
	
	@GetMapping("/rank") // 위버스에그 랭킹 페이지
	public String rank() {
		return "rank";
	}

	
	
}
