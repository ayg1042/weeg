package com.java.service;

import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;

import com.java.dto.kakao.ApproveResponseDto;
import com.java.dto.member.MemberDto;

public interface JellyService {

	ResponseEntity<Map> payReady(String jelly, String price, int userId);

	ApproveResponseDto payApprove(String tid, String pgToken, String partner_order_id, String partner_user_id);

	MemberDto updateJelly(int id, int quantity);
	

}
