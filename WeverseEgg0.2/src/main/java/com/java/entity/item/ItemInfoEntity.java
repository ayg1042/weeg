package com.java.entity.item;

import java.sql.Timestamp;

import com.java.dto.item.ItemInfoDto;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Egg_Item_Info")
@Getter
@Setter
@NoArgsConstructor
public class ItemInfoEntity {

    /** itemInfo PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_info_id")
    private int itemInfoId;

    /** 아이템 타입 (ManyToOne 관계) */
    @ManyToOne
    @JoinColumn(name = "item_type_id", referencedColumnName = "item_type_id")
    private ItemTypeEntity itemType;

    /** 피로도 회복량 (nullable 허용) */
    @Column(name = "fatigue_recovery", nullable = true)
    private Integer fatigueRecovery;

    /** 매력도 (nullable 허용) */
    @Column(nullable = true)
    private Integer charm;

    /** 댄스 (nullable 허용) */
    @Column(nullable = true)
    private Integer dance;

    /** 보컬 (nullable 허용) */
    @Column(nullable = true)
    private Integer vocal;

    /** 랩 (nullable 허용) */
    @Column(nullable = true)
    private Integer rap;

    /** 예능 (nullable 허용) */
    @Column(nullable = true)
    private Integer entertainment;

    /** 판매 시작일 (nullable 허용) */
    @Column(name = "start_date", nullable = true)
    private Timestamp startDate;

    /** 판매 종료일 (nullable 허용) */
    @Column(name = "end_date", nullable = true)
    private Timestamp endDate;

	public static ItemInfoEntity From(ItemInfoDto dto) {
		ItemInfoEntity entity = new ItemInfoEntity();
		entity.setItemInfoId(dto.getItemInfoId());
		entity.setItemType(ItemTypeEntity.From(dto.getItemType()));
		entity.setFatigueRecovery(dto.getFatigueRecovery());
		entity.setCharm(dto.getCharm());
		entity.setDance(dto.getDance());
		entity.setVocal(dto.getVocal());
		entity.setRap(dto.getRap());
		entity.setEntertainment(dto.getEntertainment());
		entity.setStartDate(dto.getStartDate());
		entity.setEndDate(dto.getEndDate());
		return entity;
	}
	
	public static ItemInfoEntity getId(ItemInfoDto dto) {
		ItemInfoEntity entity = new ItemInfoEntity();
		entity.setItemInfoId(dto.getItemInfoId());
		return entity;
	}
    
}