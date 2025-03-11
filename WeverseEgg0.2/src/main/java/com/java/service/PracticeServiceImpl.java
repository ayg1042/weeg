package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.repository.DancePracticeRepository;
import com.java.repository.EntertainmentPracticeRepository;
import com.java.repository.RapPracticeRepository;
import com.java.repository.VocalPracticeRepository;

@Service
public class PracticeServiceImpl implements PracticeService {
	
	@Autowired VocalPracticeRepository vocalPracticeRepository;
	@Autowired DancePracticeRepository dancePracticeRepository;
	@Autowired RapPracticeRepository rapPracticeRepository;
	@Autowired EntertainmentPracticeRepository entertainmentPracticeRepository;
	
	// PRACTICE_ID = 1인 보컬, 댄스, 랩, 예능 연습 데이터 가져오기
	// 보컬
	@Override
	public Object getVocalPracticeByPracticeId(int i) {
		return vocalPracticeRepository.findByPractice_PracticeId(i);
	}
	// 춤
	@Override
	public Object getDancePracticeByPracticeId(int i) {
		return dancePracticeRepository.findByPractice_PracticeId(i);
	}
	// 랩
	@Override
	public Object getRapPracticeByPracticeId(int i) {
		return rapPracticeRepository.findByPractice_PracticeId(i);
	}
	// 예능
	@Override
	public Object getEntertainmentPracticeByPracticeId(int i) {
		return entertainmentPracticeRepository.findByPractice_PracticeId(i);
	}
	

}
