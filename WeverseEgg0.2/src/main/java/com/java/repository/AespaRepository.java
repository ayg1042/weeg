package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.feed.FeedDto;

public interface AespaRepository extends JpaRepository<FeedDto, Integer>{

	List<FeedDto> findAllByCategoryOrderByBdateDesc(String category);

	// 관리자페이지
	List<FeedDto> findByCategory(String category);

	List<FeedDto> findAllByOrderByBnoDesc();  // bno 기준 내림차순 정렬
}
