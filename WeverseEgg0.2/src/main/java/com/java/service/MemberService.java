package com.java.service;

import java.util.Optional;

import com.fasterxml.jackson.databind.JsonNode;
import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;

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

<<<<<<< HEAD
	// 추가 캐릭터 슬롯 구매
=======
>>>>>>> refs/remotes/origin/master
	void buyCharacter(int id);

}
