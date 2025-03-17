package com.java.dto.practice;

import com.java.entity.practice.RapPracticeEntity;

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
    

    public static RapPracticeDto pt_info(RapPracticeEntity entity) {
        RapPracticeDto dto = new RapPracticeDto();
        dto.setRapId(entity.getRapId());
        dto.setPracticeId(PracticeDto.pt_info(entity.getPractice()));
        dto.setRapName(entity.getRapName());
        dto.setRapScore(entity.getRapScore());
        return dto;
    }


	public static RapPracticeDto From(RapPracticeEntity entity) {
		RapPracticeDto dto = new RapPracticeDto();
        dto.setRapId(entity.getRapId());
        dto.setPracticeId(PracticeDto.pt_info(entity.getPractice()));
        dto.setRapName(entity.getRapName());
        dto.setRapScore(entity.getRapScore());
        return dto;
	}

}
