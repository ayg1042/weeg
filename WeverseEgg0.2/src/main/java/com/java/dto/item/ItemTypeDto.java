package com.java.dto.item;

import com.java.entity.item.ItemTypeEntity;

public class ItemTypeDto {

	/** 아이템 타입 PK */
	private int itemTypeId;
	/** 아이템 타입 - "해어", "의상", "악세서리", "소모품", "이벤트" */
	private String itemType;
	
	public static ItemTypeDto from(ItemTypeEntity entity) {
		ItemTypeDto dto = new ItemTypeDto();
		dto.itemTypeId = entity.getItemTypeId();
		dto.itemType = entity.getItemType();
		return dto;
	}
}
