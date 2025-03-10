package com.java.dto.character;

import com.java.dto.item.ItemDto;
import com.java.entity.character.InvenEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InvenDto {
	/** 인벤토리 PK*/
	private int invenId;
	/** 캐릭터 FK*/
	private CharacterDto characterId;
	/** 아이템 FK*/
	private ItemDto itemId;
	
	public static InvenDto From(InvenEntity entity) {
		InvenDto dto = new InvenDto();
		dto.setInvenId(entity.getInvenId());
		dto.setCharacterId(CharacterDto.From(entity.getCharacter()));
		dto.setItemId(ItemDto.From(entity.getItem()));
		return dto;
	}
	
}
