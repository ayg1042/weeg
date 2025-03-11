package com.java.service;

import java.util.Optional;

import com.fasterxml.jackson.databind.JsonNode;
import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;

public interface MemberService {

	// singin 시작 시 이메일 입력 
	MemberDto findByEmail(String email);

	boolean createAccount(String email, String pw, String nickname);

	MemberDto findByEmailAndPw(String email, String pw);

	MemberDto kakaoLogin(JsonNode kakaoData);

	int getByJelly(int id);

	void buyCharacter(int id);

}
