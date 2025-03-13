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
import com.java.dto.feed.FeedDto;
import com.java.dto.item.ItemDto;
import com.java.entity.character.StyleEntity;
import com.java.service.AespaService;
import com.java.service.ModalService;

import jakarta.servlet.http.HttpSession;


@Controller
public class FController {
	
	@Autowired ModalService modalServiceImpl;
	@Autowired AespaService aespaService;
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
	
	@GetMapping("/eggmain") // 에그 메인 게임 시작 페이지
	public String eggMain(Model model) {
		List<FeedDto> banners = aespaService.bannerlist();
		model.addAttribute("banners",banners);
		return "egg_main";
	}
	
	@GetMapping("/wemypage") // 위버스 마이페이지 (대표캐릭터 선택)
	public String weMypage() {
		return "weMyPage";
	}
	
	@GetMapping("/wenotice") // 위버스 공지사항
	public String weNotice(Model model) {
		String category = "notice";
		String status = "게시중";
		List<FeedDto> notilist = aespaService.notilist(category, status);
		model.addAttribute("notilist",notilist);
		return "weNotice";
	}
	
	@GetMapping("/weNoticeView") // 위버스 공지사항 뷰페이지
	public String weNoticeView(@RequestParam int bno, Model model) {
		FeedDto notice = aespaService.notiview(bno);
		model.addAttribute("fdto",notice);
		return "weNoticeView";
	}
	
	@GetMapping("/weevent") // 위버스 이벤트
	public String weevent(Model model) {
		String category = "event";
		String status = "게시중";
		List<FeedDto> eventlist = aespaService.notilist(category, status);
		model.addAttribute("eventlist",eventlist);
		return "weEvent";
	}
	
	@GetMapping("/weEventView") // 위버스 이벤트 뷰페이지
	public String weEventView(@RequestParam int bno, Model model) {
		FeedDto event = aespaService.notiview(bno);
		model.addAttribute("fdto",event);
		return "weEventView";
	}
	
	
	@GetMapping("/rank") // 랭킹 페이지
	public String rank() {
		return "rank";
	}
	

	
	
}
