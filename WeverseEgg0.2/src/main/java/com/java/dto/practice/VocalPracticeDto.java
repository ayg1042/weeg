package com.java.dto.practice;

import com.java.dto.character.CharacterDto;
import com.java.dto.member.MemberDto;
import com.java.entity.character.CharacterEntity;
import com.java.entity.practice.VocalPracticeEntity;

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
    
    public static VocalPracticeDto pt_info(VocalPracticeEntity entity) {
        VocalPracticeDto dto = new VocalPracticeDto();
        dto.setVocalId(entity.getVocalId());
        dto.setPracticeId(PracticeDto.pt_info(entity.getPractice()));
        dto.setVocalName(entity.getVocalName());
        dto.setVocalScore(entity.getVocalScore());
        return dto;
    }

	public static VocalPracticeDto From(VocalPracticeEntity entity) {
		VocalPracticeDto dto = new VocalPracticeDto();
        dto.setVocalId(entity.getVocalId());
        dto.setPracticeId(PracticeDto.pt_info(entity.getPractice()));
        dto.setVocalName(entity.getVocalName());
        dto.setVocalScore(entity.getVocalScore());
        return dto;
	}

    

}
