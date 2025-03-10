package com.java.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.java.dto.kakao.ApproveResponseDto;
import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;
import com.java.repository.MemberRepository;

@Service
public class JellyServiceImpl implements JellyService {
	
	@Autowired MemberRepository memberRepository;
	
	// 카카오페이 측에 요청 시 헤더부에 필요한 값
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "SECRET_KEY DEV500B0E800E2A213C720935A19C90CB688D5EE");
		headers.set("content_type", "application/json");
		return headers;
	}

	@Override // 젤리 구매
	public ResponseEntity<Map> payReady(String jelly, String price, int userId) {
		//데이터 묶기
		Map<String, String> params = new HashMap<>();
		params.put("cid", "TC0ONETIME");
		params.put("partner_order_id", "jelly"+jelly);
		params.put("partner_user_id", ""+userId);
		params.put("item_name", "jelly"+jelly);
		params.put("quantity", String.valueOf(jelly));
		params.put("total_amount", String.valueOf(price));
		params.put("tax_free_amount", "0");
		params.put("approval_url", "http://localhost:8181/jellyshop/buy/completed");
		params.put("fail_url", "http://localhost:8181/jellyshop/buy/fail");
		params.put("cancel_url", "http://localhost:8181/jellyshop/buy/cancel");
		
		 // HttpEntity : HTTP 요청 또는 응답에 해당하는 Http Header와 Http Body를 포함하는 클래스
        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(params, this.getHeaders());
        
     // RestTemplate
        // : Rest 방식 API를 호출할 수 있는 Spring 내장 클래스
        //   REST API 호출 이후 응답을 받을 때까지 기다리는 동기 방식 (json, xml 응답)
        RestTemplate template = new RestTemplate();
        String url = "https://open-api.kakaopay.com/online/v1/payment/ready";
        
        ResponseEntity<Map> response = template.postForEntity(url, requestEntity, Map.class);
        
        return  ResponseEntity.ok(response.getBody());
		
	}

	@Override
	public ApproveResponseDto payApprove(String tid, String pgToken, String partner_order_id, String partner_user_id) {
		Map<String, String> parameters = new HashMap<>();
        parameters.put("cid", "TC0ONETIME");              // 가맹점 코드(테스트용)
        parameters.put("tid", tid);                       // 결제 고유번호
        parameters.put("partner_order_id", partner_order_id); // 주문번호
        parameters.put("partner_user_id", partner_user_id);    // 회원 아이디
        parameters.put("pg_token", pgToken);              // 결제승인 요청을 인증하는 토큰

        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        RestTemplate template = new RestTemplate();
        String url = "https://open-api.kakaopay.com/online/v1/payment/approve";
        ApproveResponseDto approveResponseDto = template.postForObject(url, requestEntity, ApproveResponseDto.class);
        //log.info("결제승인 응답객체: " + approveResponseDto);

        return approveResponseDto;
	}

	@Override // jelly 정보 저장
	public MemberDto updateJelly(int id, int quantity) {
		 MemberEntity member = memberRepository.findById(id)
	                .orElseThrow(() -> new RuntimeException("회원 정보를 찾을 수 없습니다."));
		 int jelly = member.getJelly();
		 member.setJelly(jelly+quantity);
		 memberRepository.save(member);
		 
		 return MemberDto.jelly(member);
	}
	
	
}
