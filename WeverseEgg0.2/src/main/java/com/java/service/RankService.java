package com.java.service;

import java.util.List;

import com.java.dto.character.CharacterDto;

public interface RankService {

	// 랭크매기기
	void getRankedCharacterList(String GroupKor);
	
	// 순위대로 정렬된 리스트
	List<CharacterDto> findAll(String GroupKor);

}
