package com.java.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.quest.QuestHistoryEntity;


public interface QuestHistoryRepository extends JpaRepository<QuestHistoryEntity, Integer> {

    QuestHistoryEntity findByQuest_QuestIdAndMember_UserId(int questId, Integer userId);

}

