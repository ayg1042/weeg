package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.practice.PracticeEntity;

public interface PracticeRepository extends JpaRepository<PracticeEntity, Integer> {

}
