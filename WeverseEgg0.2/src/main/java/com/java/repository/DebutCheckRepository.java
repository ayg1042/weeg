package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.character.DebutCheckDto;

public interface DebutCheckRepository extends JpaRepository<DebutCheckDto, Integer> {

	DebutCheckDto findByCharacter_CharacterId(int character_id);

}
