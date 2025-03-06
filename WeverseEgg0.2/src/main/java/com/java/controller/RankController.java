package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.character.CharacterDto;
import com.java.service.RankService;

@Controller
public class RankController {
	
	@Autowired RankService rankService;
	
	@GetMapping("/{group}/rank")
	public String rank(@PathVariable("group") String group) {
		System.out.println("그룹"+group);
		//List<CharacterDto> rankList = rankService.findAll(group);
		return "rank";
	}
}
