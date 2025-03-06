package com.java.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.member.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, Integer>{
	
	// singin 시작 시 이메일 입력 
		Optional<MemberEntity> findByEmail(String email);

		Optional<MemberEntity> findByEmailAndPw(String email, String pw);

}
