package com.java.controller;

import java.io.File;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;
import com.java.repository.FeedRepository;
import com.java.repository.MemberRepository;
import com.java.service.AespaService;
import com.java.service.ModalService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;


@Controller
public class FController {
	
	@Autowired MemberRepository memberRepository;
	@Autowired AespaService aespaService;
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
		MemberDto user = (MemberDto) session.getAttribute("session_id");
		if(user == null) {
			return "redirect:/login/login";
		}
		return "weBoardWrite";
	}
	
	@ResponseBody
	@Transactional
	@PostMapping("/weBoardWrite") // 위버스에그 자유게시판 글작성, 이미지파일 업로드
	public String weBoardWrite(
			@RequestParam("btitle") String btitle,
			@RequestParam("bcontent") String bcontent,
	        @RequestPart MultipartFile files,  MemberRepository memberRepository,
	        FeedRepository feedRepository
	) throws IllegalStateException, IOException {
		
		// 로그인한 사용자 정보 가져오기
        MemberDto user = (MemberDto) session.getAttribute("session_id");
        FeedDto board = new FeedDto();
		String real_fname = "";
		if(!files.isEmpty()) {  // 파일첨부가 되어 있으면
			
			// 최초 파일이름 -> 중복방지를 위해 이름변경
			String origin_fname = files.getOriginalFilename();
			System.out.println("최초 파일이름 : "+origin_fname);
			
			// 방법1
			long time = System.currentTimeMillis(); 
			
			real_fname = String.format("%d_%s", time, origin_fname);
			System.out.println("변경 파일이름 : "+real_fname);
			// 파일저장 위치
			String url ="C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/boardImg/";  // 파일 업로드
			
			// 파일저장
			File f = new File(url+real_fname);
			// 파일 업로드
			files.transferTo(f);
			// dto에 파일이름 저장
			board.setBfile(real_fname);
		}else {
			board.setBfile("");
		}
		
		board.setMember(MemberEntity.From(user));
		board.setBtitle(btitle);
		board.setBcontent(bcontent);
		board.setBfile(real_fname);
		board.setCategory("community");
		board.setStatus("게시중");
	    
		// 게시글 저장
		aespaService.weBoardWrite(board);
		return "redirect:/weBoard";
	}
	
	
	
	@GetMapping("/rank") // 위버스에그 랭킹 페이지
	public String rank() {
		return "rank";
	}
	

	
	
}
