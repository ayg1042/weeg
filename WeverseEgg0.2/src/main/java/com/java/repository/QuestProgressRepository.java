package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.quest.QuestProgressEntity;

public interface QuestProgressRepository extends JpaRepository<QuestProgressEntity, Integer>{

}
