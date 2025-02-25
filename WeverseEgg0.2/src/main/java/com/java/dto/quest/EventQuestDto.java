package com.java.dto.quest;

import java.sql.Timestamp;

import com.java.dto.item.ItemDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class EventQuestDto {
	
	/** 이벤트 퀘스트 PK */
	private EventQuestDto eventQeustId;
    /** 이벤트 보상 아이템 (예: 초콜릿) FK */
    private ItemDto rewardItem;
    /** 이벤트 퀘스트 PK */
    private QuestDto questId; 
    
}