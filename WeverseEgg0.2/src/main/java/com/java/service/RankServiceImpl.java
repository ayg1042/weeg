package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.character.CharacterDto;
import com.java.entity.character.CharacterEntity;
import com.java.repository.CharacterRepository;

@Service
public class RankServiceImpl implements RankService {
	
	@Autowired CharacterRepository characterRepository;
	
	// 랭크 계산하기
	public List<CharacterDto> getRankedCharacterList() {
        // 1. DB에서 인기순으로 캐릭터 목록 가져오기
        //List<CharacterDto> characterList = characterRepository.findAllRanked();

        // 2. 순위 계산 (1등부터 차례로 랭크 설정)
//        int rank = 1;
//        for (CharacterDto character : characterList) {
//            character.setRank(rank++);
//        }

//        return characterList;
		return null;
    }

//	@Override
//	public List<CharacterDto> findAll(String group) {
//		//List<CharacterEntity> list = 
//		return null;
//	}

}
