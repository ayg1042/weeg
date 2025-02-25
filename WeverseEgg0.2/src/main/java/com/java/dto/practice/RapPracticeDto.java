package com.java.dto.practice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RapPracticeDto {
	
	/** 랩 PK */
	private int rapId;
	/** 연습 FK*/
	private PracticeDto practiceId;
	/** 연습 이름*/
	private String rapName;
	/** 랩 연습을 통해 얻는 점수 */
    private int rapScore;
    
}
