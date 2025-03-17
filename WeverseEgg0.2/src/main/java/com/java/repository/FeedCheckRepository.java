package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.feed.FeedCheckDto;

public interface FeedCheckRepository extends JpaRepository<FeedCheckDto, Integer> {

	List<FeedCheckDto> findAllByMember_UserId(int user_id);

}
