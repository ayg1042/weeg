package com.java.service;

import java.util.List;

import com.java.dto.character.CharacterDto;
import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;

public interface AespaService {

	// 랭크매기기
	void getRankedCharacterList(String GroupKor);
	
	// 순위대로 정렬된 리스트
	List<CharacterDto> findAll(String GroupKor);

	// 에스파 피드
	void newfeed(MemberDto memberDto, String feedWrite);

	// 피드 리스트 가져오기
	List<FeedDto> feedlist();

}
