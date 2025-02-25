package com.java.dto.character;

import com.java.dto.item.ItemDto;

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
    /** 착용중인 아이템 id FK */
    private ItemDto item;
    
}
