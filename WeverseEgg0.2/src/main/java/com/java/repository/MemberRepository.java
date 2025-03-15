package com.java.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.entity.member.MemberEntity;

import jakarta.transaction.Transactional;

@Repository
public interface MemberRepository extends JpaRepository<MemberEntity, Integer> {

	// sign in 시작 시 이메일 입력 
	Optional<MemberEntity> findByEmail(String email);

	Optional<MemberEntity> findByEmailAndPw(String email, String pw);
	
	
	

}
