package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.practice.VocalPracticeEntity;

public interface VocalPracticeRepository extends JpaRepository<VocalPracticeEntity, Integer>{

	// PRACTICE_ID = 1인 보컬, 댄스, 랩, 예능 연습 데이터 가져오기
	// 보컬s
	Object findByPractice_PracticeId(int i);

}
