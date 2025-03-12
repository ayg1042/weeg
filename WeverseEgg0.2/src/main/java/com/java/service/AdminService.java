package com.java.service;

import java.util.List;

import com.java.dto.feed.FeedDto;


public interface AdminService {

	List<FeedDto> notilist(String category);

	FeedDto notiview(int bno);

	// 게시중 게시안함
	void updateStatus(int bno, String status);

	void delFeed(int bno);


}
