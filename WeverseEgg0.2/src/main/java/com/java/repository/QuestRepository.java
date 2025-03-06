package com.java.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.entity.quest.QuestEntity;

public interface QuestRepository extends JpaRepository<QuestEntity, Integer>{
	@Query("SELECT q.coin FROM QuestEntity q WHERE q.questId = :questId")
    Integer findCoinByQuestId(@Param("questId") int questId);
	
}
