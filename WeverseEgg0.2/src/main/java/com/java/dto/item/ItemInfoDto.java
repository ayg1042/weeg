package com.java.dto.item;

import java.sql.Timestamp;

import com.java.entity.item.ItemInfoEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemInfoDto {
	/** itemInfo PK */
	private int itemInfoId;
	/** 아이템 타입 FK */
	private ItemTypeDto itemType;
	/** 피로도 회복량 */
	private int fatigueRecovery;
	/** 매력도 */
	private int charm;
	/** 댄스 */
	private int dance;
	/** 보컬 */
	private int vocal;
	/** 랩 */
	private int rap;
	/** 예능 */
	private int entertainment;
	/** 판매 시작일 */
	private Timestamp startDate;
	/** 판매 종료일 */
	private Timestamp endDate;
	
	public static ItemInfoDto From(ItemInfoEntity entity) {
		ItemInfoDto dto = new ItemInfoDto();
		dto.setItemInfoId(entity.getItemInfoId());
		dto.setItemType(ItemTypeDto.From(entity.getItemType()));
		dto.setFatigueRecovery(entity.getFatigueRecovery() != null ? entity.getFatigueRecovery() : 0);
		dto.setCharm(entity.getCharm() != null ? entity.getCharm() : 0);
		dto.setDance(entity.getDance() != null ? entity.getDance() : 0);
		dto.setVocal(entity.getVocal() != null ? entity.getVocal() : 0);
		dto.setRap(entity.getRap() != null ? entity.getRap() : 0);
		dto.setEntertainment(entity.getEntertainment() != null ? entity.getEntertainment() : 0);
		dto.setStartDate(entity.getStartDate() != null ? entity.getStartDate() : null);
		dto.setEndDate(entity.getEndDate() != null ? entity.getEndDate() : null);
		
		return dto;
	}
}
