package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.feed.FeedDto;
import com.java.repository.AespaRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AespaRepository aespaRepository;

	@Override
	public List<FeedDto> notilist(String category) {
		 List<FeedDto> list = aespaRepository.findByCategory(category);
		return list;
	}

	@Override // 게시중 게시안함
	public void updateStatus(int bno, String status) {
		FeedDto feed = aespaRepository.findById(bno)
				.orElse(null);
		feed.setStatus(status);
		aespaRepository.save(feed);
	}

	@Override
	public FeedDto notiview(int bno) {
		FeedDto feed = aespaRepository.findById(bno)
				.orElse(null);
		return feed;
	}

	@Override // 삭제
	public void delFeed(int bno) {
		aespaRepository.deleteById(bno);
	}

}
