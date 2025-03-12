package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.java.dto.character.CharacterDto;
import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;
import com.java.service.AespaService;

@Controller
public class AespaController {
	
	@Autowired AespaService aespaService;
	
	@GetMapping("/{group}/rank")
	public String rank(@PathVariable("group") String group, Model model) {
		String GroupKor = "에스파";
		// 순위매기기
		aespaService.getRankedCharacterList(GroupKor);
		// 순위대로 정렬된 리스트 가져오기
		List<CharacterDto> rankList = aespaService.findAll(GroupKor);
		
		model.addAttribute("ranklist",rankList);
		System.out.println(rankList);
		return "rank";
	}
	
	@GetMapping("/aespa") // 위버스 에스파 페이지 캐릭터 랭킹 
	public String weverseAespa(Model model,
			@SessionAttribute(name = "session_id", required = false) MemberDto memberDto) {
		List<FeedDto> feedlist = aespaService.feedlist();
		model.addAttribute("feed",feedlist);
		return "weverse_aespa";
	}
	
	@PostMapping("/aespa")
	public String feedpost(String feedWrite, Model model,
			@SessionAttribute(name = "session_id", required = false) MemberDto memberDto) {
		aespaService.newfeed(memberDto, feedWrite);
		return "redirect:/aespa";
	}
	
	@GetMapping("/adminlogin")
	public String getMethodName() {
		return "admin/admin_login";
	}
	
	
}
