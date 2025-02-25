package com.java.dto.practice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PracticeDto {
	
	/** 연습의 고유 ID (PK) */
    private int practiceId;
    /** 연습 타입 id FK */
    private PracticeType practiceType;
    /** 연습 시 소모되는 코인 */
    private int price;
    /** 연습 시 소모되는 체력 */
    private int health;
    /** 연습 시 증가하는 피로도 */
    private int fatigue;
    
}
