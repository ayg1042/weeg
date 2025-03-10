package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/admin")
	public String admin() {
		return "admin/admin_main";
	}
	
	@GetMapping("/admin/board")
	public String board() {
		return "admin/admin_board";
	}

}
