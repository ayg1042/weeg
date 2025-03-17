package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.feed.FeedDto;

import jakarta.transaction.Transactional;

public interface FeedRepository extends JpaRepository<FeedDto, Integer>{

	@Transactional
	void deleteByMember_UserId(int userId);

	List<FeedDto> findAllByMember_UserId(int user_id);
	
}
