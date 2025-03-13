package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.feed.FeedDto;

public interface AespaRepository extends JpaRepository<FeedDto, Integer>{

	List<FeedDto> findAllByCategoryOrderByBdateDesc(String category);

	// 관리자페이지
	List<FeedDto> findByCategory(String category);

	// 에그 메인 공지사항
	List<FeedDto> findAllByCategoryAndStatusOrderByBdateDesc(String category, String status);

	// 에그 메인 배너 이미지 가져오기
	List<FeedDto> findByCategoryAndStatus(String string, String string2);

}
