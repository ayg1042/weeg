package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.character.CharacterDto;
import com.java.dto.character.InvenDto;
import com.java.dto.character.StyleDto;
import com.java.dto.group.ArtistNameDto;
import com.java.dto.group.GroupDto;
import com.java.dto.item.ItemDto;
import com.java.dto.item.ItemInfoDto;
import com.java.dto.item.ItemTypeDto;
import com.java.entity.character.CharacterEntity;
import com.java.entity.character.InvenEntity;
import com.java.entity.character.StyleEntity;
import com.java.entity.group.ArtistNameEntity;
import com.java.entity.group.GroupEntity;
import com.java.entity.item.ItemEntity;
import com.java.entity.item.ItemInfoEntity;
import com.java.entity.item.ItemTypeEntity;
import com.java.repository.CharacterRepository;
import com.java.repository.GroupRepository;
import com.java.repository.InvenRepository;
import com.java.repository.ItemInfoRepository;
import com.java.repository.ItemRepository;
import com.java.repository.ItemTypeRepository;
import com.java.repository.StyleRepository;
import com.java.repository.ArtistNameRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class ModalServiceImpl implements ModalService {

	@Autowired ItemRepository itemRepository;
	@Autowired InvenRepository invenRepository;
	@Autowired StyleRepository styleRepository;
	@Autowired CharacterRepository characterRepository;
	@Autowired ItemTypeRepository itemTypeRepository;
	@Autowired ItemInfoRepository itemInfoRepository;
	@Autowired GroupRepository groupRepository;
	@Autowired ArtistNameRepository artistNameRepository;
	
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
	public ItemDto getItem(int item_id) {
		ItemEntity entity = itemRepository.findById(item_id).orElse(null);
		return ItemDto.From(entity);
	}

	@Override
	public void characterSave(CharacterDto character) {
		CharacterEntity entity = CharacterEntity.From(character);
		characterRepository.saveAndFlush(entity);
		
	}

	@Override
	public void deleteInvenItem(int invenId) {
		invenRepository.deleteById(invenId);
		
	}

	// 모든 아이템 타입 불러오기 (관리자페이지)
	@Override
	public List<ItemTypeDto> getAllItemTypes() {
		List<ItemTypeEntity> list = itemTypeRepository.findAll();
		List<ItemTypeDto> dto = new ArrayList();
		for(ItemTypeEntity entity : list) {
			dto.add(ItemTypeDto.From(entity));
		}
		return dto;
	}

	@Override
	public List<ItemInfoDto> getAllItemInfo() {
		List<ItemInfoEntity> list = itemInfoRepository.findAll();
		List<ItemInfoDto> dto = new ArrayList();
		for(ItemInfoEntity entity : list) {
			dto.add(ItemInfoDto.From(entity));
		}
		
		return dto;
	}

	@Override
	public void addItem(ItemDto dto) {
		ItemEntity entity = ItemEntity.From(dto);
		itemRepository.save(entity);
	}

	@Override
	public void addItemInfo(ItemInfoDto info) {
		ItemInfoEntity entity = ItemInfoEntity.From(info);
		itemInfoRepository.save(entity);
		
	}

	@Override
	public void updateItemInfo(ItemInfoDto info) {
		ItemInfoEntity entity = ItemInfoEntity.From(info);
		itemInfoRepository.saveAndFlush(entity);
		
	}

	@Override
	public ItemInfoDto getItemInfo(int itemInfoId) {
		ItemInfoEntity entity = itemInfoRepository.findById(itemInfoId)
                .orElseThrow(() -> new EntityNotFoundException("아이템을 찾을 수 없습니다."));
		return ItemInfoDto.From(entity);
	}

	@Override
	public void deleteItem(int itemId) {
		ItemEntity entity = itemRepository.findById(itemId)
				.orElseThrow(() -> new EntityNotFoundException("아이템을 찾을 수 없습니다."));
		styleRepository.deleteAllByItem_ItemId(entity.getItemId());
		invenRepository.deleteAllByItem_ItemId(entity.getItemId());
		itemRepository.deleteById(entity.getItemId());
		
	}

	@Override
	public List<GroupDto> getAllGroup() {
		List<GroupEntity> list = groupRepository.findAll();
		List<GroupDto> dto = new ArrayList();
		for(GroupEntity entity : list) {
			dto.add(GroupDto.From(entity));
		}
		return dto;
	}

	@Override
	public void addGroup(GroupDto dto) {
		GroupEntity entity = GroupEntity.nullId(dto);
		groupRepository.save(entity);
		
	}

	@Override
	public void updateGroup(GroupDto dto) {
		GroupEntity entity = GroupEntity.From(dto);
		groupRepository.saveAndFlush(entity);
	}

	@Override
	public GroupDto getGroup(int groupId) {
		GroupEntity entity = groupRepository.findById(groupId)
				.orElseThrow(() -> new EntityNotFoundException("그룹을 찾을 수 없습니다."));
		return GroupDto.From(entity);
	}

	@Override
	public void deleteGroup(int groupId) {
		groupRepository.delete(groupRepository.getById(groupId));
	}

	@Override
	public void addArtistName(ArtistNameDto artist) {
		ArtistNameEntity entity = ArtistNameEntity.nullId(artist);
		artistNameRepository.save(entity);
		
	}

	@Override
	public List<ArtistNameDto> getAllArtistName() {
		List<ArtistNameEntity> list = artistNameRepository.findAll();
		List<ArtistNameDto> dto = new ArrayList<>();
		for(ArtistNameEntity entity : list) {
			dto.add(ArtistNameDto.From(entity));
		}
		return dto;
	}

	@Override
	public ArtistNameDto getArtistName(int artistNId) {
		ArtistNameEntity entity = artistNameRepository.findById(artistNId)
				.orElseThrow(() -> new EntityNotFoundException("아티스트를 찾을 수 없습니다."));
		
		return ArtistNameDto.From(entity);
	}

	@Override
	public void updateArtistName(ArtistNameDto artist) {
		ArtistNameEntity entity = ArtistNameEntity.From(artist);
		artistNameRepository.saveAndFlush(entity);
		
	}

	@Override
	public void deleteArtistName(ArtistNameDto dto) {
		ArtistNameEntity entity = ArtistNameEntity.From(dto);
		artistNameRepository.delete(entity);
		
	}
	
	

}
