package com.java.dto.quest;


import com.java.dto.member.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class QuestProgressDto {

	/** 진행도 PK */
	private int progressId;
    /** 플레이어 ID (FK) */
    private MemberDto memberId;
    /** 퀘스트 ID (FK) */
    private QuestDto questId;
    /** 퀘스트 클리어 여부 (1 -> 클리어, 0 -> 클리어 못함) */
    private int isCompleted;
    /** 퀘스트 진행률 (예: "50%" 같은 문자열) */
    private String progress;
    /** 퀘스트 시작 시간*/
//    private Timestamp startTime;
    
}
