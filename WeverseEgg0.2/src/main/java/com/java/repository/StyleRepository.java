package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.character.InvenEntity;
import com.java.entity.character.StyleEntity;
import com.java.entity.item.ItemEntity;

public interface StyleRepository extends JpaRepository<StyleEntity, Integer> {
	
	List<StyleEntity> findAllByCharacter_CharacterId(int character_id);

	void deleteAllByCharacter_CharacterId(int character_id);

	void deleteAllByItem_ItemId(int itemId);
	
}
