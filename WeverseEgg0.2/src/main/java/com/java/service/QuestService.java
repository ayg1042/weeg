package com.java.service;

import java.util.List;


import com.java.dto.quest.QuestDto;

public interface QuestService {

	List<QuestDto> findAll();

	Integer getRewardCoin(int questId);

	void updateQuestRewards();

	void saveQuest(QuestDto questDto);

}
