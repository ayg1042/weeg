package com.java.scheduler;

import com.java.repository.CharacterRepository;
import com.java.repository.QuestHistoryRepository;
import com.java.repository.QuestProgressRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Component
@RequiredArgsConstructor
public class QuestRewardResetScheduler {

    private final QuestHistoryRepository questHistoryRepository;
    private final QuestProgressRepository questProgressRepository;
    private final CharacterRepository characterRepository;

    @Scheduled(cron = "0 14 15 * * ?") // 매일 자정에 초기화
    @Transactional
    public void resetDailyQuestRewards() {
        log.info("🔄 [퀘스트 보상 초기화] 시작...");

        // 1. 보상 받은 퀘스트 히스토리 삭제
        int deletedHistory = questHistoryRepository.deleteAllByIsRewarded(1);
        log.info("✅ 삭제된 퀘스트 히스토리 개수: {}", deletedHistory);

        // 2. 진행 상태 초기화 (isCompleted = 0, progress = '0%')
        int updatedProgress = questProgressRepository.resetDailyQuestProgress();
        log.info("✅ 초기화된 퀘스트 진행 개수: {}", updatedProgress);
        
     // 3. 모든 캐릭터의 체력과 피로도를 초기화 (체력 100, 피로도 0)
        int updatedCharacters = characterRepository.resetCharacterStats();
        log.info("✅ 초기화된 캐릭터 개수: {}", updatedCharacters);

        log.info("🔄 [퀘스트 보상 초기화] 완료!");
    }
}
