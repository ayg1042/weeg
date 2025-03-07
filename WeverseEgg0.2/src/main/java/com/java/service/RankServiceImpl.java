package com.java.service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.character.CharacterDto;
import com.java.entity.character.CharacterEntity;
import com.java.repository.CharacterRepository;

@Service
public class RankServiceImpl implements RankService {
	
	@Autowired CharacterRepository characterRepository;
	
	// 랭크 계산하기
	public void getRankedCharacterList(String GroupKor) {
        // 1. DB에서 그룹명이 에스파인 캐릭터 목록 가져오기
        List<CharacterEntity> characterList = characterRepository.findAllByGroupName(GroupKor);
        
     // 인기 + 매력 합산 후 정렬 (내림차순)
        List<CharacterEntity> sortedList = characterList.stream()
            .sorted((c1, c2) -> Integer.compare(
                (c2.getPopularity() + c2.getCharm()), 
                (c1.getPopularity() + c1.getCharm())
            ))
            .collect(Collectors.toList());

        // 랭크 반영
        int rank = 1;
        for (CharacterEntity entity : sortedList) {
            entity.setRank(rank++);
            characterRepository.save(entity);
        }
    }

	@Override
	public List<CharacterDto> findAll(String GroupKor) {
		List<CharacterEntity> characterList = characterRepository.findAllByGroupName(GroupKor);
				
		// 순위를 기준으로 내림차순 정렬 (rank가 높은 순서대로)
	    return characterList.stream()
	        .sorted(Comparator.comparingInt(CharacterEntity::getRank))  // rank 기준 내림차순 정렬
	        .map(CharacterDto::rank)  // CharacterEntity를 CharacterDto로 변환
	        .collect(Collectors.toList());
	}


}
