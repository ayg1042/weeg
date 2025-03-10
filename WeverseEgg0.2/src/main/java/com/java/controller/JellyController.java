package com.java.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.catalina.manager.util.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.dto.kakao.ApproveResponseDto;
import com.java.dto.member.MemberDto;
import com.java.service.JellyService;
import com.java.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class JellyController {
	
	@Autowired JellyService jellyService;
	@Autowired MemberService memberService;
	@Autowired HttpSession session;
	
	@GetMapping("/jellyshop") //젤리샵
	public String jellyShop(Model model,
			@SessionAttribute(name = "session_id", required = false) MemberDto memberDto) {
		// 회원 정보 없으면 로그인 
		if (memberDto != null) {
			int id = memberDto.getUser_id();
			int jelly = memberService.getByJelly(id);
			model.addAttribute("jelly",jelly);
		    }
		return "jelly_shop";
	}
	
	@GetMapping("/jellyshop/buy")
	public String buyjelly(
			@RequestParam("jellyCount") String jelly, 
			@RequestParam("price") String price,
			@SessionAttribute(name = "session_id", required = false) MemberDto memberDto) {
		
		// 회원 정보 없으면 로그인 
		if (memberDto == null) {
		        return "redirect:/login/login";
		    }
		// DTO에서 userId 가져오기
		int userId = memberDto.getUser_id();  
		
		// 카카오 페이 결제 준비
		System.out.println("가격 : "+price);
		System.out.println("젤리 : "+jelly);
		 ResponseEntity<Map> response = jellyService.payReady(jelly, price,userId);
		// 세션에 결제 고유번호(tid) 저장
		 Map<String, Object> responseBody = response.getBody();
		 String tid = (String) responseBody.get("tid");
		 String redirect = (String) responseBody.get("next_redirect_pc_url");
		 session.setAttribute("tid", tid);  // "tid"라는 키로 세션에 값 저장
		 session.setAttribute("partner_order_id", "jelly"+jelly);
		 session.setAttribute("partner_user_id", ""+userId);
		 return "redirect:"+redirect;
	}
	
	@GetMapping("/jellyshop/buy/completed")
	public String completed(@RequestParam("pg_token") String pgToken, Model model, RedirectAttributes redirectAttributes) {
		//섹션에서 tid값을 가져옴.
        String tid = (String) session.getAttribute("tid");
        String partner_order_id = (String) session.getAttribute("partner_order_id");
        String partner_user_id = (String) session.getAttribute("partner_user_id");
        System.out.println("결제승인 요청을 인증하는 토큰: " + pgToken);
        System.out.println("결제 고유번호: " + tid);

        // 카카오 결제 요청하기
        ApproveResponseDto approveResponseDto = jellyService.payApprove(tid, pgToken, partner_order_id, partner_user_id);
        System.out.println("승인날짜 : "+approveResponseDto.getApproved_at());
        
        // 젤리 저장
        int Id = Integer.parseInt(partner_user_id);
        int quantity = approveResponseDto.getQuantity();
        MemberDto memberDto = jellyService.updateJelly(Id, quantity);
        System.out.println("젤리컨트롤러 : "+memberDto.getJelly());
        redirectAttributes.addFlashAttribute("jelly", memberDto.getJelly());
        return "redirect:/jellyshop";
	}
	
}
