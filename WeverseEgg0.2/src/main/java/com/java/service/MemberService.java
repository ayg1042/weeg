package com.java.service;

import java.util.List;
import java.util.Optional;

import com.fasterxml.jackson.databind.JsonNode;
import com.java.dto.character.CharacterDto;
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

	// 회원전체리스트
	List<MemberDto> findAll();

	// 회원 1명 정보 가져오기
	MemberDto findByUserId(int user_id);

	// 회원삭제
	void deleteById(int userId);

}
