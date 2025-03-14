package com.java.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;


public interface AdminService {

	List<FeedDto> notilist(String category);

	FeedDto notiview(int bno);

	// 게시중 게시안함
	void updateStatus(int bno, String status);

	// 글 삭제
	void delFeed(int bno);

	// 공지 글 작성
	void notiWrite(String title, String content, MultipartFile file, String category, MemberDto member);

	// 공지 글 수정
	void notiModi(String title, String content, MultipartFile file, int bno);

	// 이벤트 글 작성
	void eventWrite(String title, String content, MultipartFile file, MultipartFile fileb, MultipartFile filem,
			String category, MemberDto member);

	// 이벤트 글 수정
	void eventModi(String title, String content, MultipartFile file, MultipartFile fileb, MultipartFile filem, int bno,
			boolean delfile, boolean delfileb, boolean delfilem);


}
