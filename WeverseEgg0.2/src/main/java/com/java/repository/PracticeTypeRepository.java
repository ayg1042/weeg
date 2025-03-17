package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.practice.PracticeTypeEntity;

public interface PracticeTypeRepository extends JpaRepository<PracticeTypeEntity, Integer> {

}
