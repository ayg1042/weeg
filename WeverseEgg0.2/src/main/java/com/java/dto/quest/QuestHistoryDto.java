package com.java.dto.quest;

import java.sql.Timestamp;

import com.java.dto.member.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class QuestHistoryDto {

	/** 히스토리 PK */
	private int questHistoryId;
    /** 플레이어 ID (FK) */
    private MemberDto memberId;
    /** 퀘스트 ID (FK) */
    private QuestDto questId;
    /** 보상 지급 여부 (1 - 지급, 0 - 미 지급) */
    private int isRewarded;
    /** 퀘스트 완료 일자 */
    private Timestamp completionDate;
    
}
