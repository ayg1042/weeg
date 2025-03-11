package com.java.service;

import java.util.Map;
import java.util.List;
import java.util.ArrayList;

import com.java.entity.character.CharacterEntity;
import com.java.dto.character.CharacterDto;
import com.java.dto.practice.VocalPracticeDto;

public interface CharacterService {
	
	// 캐릭터 선택 페이지 열기
	List<CharacterDto> getCharactersByUserId(int user_id);

	// 캐릭터 생성, 닉네임 저장
	void save(CharacterEntity character);
	
	CharacterDto getCharacterByCharacterId(int characterId);

	// 임시_ 로그인한 유저의 캐릭터 테이블 가져오기
	CharacterDto unit(int i);

	// 유저가 연습생일때의 트래이닝 가져오기(artist가 윈터이면 PracticeId = 1)
	Map<String, Object> getPracticeIfArtistIsBasic(CharacterDto character);

	// 보컬트레이닝 결과 유저 캐릭터에 저장
	void vocalTrainSave(int vocalScore, int health, int fatigue, int price, int character_id);
	
	// 댄스트레이닝 결과 유저 캐릭터에 저장
	void danceTrainSave(int character_id, int danceScore, int health, int fatigue, int price);

	// 랩트레이닝 결과 유저 캐릭터에 저장
	void rapTrainSave(int character_id, int rapScore, int health, int fatigue, int price);

	// 예능트레이닝 결과 유저 캐릭터에 저장
	void entTrainSave(int character_id, int entScore, int health, int fatigue, int price);

	// 음악방송출연 결과 유저 캐릭터에 저장
	void music_actvity_save(int character_id, int health, int fatigue, int price);

	// 예능출연 결과 유저 캐릭터에 저장
	void ent_actvity(int character_id, int health, int fatigue, int price);

	// 콘서트개최 결과 유저 캐릭터에 저장
	void con_actvity(int character_id, int health, int fatigue, int price);

	// 팬사인회 결과 유저 캐릭터에 저장
	void sign_actvity(int character_id, int health, int fatigue, int price);





}
