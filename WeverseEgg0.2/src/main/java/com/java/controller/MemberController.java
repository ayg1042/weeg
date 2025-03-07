package com.java.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.kakao.OAuthToken;
import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;
import com.java.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class MemberController {
	
	@Autowired MemberService memberService;
	
	//로그인 메인페이지
	@GetMapping("/login") 
	public String login() {
		return "login/weverse_login_main";
	}
	
	// 이메일 입력 페이지
	@PostMapping("/login")
	public String login(@RequestParam("email") String email, 
			HttpSession session, Model model) {
	    MemberDto memberDto = memberService.findByEmail(email);

	    if (memberDto != null) { // 회원 정보가 존재할 경우
	        model.addAttribute("email", memberDto.getEmail());
	        return "/login/weverse_login"; // 비밀번호 입력 페이지
	    } else { // 회원 정보가 없을 경우
	        model.addAttribute("email", email);
	        session.setAttribute("email", email);
	        return "redirect:/login/login-1"; // 회원가입 페이지
	    }
	}
	
	// 입력한 이메일 >> 회원정보가 없는 이메일 (회원가입 가능 알림 창)
	@GetMapping("/login-1")
	public String login1(){
		return "login/weverse_login-1";
	}
	
	// 회원가입 페이지1 >> 비밀번호 생성 페이지
	@GetMapping("/join")
	public String join() {
		return "login/weverse_join_newpw";
	}
	
	@PostMapping("/join")
	public String join(String newpw, String newpwchk,
			HttpSession session) {
		session.setAttribute("pw", newpw);
		return "redirect:/login/nickname";
	}
	
	// 회원가입 페이지2 >> 닉네임 생성 페이지
	@GetMapping("/nickname")
	public String nickname() {
		return "/login/weverse_join_nickname";
	}
	
	@PostMapping("/nickname")
	public String nickname(String nickname,
			HttpSession session) {
		String email = (String) session.getAttribute("email");
		String pw = (String) session.getAttribute("pw");
		
		// 이메일, 비밀번호, 닉네임을 DB에 저장
	    boolean result = memberService.createAccount(email, pw, nickname);
	    System.out.println("회원가입 유무 : "+result);
		return "login/weverse_join_welcome";
	}
	
	// 입력한 이메일 >> 회원정보가 있는 이메일 (로그인페이지)
	@GetMapping("/login-2")
	public String login2() {
		return "/login/weverse_login";
	}
	
	@PostMapping("/login-2")
	public String login2(String email, String pw, Model model,
			HttpSession session, RedirectAttributes redirectAttributes) {
		MemberDto memberDto = memberService.findByEmailAndPw(email, pw);
		if (memberDto != null) { // 회원 정보가 존재할 경우
			session.setAttribute("session_id", memberDto.getEmail());
			session.setAttribute("session_nick", memberDto.getNickname());
			session.setAttribute("user_id", memberDto.getUser_id());
			session.setAttribute("session_userId", memberDto.getUser_id()); // 1
//			session.setAttribute("session_id", memberDto);
			System.out.println(memberDto.getNickname());
	        return "redirect:/"; // 로그인 성공
	    } else { // 회원 정보가 없을 경우
	    	model.addAttribute("email", email);
	    	model.addAttribute("message", "비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	        return "/login/weverse_login"; // 회원가입 페이지
	    }
	}
	
	// 카카오 로그인
	@GetMapping("/kakao/oauth")
	public String kakaoLogin(@RequestParam String code, HttpSession session) {
		String grant_type = "authorization_code";
		String client_id = "5c065bc8f939d1303dc54e5a7ed2878a";
		String redirect_uri = "http://localhost:8181/login/kakao/oauth";
		String prompt = "login";
		String content_type = "application/x-www-form-urlencoded;charset=utf-8";
		
		// http 전송 : restTemplate
		RestTemplate rt = new RestTemplate();
		
		// header
		HttpHeaders headers = new HttpHeaders();
		headers.add("content-Type", content_type);
		
		//4개 데이터 묶기
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", grant_type);
		params.add("client_id", client_id);
		params.add("redirect_uri", redirect_uri);
		params.add("code", code);
	
		// http전송 - heade
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
				new HttpEntity<>(params, headers);
		
		// http요청 url
		String oauthUrl = "https://kauth.kakao.com/oauth/token";
		// http전송 - 토큰키 받기
		ResponseEntity<String> response = 
		rt.exchange(oauthUrl, HttpMethod.POST, kakaoTokenRequest, String.class);
		
		// System.out.println("kakaoToken response : "+response );
		
		// response에서 받은 데이터(json)를 dto 파일에 저장
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oAuthToken = null;
		
		try {
			oAuthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (Exception e) {e.printStackTrace();}
		
		// System.out.println(oAuthToken.getAccess_token());
		
		// access_token 분리해서 전송하면, 회원정보 아이디 등등 받아옴
		String access_token = oAuthToken.getAccess_token();
		String authorization = "Bearer "+access_token;
		
		// http 전송 : RestTemplate
		RestTemplate rt2 = new RestTemplate(); 
		
		// header
		HttpHeaders headers2 = new HttpHeaders();
		// headers2.add("", access_token);
		headers2.add("Authorization", authorization);
		headers2.add("Content-Type", content_type);
		
		//1개로 묶기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest2 = 
				new HttpEntity<>(headers2);
		
		// url
		String oauthUrl2 = "https://kapi.kakao.com/v2/user/me";
		
		//http 전송
		ResponseEntity<String> response2 = 	
				rt2.exchange(oauthUrl2,HttpMethod.POST,kakaoTokenRequest2,String.class);
		
		System.out.println("데이터 출력 : "+response2.getBody());
		
		 // JSON 데이터를 JsonNode로 변환
	    JsonNode kakaoData;
	    try {
	        kakaoData = objectMapper.readTree(response2.getBody());
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "redirect:/login?error=json"; // JSON 변환 오류 시 로그인 페이지로 이동
	    }

	    // 사용자 정보 저장
	    MemberDto member = memberService.kakaoLogin(kakaoData);

	    // 세션에 사용자 정보 저장
	    session.setAttribute("session_id", member);

	    return "redirect:/";
		
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 삭제
		return "main";
	}
	
	
	
	
	
	
	

}
