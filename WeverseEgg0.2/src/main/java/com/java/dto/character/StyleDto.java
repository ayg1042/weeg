package com.java.dto.character;

import com.java.dto.item.ItemDto;
import com.java.entity.character.StyleEntity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class StyleDto {
	
	/** 스타일 고유번호 (PK) */
    private int styleId;
    // 케릭터 id
    private CharacterDto character;
    /** 착용중인 아이템 id FK */
    private ItemDto item;
    
    public static StyleDto From(StyleEntity entity) {
    	StyleDto dto = new StyleDto();
    	dto.setStyleId(entity.getStyleId());
    	dto.setCharacter(CharacterDto.From(entity.getCharacter()));
    	dto.setItem(ItemDto.From(entity.getItem()));
    	return dto;
    }
    
}
