package com.java.dto.practice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EntertainmentPracticeDto {
	
	/** 예능 PK */
	private int entertainmentId;
	/** 연습 FK*/
	private PracticeDto practiceId;
	/** 연습 이름*/
	private String entertainmentName;
	/** 예능 연습 점수 (연습을 통해 증가하는 예능 능력치) */
    private int entertainmentScore;
    
}
