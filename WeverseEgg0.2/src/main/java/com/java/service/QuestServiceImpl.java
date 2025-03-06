package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.dto.quest.QuestDto;
import com.java.entity.quest.QuestEntity;
import com.java.repository.QuestRepository;

@Transactional
@Service
public class QuestServiceImpl implements QuestService {
	
	@Autowired QuestRepository questRepository;

	@Override // 퀘스트 전체 리스트 가져오기
	public List<QuestDto> findAll() {
		// 엔티티 리스트를 가져오기
		List<QuestEntity> list = questRepository.findAll();
		// DTO 리스트 생성
		List<QuestDto> dtoList = new ArrayList<>();
		
		// QuestDto에서 엔티티를 보내 DTO로 변환하여
		// 받아온 dto 리스트를 새로운 dto 리스트에 추가
		for (QuestEntity entity : list) {
			QuestDto dto = QuestDto.qlist(entity);
			dtoList.add(dto);
		}
		
		return dtoList;
	}
	
}
