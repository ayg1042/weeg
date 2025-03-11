package com.java.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.java.dto.member.MemberDto;

public interface MemberService {

	// singin 시작 시 이메일 입력 
	MemberDto findByEmail(String email);

	boolean createAccount(String email, String pw, String nickname);

	MemberDto findByEmailAndPw(String email, String pw);

	MemberDto kakaoLogin(JsonNode kakaoData);

	int getByJelly(int id);

}
