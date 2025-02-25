package com.java.dto.character;

import com.java.dto.item.ItemDto;

public class InvenDto {
	/** 인벤토리 PK*/
	private int invenId;
	/** 캐릭터 FK*/
	private CharacterDto characterId;
	/** 아이템 FK*/
	private ItemDto itemId;
}
