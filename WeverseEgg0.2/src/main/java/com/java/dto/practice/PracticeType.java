package com.java.dto.practice;

import com.java.entity.practice.PracticeTypeEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PracticeType {
	
	/** 연습 타입 PK */
	private int practiceTypeId;
	/** 연습 타입 - "춤", "보컬", "랩", "예능", "공연" 등 */
	private String practiceType;
	
	public static PracticeType pt_info(PracticeTypeEntity entity) {
        PracticeType dto = new PracticeType();
        dto.setPracticeTypeId(entity.getPracticeTypeId());
        dto.setPracticeType(entity.getPracticeType());
        return dto;
    }
}
