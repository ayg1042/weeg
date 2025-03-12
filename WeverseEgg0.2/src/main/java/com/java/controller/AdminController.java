package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("")
	public String admin() {
		return "/admin/admin_login";
	}
	
	@GetMapping("/main")
	public String main() {
		return "/admin/admin_main";
	}
	
	@GetMapping("/notice")
	public String board() {
		return "/admin/admin_notice";
	}
	
	@GetMapping("/noticeView")
	public String noticeView() {
		return "/admin/admin_noticeView";
	}

}
