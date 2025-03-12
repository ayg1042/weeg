package com.java.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.java.dto.member.MemberDto;

public interface MemberService {

	// singin 시작 시 이메일 입력 
	MemberDto findByEmail(String email);

	// 회원가입
	boolean createAccount(String email, String pw, String nickname);

	// 로그인 아이디 비번 확인
	MemberDto findByEmailAndPw(String email, String pw);

	// 카카오 로그인
	MemberDto kakaoLogin(JsonNode kakaoData);

	// 젤리 정보 가져오기
	int getByJelly(int id);

	// 추가 캐릭터 슬롯 구매
	void buyCharacter(int id);

}
