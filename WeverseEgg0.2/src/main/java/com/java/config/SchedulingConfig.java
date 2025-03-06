package com.java.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@EnableScheduling  // 주기적인 작업을 활성화하는 어노테이션
public class SchedulingConfig {
    // 스케줄링 관련 설정을 여기에 추가할 수 있습니다.
}
