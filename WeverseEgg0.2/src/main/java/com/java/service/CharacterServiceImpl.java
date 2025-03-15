package com.java.service;

import java.util.HashMap;
import java.util.Map;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.character.CharacterDto;
import com.java.dto.practice.DancePracticeDto;
import com.java.dto.practice.EntertainmentPracticeDto;
import com.java.dto.practice.RapPracticeDto;
import com.java.dto.practice.VocalPracticeDto;
import com.java.entity.character.ArtistEntity;
import com.java.entity.character.CharacterEntity;
import com.java.entity.group.ArtistNameEntity;
import com.java.entity.group.GroupEntity;
import com.java.entity.practice.DancePracticeEntity;
import com.java.entity.practice.EntertainmentPracticeEntity;
import com.java.entity.practice.RapPracticeEntity;
import com.java.entity.practice.VocalPracticeEntity;
import com.java.repository.ArtistNameRepository;
import com.java.repository.ArtistRepository;
import com.java.repository.CharacterRepository;
import com.java.repository.GroupRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class CharacterServiceImpl implements CharacterService {
	
	@Autowired HttpSession session;
	@Autowired CharacterRepository characterRepository;
	@Autowired PracticeService practiceService;
	@Autowired ArtistRepository artistRepository;
	@Autowired GroupRepository groupRepository;

	// 캐릭터 선택 페이지 열기
	@Override
	public List<CharacterDto> getCharactersByUserId(int user_id) {
		String User_id = Integer.toString(user_id);
		List<CharacterEntity> list = characterRepository.findByMemberUserId(user_id);
		if (list.isEmpty()) {
			return null;
		}
		List<CharacterDto> dtoList = new ArrayList<>();
		for (CharacterEntity entity : list) {
			CharacterDto dto = CharacterDto.from(entity);
			dtoList.add(dto);
		}
		return dtoList;
	}


	// 캐릭터 생성, 닉네임 저장
	@Override
	public CharacterEntity save(CharacterEntity character) {
		GroupEntity group = groupRepository.findById(1).orElseThrow();
		ArtistNameEntity artistN = new ArtistNameEntity();
		artistN.setArtistNId(1);
		artistN.setGroup(group);
		artistN.setArtistName("연습생");
		ArtistEntity entity = new ArtistEntity();
		entity.setArtistName(artistN);
		entity.setBlueMark(0);
		entity.setDebutDate(new Timestamp(System.currentTimeMillis()));
		artistRepository.save(entity);
		List<ArtistEntity> artistList = artistRepository.findAll();
		character.setArtist(artistList.get(artistList.size()-1));
		characterRepository.save(character);
		return character;
		
	}

	@Override
	public CharacterDto getCharacterByCharacterId(int characterId) {
		CharacterEntity entity = characterRepository.getById(characterId);
		CharacterDto dto = CharacterDto.from(entity);
		return dto;
	}

	// 임시_ 로그인한 유저의 캐릭터 테이블 가져오기
	@Override
	public CharacterDto unit(int i) {
		CharacterEntity unitEntity = characterRepository.findByCharacterId(i);
		CharacterDto unitDto = CharacterDto.unit(unitEntity);
		return unitDto;
	}

	// 유저가 연습생일때의 트래이닝 가져오기(artist가 윈터이면 PracticeId = 1)
	@Override
	public Map<String, Object> getPracticeIfArtistIsBasic(CharacterDto character) {

		// 세션에 저장된 캐릭터 정보가 없으면 빈 맵 반환
		if (character == null || character.getArtist().getArtistName().getArtistName() == null) {
			return new HashMap<>();
		}
		// ArtistName이 "윈터(연습생)"인지 확인
		if ("연습생".equals(character.getArtist().getArtistName().getArtistName())) {
			Map<String, Object> basicPracticeMap = new HashMap<>();

			// PRACTICE_ID = 1인 보컬, 댄스, 랩, 예능 연습 데이터 가져오기
			VocalPracticeEntity vpEntity = (VocalPracticeEntity) practiceService.getVocalPracticeByPracticeId(1);
			VocalPracticeDto vocalDto = VocalPracticeDto.pt_info(vpEntity);
			DancePracticeEntity dpEntity = (DancePracticeEntity) practiceService.getDancePracticeByPracticeId(1);
			DancePracticeDto danceDto = DancePracticeDto.pt_info(dpEntity);
			RapPracticeEntity rpEntity = (RapPracticeEntity) practiceService.getRapPracticeByPracticeId(1);
			RapPracticeDto rapDto = RapPracticeDto.pt_info(rpEntity);
			EntertainmentPracticeEntity epEntity = (EntertainmentPracticeEntity) practiceService
					.getEntertainmentPracticeByPracticeId(1);
			EntertainmentPracticeDto entertainmentDto = EntertainmentPracticeDto.pt_info(epEntity);
			System.out.println("ddddddddddd   " + danceDto);
			basicPracticeMap.put("vocalDto", vocalDto);
			basicPracticeMap.put("danceDto", danceDto);
			basicPracticeMap.put("rapDto", rapDto);
			basicPracticeMap.put("entertainmentDto", entertainmentDto);

			return basicPracticeMap;
		}

		return new HashMap<>(); // artist가 "윈터"가 아니면 빈 맵 반환
	}

	// 보컬연습결과 유저 캐릭터에 저장
	@Override
	@Transactional
	public void vocalTrainSave(int character_id, int vocalScore, int health, int fatigue, int price) {
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		System.out.println(character.getCharacterId());
		System.out.println(character_id);
		System.out.println(vocalScore);
		System.out.println(health);
		System.out.println(fatigue);
		System.out.println(price);
		System.out.println(character.getHealth());
		character.setVocal(character.getVocal() + vocalScore);
		character.setHealth(character.getHealth() - health);
		character.setFatigue(character.getFatigue() + fatigue);
		character.setCoin(character.getCoin() - price);
		System.out.println(character.getHealth());
		CharacterDto characterDto = CharacterDto.unit(character);
		session.setAttribute("character", characterDto);
	}

	// 댄스 트레이닝 결과 유저 캐릭터에 저장
	@Override
	@Transactional
	public void danceTrainSave(int character_id, int danceScore, int health, int fatigue, int price) {
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		character.setDance(character.getDance() + danceScore);
		character.setHealth(character.getHealth() - health);
		character.setFatigue(character.getFatigue() + fatigue);
		character.setCoin(character.getCoin() - price);
		CharacterDto characterDto = CharacterDto.unit(character);
		session.setAttribute("character", characterDto);
	}

	// 랩트레이닝 결과 유저 캐릭터에 저장
	@Override
	@Transactional
	public void rapTrainSave(int character_id, int rapScore, int health, int fatigue, int price) {
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		character.setRap(character.getRap() + rapScore);
		character.setHealth(character.getHealth() - health);
		character.setFatigue(character.getFatigue() + fatigue);
		character.setCoin(character.getCoin() - price);
		CharacterDto characterDto = CharacterDto.unit(character);
		session.setAttribute("character", characterDto);
	}

	// 예능트레이닝 결과 유저 캐릭터에 저장
	@Override
	@Transactional
	public void entTrainSave(int character_id, int entScore, int health, int fatigue, int price) {
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		character.setEntertainment(character.getEntertainment() + entScore);
		character.setHealth(character.getHealth() - health);
		character.setFatigue(character.getFatigue() + fatigue);
		character.setCoin(character.getCoin() - price);
		CharacterDto characterDto = CharacterDto.unit(character);
		session.setAttribute("character", characterDto);
	}

	// 음악방송출연 결과 유저 캐릭터에 저장
	@Override
	@Transactional
	public void music_actvity_save(int character_id, int health, int fatigue, int price) {
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		// 인기도
		int userPop = character.getPopularity();
		// 유저 스탯 합
		int userStat = character.getVocal() + character.getDance() + character.getDance()
				+ character.getEntertainment();
		// 유저 매력도
		int userCharm = character.getCharm();
		// 유저스탯의 합으로 인기도 산출
		if (userStat > 0 && userStat <= 200) {
			userPop += userStat * 0.1;
			userPop += userCharm * 0.2;
		} else if (userStat > 200) {
			userPop += userStat * 0.2;
			userPop += userCharm * 0.3;
		}
		character.setHealth(character.getHealth() - health);
		character.setFatigue(character.getFatigue() + fatigue);
		character.setCoin(character.getCoin() - price);
		character.setPopularity(userPop);
		CharacterDto characterDto = CharacterDto.unit(character);
		session.setAttribute("character", characterDto);
	}

	// 예능출연 결과 유저 캐릭터에 저장
	@Override
	@Transactional
	public void ent_actvity(int character_id, int health, int fatigue, int price) {
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		// 인기도
		int userPop = character.getPopularity();
		// 유저 스탯 합
		int userStat = character.getVocal() + character.getDance() + character.getRap() + character.getEntertainment();
		// 유저 매력도
		int userCharm = character.getCharm();
		// 유저스탯의 합으로 인기도 산출
		if (userStat > 0 && userStat <= 400) {
			userPop += userStat * 0.2;
			userPop += userCharm * 0.3;
		} else if (userStat > 400) {
			userPop += userStat * 0.3;
			userPop += userCharm * 0.4;
		}
		character.setHealth(character.getHealth() - health);
		character.setFatigue(character.getFatigue() + fatigue);
		character.setCoin(character.getCoin() - price);
		character.setPopularity(userPop);
		CharacterDto characterDto = CharacterDto.unit(character);
		session.setAttribute("character", characterDto);
	}

	// 콘서트개최 결과 유저 캐릭터에 저장
	@Override
	@Transactional
	public void con_actvity(int character_id, int health, int fatigue, int price) {
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		// 인기도
		int userPop = character.getPopularity();
		// 유저 스탯 합
		int userStat = character.getVocal() + character.getDance() + character.getRap() + character.getEntertainment();
		// 유저 매력도
		int userCharm = character.getCharm();
		// 유저스탯의 합으로 인기도 산출
		if (userStat > 0 && userStat <= 400) {
			userPop += userStat * 0.2;
			userPop += userCharm * 0.3;
		} else if (userStat > 400) {
			userPop += userStat * 0.3;
			userPop += userCharm * 0.4;
		}
		character.setHealth(character.getHealth() - health);
		character.setFatigue(character.getFatigue() + fatigue);
		character.setCoin(character.getCoin() - price);
		character.setPopularity(userPop);
		CharacterDto characterDto = CharacterDto.unit(character);
		session.setAttribute("character", characterDto);

	}

	// 팬사인회 결과 유저 캐릭터에 저장
	@Override
	@Transactional
	public void sign_actvity(int character_id, int health, int fatigue, int price) {
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		// 인기도
		int userPop = character.getPopularity();
		// 유저 스탯 합
		int userStat = character.getVocal() + character.getDance() + character.getRap() + character.getEntertainment();
		// 유저 매력도
		int userCharm = character.getCharm();
		// 유저스탯의 합으로 인기도 산출
		if (userStat > 0 && userStat <= 400) {
			userPop += userStat * 0.2;
			userPop += userCharm * 0.3;
		} else if (userStat > 400) {
			userPop += userStat * 0.3;
			userPop += userCharm * 0.4;
		}
		character.setHealth(character.getHealth() - health);
		character.setFatigue(character.getFatigue() + fatigue);
		character.setCoin(character.getCoin() - price);
		character.setPopularity(userPop);
		CharacterDto characterDto = CharacterDto.unit(character);
		session.setAttribute("character", characterDto);
	}

	@Override
	@Transactional
	public void updateCoin(int character_id, int rewardCoin) {
		System.out.println("캐릭터 코인 업데이트 시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(character_id);
		System.out.println(rewardCoin);

		// 현재 캐릭터 가져오기
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		System.out.println(character);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

		if (character != null) {
			// 코인 업데이트
			character.setCoin(character.getCoin() + rewardCoin);

			// 저장 (JPA의 @Transactional 덕분에 자동 반영됨)
// 	        characterRepository.save(character);

			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!" + character.getCoin());

			// DTO 변환 후 세션 저장
			CharacterDto characterDto = CharacterDto.unit(character);
			System.out.println("캐릭터 코인 업데이트 완료!!!!!!!!!!!!!!!: " + characterDto);
			session.setAttribute("character", characterDto);
		}
	}

	@Override
	public Integer getUserCoin(int character_id) {
		// 해당 유저의 캐릭터 정보 가져오기
		CharacterEntity character = characterRepository.findByCharacterId(character_id);
		// 캐릭터가 존재하면 코인 반환, 없으면 0 반환
		return (character != null) ? character.getCoin() : 0;
	}

	// 위버스 마이페이지 캐릭터 삭제
	@Override
	public void deleteCharacterById(int characterId) {
		characterRepository.deleteCharacterByCharacterId(characterId);

	}
	
	// 레벨 캐릭터db 저장
//	@Override
//	public void lvSave(int character_id, int level) {
//		ArtistEntity entity = artistRepository.findByArtistId(character_id);
//		entity.setClevel(level);
//		artistRepository.save(entity);
//		CharacterEntity character = characterRepository.findBycharacterId(character_id);
//		CharacterDto characterDto = CharacterDto.unit(character);
//		session.setAttribute("character", characterDto);
//		
//	}

	




}
