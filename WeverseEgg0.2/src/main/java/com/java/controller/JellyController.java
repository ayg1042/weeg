package com.java.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/jellyshop")
public class JellyController {
	
	@GetMapping("/buy")
	public String buyjelly() {
	String Authorization = "SECRET_KEYtbSI4E56ixn0Pr8fSyrCt5mDigg0VOST";
	String redirect_uri = "http://localhost:8181/jellyshop/buy";
	String content_type = " application/json";
	
	// http 전송 : restTemplate
	RestTemplate rt = new RestTemplate();
	
	// header
	HttpHeaders headers = new HttpHeaders();
	headers.set("Authorization", Authorization);
	headers.set("content_type", content_type);
	
	//데이터 묶기
	Map<String, Object> params = new HashMap<>();
	params.put("cid", "TC0ONETIME");
	params.put("partner_order_id", "partner_order_id");
	params.put("partner_user_id", "partner_user_id");
	params.put("item_name", "jelly4");
	params.put("quantity", "1");
	params.put("total_amount", "1200");
	params.put("vat_amount", "0");
	params.put("tax_free_amount", "0");
	params.put("approval_url", "http://localhost:8181/jellyshop/buy");
	params.put("fail_url", "http://localhost:8181/jellyshop/buy/fail");
	params.put("cancel_url", "http://localhost:8181/jellyshop/buy/cancel");

	System.out.println(headers);
	
	return "main";
	
	}
	
}
