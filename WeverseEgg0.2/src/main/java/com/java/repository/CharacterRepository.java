package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.character.CharacterEntity;

public interface CharacterRepository extends JpaRepository<CharacterEntity, Integer>{

}
