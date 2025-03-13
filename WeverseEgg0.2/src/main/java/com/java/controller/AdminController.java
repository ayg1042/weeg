package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;
import com.java.service.AdminService;
import com.java.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired MemberService memberService;
	@Autowired AdminService adminService;
	@Autowired HttpSession session;
	
	@GetMapping("")
	public String admin() {
		return "/admin/admin_login";
	}
	
	@PostMapping("")
	public String admin(String adminId, String adminPw, 
			Model model, RedirectAttributes redirectAttributes) {
		MemberDto admin = memberService.findByEmailAndPw(adminId, adminPw);
		if (admin != null) {
	        session.setAttribute("session_admin", admin);
	        redirectAttributes.addFlashAttribute("lmsg", "1");
	        return "redirect:/admin/main";
	    } else {
	        redirectAttributes.addFlashAttribute("lmsg", "0");
	        return "redirect:/admin";
	    }
	}
	
	@GetMapping("/main")
	public String main() {
		return "/admin/admin_main";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.removeAttribute("admin_nickname");
		return "redirect:/admin";
	}
	
	// 공지사항
	@GetMapping("/notice")
	public String board(Model model) {
		String category = "notice";
		List<FeedDto> notilist = adminService.notilist(category);
		model.addAttribute("notilist",notilist);
		return "/admin/admin_notice";
	}
	
	// 게시상태 업데이트 메서드
	@PostMapping("/updateStatus")
	@ResponseBody
	public ResponseEntity<String> updateStatus(
			@RequestParam int bno, @RequestParam String status) {
		
		if("1".equals(status)) {
			status = "게시중";
		}else if("0".equals(status)){
			status = "게시안함";
		}
		
	    try {
	        // FeedDto에 해당하는 엔티티를 찾아서 상태 업데이트
	    	adminService.updateStatus(bno, status);
	        return ResponseEntity.ok("상태 업데이트 성공");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("상태 업데이트 실패");
	    }
	}
	
	// 공지사항 뷰페이지
	@GetMapping("/noticeView")
	public String noticeView(@RequestParam int bno, Model model) {
		FeedDto notice = adminService.notiview(bno);
		model.addAttribute("fdto",notice);
		return "/admin/admin_noticeView";
	}
	
	// 공지사항 삭제
	@GetMapping("/deleteFeed")
	public String deleteFeed(@RequestParam int bno) {
		adminService.delFeed(bno);
		return "/admin/admin_notice";
	}
	
	// 공지글 작성
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		return "/admin/admin_noticeWrite";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite(
			@RequestParam("notiTitle") String title,
            @RequestParam("notiContent") String content,
            @RequestParam("file") MultipartFile file,
            HttpSession session) {
		
		String category = "notice";
		 // 예: 세션에서 로그인한 사용자 ID 가져오기
	    MemberDto member = (MemberDto) session.getAttribute("session_admin"); 
		adminService.notiWrite(title,content,file,category,member);
		
		return "redirect:/admin/notice";
	}
	
	// 공지글 수정
	@GetMapping("/noticeModify")
	public String noticeModify(@RequestParam int bno, Model model) {
		FeedDto notice = adminService.notiview(bno);
		model.addAttribute("notimodi",notice);
		return "/admin/admin_noticeWrite";
	}
	
	@PostMapping("/noticeModify")
	public String noticeModify(
			@RequestParam("bno") int bno,
			@RequestParam("notiTitle") String title,
            @RequestParam("notiContent") String content,
            @RequestParam("file") MultipartFile file) {
		
		adminService.notiModi(title,content,file,bno);
		
		return "redirect:/admin/notice";
	}
	
	// 이벤트
	@GetMapping("/event")
	public String event(Model model) {
		String category = "event";
		List<FeedDto> notilist = adminService.notilist(category);
		model.addAttribute("notilist",notilist);
		return "/admin/admin_event";
	}
	
	@GetMapping("/eventView")
	public String eventView(@RequestParam int bno, Model model) {
		FeedDto event = adminService.notiview(bno);
		model.addAttribute("fdto",event);
		return "/admin/admin_eventView";
	}
	
	@GetMapping("/eventWrite")
	public String eventWrite() {
		return "/admin/admin_eventWrite";
	}
	
	@PostMapping("/eventWrite")
	public String eventWrite(
			@RequestParam("eventTitle") String title,
            @RequestParam("eventContent") String content,
            @RequestParam("file") MultipartFile file,
            @RequestParam("file_banner") MultipartFile fileb,
            @RequestParam("file_modal") MultipartFile filem,
            HttpSession session) {
		
		String category = "event";
		 // 예: 세션에서 로그인한 사용자 ID 가져오기
	    MemberDto member = (MemberDto) session.getAttribute("session_admin"); 
		adminService.eventWrite(title,content,file,fileb,filem,category,member);
		
		return "redirect:/admin/event";
	}
	
	// 이벤트 수정
	@GetMapping("/eventModify")
	public String eventModify(@RequestParam int bno, Model model) {
		FeedDto event = adminService.notiview(bno);
		model.addAttribute("eventmodi",event);
		return "/admin/admin_eventWrite";
	}
	
	@PostMapping("/eventModify")
	public String eventModify(
			@RequestParam("bno") int bno,
			@RequestParam("eventTitle") String title,
            @RequestParam("eventContent") String content,
            @RequestParam("file") MultipartFile file,
            @RequestParam("file_banner") MultipartFile fileb,
            @RequestParam("file_modal") MultipartFile filem,
            @RequestParam(value="deleteFile_notice", required = false) boolean delfile,
            @RequestParam(value="deleteFile_banner", required = false) boolean delfileb,
            @RequestParam(value="deleteFile_modal", required = false) boolean delfilem) {
		
		adminService.eventModi(title,content,file,fileb,filem,bno,delfile,delfileb,delfilem);
		
		return "redirect:/admin/event";
	}
	

}
