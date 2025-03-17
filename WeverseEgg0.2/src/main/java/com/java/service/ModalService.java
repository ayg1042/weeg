package com.java.service;

import java.util.Collection;
import java.util.List;

import com.java.dto.group.ArtistNameDto;
import com.java.dto.group.GroupDto;
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

	Collection<? extends ItemDto> findByItemInfo_ItemType_ItemTypeIdIn(List<Integer> item_type);
	
	ItemDto getItem(int item_id);

	void characterSave(CharacterDto character);

	void deleteInvenItem(int invenId);

	List<ItemTypeDto> getAllItemTypes();

	List<ItemInfoDto> getAllItemInfo();

	void addItem(ItemDto dto);

	void addItemInfo(ItemInfoDto info);

	void updateItemInfo(ItemInfoDto info);

	ItemInfoDto getItemInfo(int itemInfoId);

	void deleteItem(int itemId);

	List<GroupDto> getAllGroup();

	void addGroup(GroupDto dto);

	void updateGroup(GroupDto dto);

	GroupDto getGroup(int groupId);

	void deleteGroup(int groupId);

	void addArtistName(ArtistNameDto artist);

	List<ArtistNameDto> getAllArtistName();

	ArtistNameDto getArtistName(int artistNId);

	void updateArtistName(ArtistNameDto artist);

	void deleteArtistName(ArtistNameDto dto);

	List<ItemDto> getItemsByItemInfoId(int i);

}
