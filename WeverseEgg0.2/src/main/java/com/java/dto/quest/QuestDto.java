package com.java.dto.quest;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QuestDto {

    /** 퀘스트 고유번호 (PK) */
    private int questId;
    /** 퀘스트 제목 */
    private String title;
    /** 퀘스트 내용 */
    private String content;
    /** 퀘스트 완료 시 지급되는 코인 */
    private int coin;
    /** 퀘스트 리셋 시간 */
    private Timestamp resetTime;
    
}
