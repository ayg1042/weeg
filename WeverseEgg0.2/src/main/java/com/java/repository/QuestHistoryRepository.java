package com.java.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.java.entity.quest.QuestHistoryEntity;

import jakarta.transaction.Transactional;


public interface QuestHistoryRepository extends JpaRepository<QuestHistoryEntity, Integer> {

    QuestHistoryEntity findByQuest_QuestIdAndMember_UserId(int questId, Integer userId);

    
 // 보상을 받은(isRewarded=1) 퀘스트 히스토리 삭제
    @Transactional
    @Modifying
    @Query("DELETE FROM QuestHistoryEntity qh WHERE qh.isRewarded = 1 AND qh.quest.questId BETWEEN 1 AND 4")
	int deleteAllByIsRewarded(int i);


	List<QuestHistoryEntity> findByMember_UserId(Integer userId);

}

