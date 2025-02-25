package com.java.dto.practice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class VocalPracticeDto {
	/** 보컬 PK */
	private int vocalId;
	/** 연습 FK*/
	private PracticeDto practiceId;
	/** 연습 이름*/
	private String vocalName;
	/** 보컬 연습 점수 */
    private int vocalScore;
    
}
