package com.java.service;

import java.util.List;

import com.java.dto.character.CharacterDto;
import com.java.entity.character.CharacterEntity;

public interface CharacterService {
	
	Integer getCoin(Integer userId);

	void updateCoin(Integer userId, int newCoin);

	// 캐릭터 선택 페이지 열기
	List<CharacterDto> getCharactersByUserId(int user_id);

	// 캐릭터 생성, 닉네임 저장
	void save(CharacterEntity character);

}