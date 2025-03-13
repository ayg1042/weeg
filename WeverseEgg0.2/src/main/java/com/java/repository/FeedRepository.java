package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.feed.FeedDto;

public interface FeedRepository extends JpaRepository<FeedDto, Integer>{

	
}
