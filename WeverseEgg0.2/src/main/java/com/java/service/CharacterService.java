package com.java.service;

import java.util.List;

import com.java.dto.character.CharacterDto;

public interface CharacterService {

	// 캐릭터 선택 페이지 열기
	List<CharacterDto> getCharactersByUserId(int user_id);

}
