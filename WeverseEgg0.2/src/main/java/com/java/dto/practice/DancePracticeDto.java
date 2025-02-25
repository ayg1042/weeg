package com.java.dto.practice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DancePracticeDto {
	
	/** 댄스 PK */
	private int danceId;
	/** 연습 FK*/
	private PracticeDto practiceId;
	/** 연습 이름*/
	private String danceName;
	/** 댄스 연습 점수 (연습을 통해 증가하는 댄스 능력치) */
    private int danceScore;
    
}
