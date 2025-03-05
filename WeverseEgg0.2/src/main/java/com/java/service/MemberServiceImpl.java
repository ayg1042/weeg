package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.java.repository.MemberRepository;

public class MemberServiceImpl implements MemberService {
	@Autowired MemberRepository memberRepository;
}
