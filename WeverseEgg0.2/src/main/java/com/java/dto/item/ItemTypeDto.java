package com.java.dto.item;

import com.java.entity.item.ItemTypeEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemTypeDto {

	/** 아이템 타입 PK */
	private int itemTypeId;
	/** 아이템 타입 - "해어", "의상", "악세서리", "소모품", "이벤트" */
	private String itemType;
	
	public static ItemTypeDto From(ItemTypeEntity entity) {
		ItemTypeDto dto = new ItemTypeDto();
		dto.setItemTypeId(entity.getItemTypeId());
		dto.setItemType(entity.getItemType());
		return dto;
	}
	
}
