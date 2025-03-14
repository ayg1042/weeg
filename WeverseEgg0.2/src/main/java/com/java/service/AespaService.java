package com.java.service;

import java.util.ArrayList;
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
	
	// 자유게시판 게시글 저장
	void weBoardWrite(FeedDto fdto);

	// 위버스에그 자유게시판 페이지
	List<FeedDto> findAll();

	// 위버스에그 자유게시판 뷰페이지
	FeedDto findById(int bno);

	// 공지사항 리스트 가져오기
	List<FeedDto> notilist(String category, String status);

	// 공지사항 뷰페이지
	FeedDto notiview(int bno);

	// egg main 배너 이미지 가져오기
	List<FeedDto> bannerlist();

}
