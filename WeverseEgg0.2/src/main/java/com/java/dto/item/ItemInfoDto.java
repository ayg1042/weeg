package com.java.dto.item;

import java.sql.Timestamp;

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
}
