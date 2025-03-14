package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.feed.FeedDto;

import jakarta.transaction.Transactional;

public interface FeedRepository extends JpaRepository<FeedDto, Integer>{
	
	/*
	 * @Modifying
	 * 
	 * @Transactional
	 * 
	 * @Query("DELETE FROM Feed f WHERE f.member.userId = :userId") void
	 * deleteFeedByMemberId(@Param("userId") int userId);
	 */

	
}
