package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.java.entity.quest.QuestProgressEntity;

import jakarta.transaction.Transactional;

public interface QuestProgressRepository extends JpaRepository<QuestProgressEntity, Integer>{

	QuestProgressEntity findByQuest_QuestIdAndMember_UserId(int questId, int userId);

	
	// 퀘스트 진행 상태 초기화 (isCompleted=0, progress='0%')
    @Transactional
    @Modifying
    @Query("UPDATE QuestProgressEntity qp SET qp.isCompleted = 0, qp.progress = '0%' WHERE qp.quest.questId BETWEEN 1 AND 4")
	int resetDailyQuestProgress();



}
