package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FController {
	
	@GetMapping("/")
	public String index() {
		return "main";
	}
	
	@GetMapping("/modal")
	public String modal() {
		return "modal";
	}
	
	
}
