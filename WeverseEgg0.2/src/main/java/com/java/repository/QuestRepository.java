package com.java.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.quest.QuestEntity;

public interface QuestRepository extends JpaRepository<QuestEntity, Integer>{
	

}
