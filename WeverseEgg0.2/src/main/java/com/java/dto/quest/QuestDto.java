package com.java.dto.quest;

import java.sql.Timestamp;

import com.java.entity.quest.QuestEntity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
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
//    private Timestamp resetTime;

	// 새로운 필드 lstUpdTstamp 추가
	private Timestamp lstUpdTstamp;

	// 정적 팩토리 메서드 추가
    public static QuestDto qlist(QuestEntity entity) {
        QuestDto dto = new QuestDto();
        dto.questId = entity.getQuestId();
        dto.title = entity.getTitle();
        dto.content = entity.getContent();
        dto.coin = entity.getCoin();
        
        return dto;
    }

	// QuestDto -> QuestEntity 변환 메서드
	public static QuestEntity toEntity(QuestDto dto) {
		QuestEntity entity = new QuestEntity();
		entity.setQuestId(dto.getQuestId());
		entity.setTitle(dto.getTitle());
		entity.setContent(dto.getContent());
		entity.setCoin(dto.getCoin());
		entity.setLstUpdTstamp(dto.getLstUpdTstamp()); // lstUpdTstamp 필드도 설정
		return entity;
	}


}
