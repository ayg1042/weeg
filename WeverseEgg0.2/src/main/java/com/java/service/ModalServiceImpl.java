package com.java.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.character.InvenDto;
import com.java.dto.character.StyleDto;
import com.java.dto.item.ItemDto;
import com.java.entity.character.InvenEntity;
import com.java.entity.character.StyleEntity;
import com.java.entity.item.ItemEntity;
import com.java.repository.InvenRepository;
import com.java.repository.ItemRepository;
import com.java.repository.StyleRepository;

@Service
public class ModalServiceImpl implements ModalService {

	@Autowired ItemRepository itemRepository;
	@Autowired InvenRepository invenRepository;
	@Autowired StyleRepository styleRepository;
	
	@Override
	public List<ItemDto> getAllItems() {
		List<ItemEntity> list = itemRepository.findAll();
		List<ItemDto> Items = new ArrayList();
		for(ItemEntity entity : list) {
			Items.add(ItemDto.From(entity));
		}
		return Items;
	}

	@Override
	public List<InvenDto> getCharacterInven(int character_id) {
		List<InvenEntity> list = invenRepository.findAllByCharacter_CharacterId(character_id);
		List<InvenDto> inven = new ArrayList();
		
		for(InvenEntity entity : list) {
			inven.add(InvenDto.From(entity));
		}
		
		return inven;
	}

	@Override
	public void buyItem(InvenDto inven) {
		InvenEntity entity = InvenEntity.From(inven);
		invenRepository.save(entity);
	}

	@Override
	public List<StyleDto> getAllStyle(int character_id) {
		List<StyleEntity> list = styleRepository.findAllByCharacter_CharacterId(character_id);
		List<StyleDto> style = new ArrayList<>();
		for(StyleEntity entity : list) {
			style.add(StyleDto.From(entity));
		}
		
		return style;
	}

	@Override
	public void deleteStyleByUserId(int character_id) {
		styleRepository.deleteAllByCharacter_CharacterId(character_id);
		
	}

	@Override
	public void styleSave(StyleDto dto) {
		StyleEntity entity = StyleEntity.From(dto);
		styleRepository.save(entity);
		
	}

	@Override
	public Collection<? extends ItemDto> findByItemInfo_ItemType_ItemTypeIdIn(List<Integer> item_type) {
		List<ItemEntity> list = itemRepository.findByItemInfo_ItemType_ItemTypeIdIn(item_type);
		List<ItemDto> Items = new ArrayList();
		for(ItemEntity entity : list) {
			Items.add(ItemDto.From(entity));
		}
		return Items;
	}

	public void addItem(ItemDto item) {
		// TODO Auto-generated method stub
		
	}

}
