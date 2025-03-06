package com.java.service.member;

import java.util.Optional;

import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;

public interface MemberService {

	// singin 시작 시 이메일 입력 
	MemberDto findByEmail(String email);

	boolean createAccount(String email, String pw, String nickname);

	MemberDto findByEmailAndPw(String email, String pw);


}
