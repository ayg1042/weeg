package com.java.dto.item;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ItemDto {
	
	/** 아이템의 고유 ID (PK) */
    private int itemId;
    /** 아이템 정보 FK */
    private ItemInfoDto itemInfo;
    /** 아이템의 이름 */
    private String name;
    /** 아이템의 가격 (구매에 필요한 머니) */
    private int price;
    /** 아이템의 이미지 경로 또는 URL */
    private String image;
    
}
