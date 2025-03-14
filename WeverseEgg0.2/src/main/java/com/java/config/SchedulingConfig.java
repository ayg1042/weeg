package com.java.config;

import jakarta.annotation.PostConstruct;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.time.LocalDateTime;

@Configuration
@EnableScheduling  // 주기적인 작업을 활성화하는 어노테이션
public class SchedulingConfig {

    /**
     * 스케줄러 활성화 확인을 위한 초기 로그 출력
     */
    @PostConstruct
    public void init() {
        System.out.println("✅ 스케줄링 활성화됨! 현재 시간: " + LocalDateTime.now());
    }
}
