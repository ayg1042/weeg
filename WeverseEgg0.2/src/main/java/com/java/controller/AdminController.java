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
import org.springframework.web.bind.annotation.RestController;

import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;
import com.java.dto.quest.QuestDto;
import com.java.service.AdminService;
import com.java.service.MemberService;
import com.java.service.QuestService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

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
	public String admin(String adminId, String adminPw) {
		MemberDto admin = memberService.findByEmailAndPw(adminId, adminPw);
		session.setAttribute("admin_nickname", admin.getNickname());
		return "/admin/admin_main";
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
	
	// 퀘스트 관리
	@GetMapping("/admin_quest")
	public String updateQuest() {
		return "/admin/admin_quest";
	}
	
	@RestController
	@RequestMapping("/admin")
	public class AdminQuestController {

	    @Autowired
	    private QuestService questService;

	    // 퀘스트 저장 (기존 퀘스트 수정 또는 새 퀘스트 생성)
	    @PostMapping("/admin_quest/save")
	    @Transactional
	    @ResponseBody
	    public String saveQuest(QuestDto questdto) {
	    	System.out.println("퀘스트 저장됨: " + questdto);
	    	questService.saveQuest(questdto);
	    	return "퀘스트가 성공적으로 저장되었습니다.";
	    }


	    // 퀘스트 목록 조회
	    @GetMapping("/admin_quest/list")
	    public List<QuestDto> getAllQuests() {
	        return questService.findAll();
	    }
	}





}
