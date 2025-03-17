package com.java.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.dto.quest.QuestDto;
import com.java.entity.quest.QuestEntity;
import com.java.entity.quest.QuestHistoryEntity;
import com.java.repository.QuestHistoryRepository;
import com.java.repository.QuestRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Transactional
@Service
public class QuestServiceImpl implements QuestService {
	
	@PersistenceContext
    private EntityManager entityManager;  // EntityManager를 주입
    
    @Autowired
    QuestRepository questRepository;
    @Autowired
    QuestHistoryRepository questHistoryRepository;

    @Override // 퀘스트 전체 리스트 가져오기
    public List<QuestDto> findAll() {
        // 엔티티 리스트를 가져오기
    	List<QuestEntity> list = questRepository.findAll(Sort.by(Sort.Direction.ASC, "questId"));
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

    @Override
    public Integer getRewardCoin(int questId) {
        return questRepository.findCoinByQuestId(questId);
    }

    // 주기적으로 퀘스트 보상 상태를 갱신하는 메서드
    @Scheduled(cron = "0 0 0 * * *") // 매일 자정에 실행
    @Override
    public void updateQuestRewards() {
        // 현재 날짜 구하기
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

     // 모든 퀘스트 히스토리를 확인하여 하루가 지난 퀘스트의 보상 상태를 갱신
        List<QuestHistoryEntity> questHistoryList = questHistoryRepository.findAll();  // 반환 타입은 List<QuestHistoryEntity>이어야 함

        for (QuestHistoryEntity history : questHistoryList) {
            // 퀘스트 완료 일자와 현재 날짜 비교
            long diffInMillies = currentTimestamp.getTime() - history.getCompletionDate().getTime();
            long diffDays = diffInMillies / (24 * 60 * 60 * 1000);

            // 하루가 지나면 보상 상태를 0으로 갱신
            if (diffDays > 1 && history.getIsRewarded() == 1) {
                history.setIsRewarded(0);  // 보상 상태를 미지급으로 설정
                questHistoryRepository.save(history);
            }
        }
    }
    
    
    @Override
    public void saveQuest(QuestDto questDto) {
        // 먼저, 퀘스트 ID로 존재하는 엔티티를 조회합니다.
        Optional<QuestEntity> optionalQuest = questRepository.findById(questDto.getQuestId());

        if (optionalQuest.isPresent()) {
            // ID가 존재하면, 해당 엔티티를 업데이트합니다.
            QuestEntity questEntity = optionalQuest.get();
            questEntity.setTitle(questDto.getTitle());
            questEntity.setContent(questDto.getContent());
            questEntity.setCoin(questDto.getCoin());

            // 엔티티를 저장하여 업데이트 처리 (save()를 사용하면 Hibernate가 자동으로 버전 필드를 관리합니다)
            questRepository.save(questEntity);  // 업데이트 처리
            questRepository.flush();  // DB에 즉시 반영
        } else {
            // 새로운 퀘스트 엔티티 생성
            QuestEntity newQuestEntity = QuestDto.toEntity(questDto);

            // 새로운 엔티티 삽입 시 Hibernate가 자동으로 타임스탬프를 처리하므로 설정하지 않음
            questRepository.save(newQuestEntity); // 새로 삽입
            questRepository.flush();  // DB에 즉시 반영
        }
    }
	
	
}