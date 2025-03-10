package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.character.InvenDto;
import com.java.entity.character.InvenEntity;

public interface InvenRepository extends JpaRepository<InvenEntity, Integer> {

	List<InvenEntity> findAllByCharacter_CharacterId(int character_id);

}
