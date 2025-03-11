package com.java.service;

import java.util.List;

import com.java.dto.character.CharacterDto;
import com.java.dto.character.InvenDto;
import com.java.dto.character.StyleDto;
import com.java.dto.item.ItemDto;
import com.java.dto.item.ItemInfoDto;
import com.java.dto.item.ItemTypeDto;

public interface ModalService {

	List<ItemDto> getAllItems();

	List<InvenDto> getCharacterInven(int character_id);

	void buyItem(InvenDto inven);

	List<StyleDto> getAllStyle(int character_id);

	void deleteStyleByUserId(int character_id);

	void styleSave(StyleDto dto);

	ItemDto getItem(int item_id);

	void characterSave(CharacterDto character);

	void deleteInvenItem(int invenId);

	List<ItemTypeDto> getAllItemTypes();

	List<ItemInfoDto> getAllItemInfo();

	void addItem(ItemDto dto);

	void addItemInfo(ItemInfoDto info);

}
