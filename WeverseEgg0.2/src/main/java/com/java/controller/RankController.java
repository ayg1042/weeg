package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.character.CharacterDto;
import com.java.service.RankService;

@Controller
public class RankController {
	
	@Autowired RankService rankService;
	
	@GetMapping("/{group}/rank")
	public String rank(@PathVariable("group") String group, Model model) {
		String GroupKor = "에스파";
		// 순위매기기
		rankService.getRankedCharacterList(GroupKor);
		// 순위대로 정렬된 리스트 가져오기
		List<CharacterDto> rankList = rankService.findAll(GroupKor);
		
		model.addAttribute("ranklist",rankList);
		System.out.println(rankList);
		return "rank";
	}
}
