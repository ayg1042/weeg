package com.java.service;

import java.util.List;

import com.java.dto.character.InvenDto;
import com.java.dto.character.StyleDto;
import com.java.dto.item.ItemDto;

public interface ModalService {

	List<ItemDto> getAllItems();

	List<InvenDto> getCharacterInven(int character_id);

	void buyItem(InvenDto inven);

	List<StyleDto> getAllStyle(int character_id);

	void deleteStyleByUserId(int character_id);

	void styleSave(StyleDto dto);

}
