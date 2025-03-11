package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.character.CharacterDto;
import com.java.entity.character.CharacterEntity;
import com.java.repository.CharacterRepository;

import jakarta.transaction.Transactional;

@Service
public class CharacterServiceImpl implements CharacterService {
	
	@Autowired CharacterRepository characterRepository;

	// 캐릭터 선택 페이지 열기
		@Override
		public List<CharacterDto> getCharactersByUserId(int user_id) {
			String User_id = Integer.toString(user_id);
			List<CharacterEntity> list = characterRepository.findByMemberUserId(user_id);
			if(list.isEmpty()) {
				return null;
			}
			List<CharacterDto> dtoList = new ArrayList<>();
			for(CharacterEntity entity : list) {
				CharacterDto dto = CharacterDto.from(entity);
				dtoList.add(dto);
			}
			return dtoList;	
		}

		// 캐릭터 생성, 닉네임 저장
		@Override
		public void save(CharacterEntity character) {
			characterRepository.save(character);
			
		}

	@Override
	public CharacterDto getCharacterByCharacterId(int characterId) {
		CharacterEntity entity = characterRepository.getById(characterId);
		CharacterDto dto = CharacterDto.from(entity);
		return dto;
	}

    @Override
    public Integer getCoin(Integer userId) {
        return characterRepository.findCoinByUserId(userId);
    }

    @Override
    @Transactional
    public void updateCoin(Integer userId, int newCoin) {
        characterRepository.updateCoinByUserId(userId, newCoin);
    }
}
