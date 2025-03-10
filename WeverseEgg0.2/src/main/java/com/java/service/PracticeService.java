package com.java.service;

public interface PracticeService {
	
	// PRACTICE_ID = 1인 보컬, 댄스, 랩, 예능 연습 데이터 가져오기
	Object getVocalPracticeByPracticeId(int i);
	Object getDancePracticeByPracticeId(int i);
	Object getRapPracticeByPracticeId(int i);
	Object getEntertainmentPracticeByPracticeId(int i);

}
