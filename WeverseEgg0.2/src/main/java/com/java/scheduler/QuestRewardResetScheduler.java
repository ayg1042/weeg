package com.java.scheduler;

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

    /**
     * 매일 자정(00:00:00)에 퀘스트 보상 내역 초기화
     */
    @Scheduled(cron = "0 12 13 * * ?") // 매일 00:00 실행
    @Transactional
    public void resetDailyQuestRewards() {
        log.info("🔄 [퀘스트 보상 초기화] 시작...");

        // 1. 보상 받은 퀘스트 히스토리 삭제
        int deletedHistory = questHistoryRepository.deleteAllByIsRewarded(1);
        log.info("✅ 삭제된 퀘스트 히스토리 개수: {}", deletedHistory);

        // 2. 진행 상태 초기화 (isCompleted = 0, progress = '0%')
        int updatedProgress = questProgressRepository.resetDailyQuestProgress();
        log.info("✅ 초기화된 퀘스트 진행 개수: {}", updatedProgress);

        log.info("🔄 [퀘스트 보상 초기화] 완료!");
    }
}
