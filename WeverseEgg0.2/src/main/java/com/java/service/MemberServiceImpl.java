package com.java.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.java.dto.character.CharacterDto;
import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;
import com.java.repository.FeedRepository;
import com.java.repository.MemberRepository;

import jakarta.transaction.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired MemberRepository memberRepository;
	@Autowired FeedRepository feedRepository;
	

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
	
	@Transactional
    public MemberDto kakaoLogin(JsonNode kakaoData) {
        // 카카오 ID와 닉네임 가져오기
        Long kakaoId = kakaoData.get("id").asLong();
        String nickname = kakaoData.get("kakao_account").get("profile").get("nickname").asText();

        // 가짜 이메일 생성 (실제 이메일이 제공되지 않는 경우)
        String email = kakaoId + "@kakao.com";

        // 기존 회원인지 확인
        MemberEntity member = memberRepository.findByEmail(email).orElse(null);

        if (member == null) {
            // 새로운 회원 생성
            member = new MemberEntity();
            member.setEmail(email);
            member.setPw("1111"); // 비밀번호는 사용하지 않음 (소셜 로그인 전용)
            member.setNickname(nickname);
            member.setJelly(0);

            memberRepository.save(member);
        }

        // DTO 변환 후 반환(이메일, 닉네임만)
        return MemberDto.kakaojoin(member);
    }


	@Override // 젤리샵에서 정보 가져오기
	public int getByJelly(int id) {
		MemberEntity member = memberRepository.findById(id)
				.orElse(null);
		MemberDto.jelly(member);
		int jelly = member.getJelly();
		return jelly;
	}


	@Override // 뉴 캐릭터 슬롯 구매
	public void buyCharacter(int id) {
		MemberEntity member = memberRepository.findById(id)
				.orElse(null);
		
		int jelly = member.getJelly();
		member.setJelly(jelly-30);
		
		memberRepository.save(member);
	}



	// 회원전체리스트
	@Override
	public List<MemberDto> findAll() {
		List<MemberEntity> memEntity = memberRepository.findAll();
		List<MemberDto> mdto = MemberDto.list(memEntity);
		return mdto;
	}


	// 회원 1명 정보 가져오기
	@Override
	public MemberDto findByUserId(int user_id) {
		MemberEntity entity = memberRepository.findById(user_id)
				.orElseThrow(()-> new IllegalArgumentException("가입되지 않은 유저입니다."));
		MemberDto mdto = MemberDto.login(entity);
		return mdto;
	}


	/*
	 * // 회원삭제
	 * 
	 * @Override public void deleteById(int userId) {
	 * feedRepository.deleteFeedByMemberId(userId);
	 * memberRepository.deleteById(userId); }
	 */


	








}
