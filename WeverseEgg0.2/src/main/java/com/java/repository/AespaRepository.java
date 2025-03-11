package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.feed.FeedDto;

public interface AespaRepository extends JpaRepository<FeedDto, Integer>{

	List<FeedDto> findAllByOrderByBdateDesc();

}
