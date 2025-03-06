package com.java.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;
import com.java.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired MemberRepository memberRepository;
	

	@Override // singin 시작 시 이메일 입력 
	public MemberDto findByEmail(String email) {
	    MemberEntity memberEntity = memberRepository.findByEmail(email)
	            .orElse(null); // 데이터가 없으면 null 반환

	    if (memberEntity == null) {
	        return null; // MemberEntity가 null인 경우, DTO도 null 반환
	    }

	    return MemberDto.Email(memberEntity); // 존재하는 경우 DTO로 변환하여 반환
	}


	@Override // 회원가입
	public boolean createAccount(String email, String pw, String nickname) {
		MemberDto memberDto = new MemberDto();
		memberDto.setEmail(email);
		memberDto.setPw(pw);
		memberDto.setNickname(nickname);
		
		// MemberDto를 MemberEntity로 변환
	    MemberEntity memberEntity = MemberEntity.join(memberDto);

        memberRepository.save(memberEntity); // DB에 저장
        return true; // 회원가입 성공
	}


	@Override // 로그인
	public MemberDto findByEmailAndPw(String email, String pw) {
		MemberEntity memberEntity = memberRepository.findByEmailAndPw(email, pw)
				.orElse(null); // 데이터가 없으면 null 반환
		
		if (memberEntity == null) {
	        return null; // MemberEntity가 null인 경우, DTO도 null 반환
	    }

	    return MemberDto.login(memberEntity);
		
	}



}
