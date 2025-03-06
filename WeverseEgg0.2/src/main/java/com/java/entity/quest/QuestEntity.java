package com.java.entity.quest;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Egg_Quest")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuestEntity {

    /** 퀘스트 고유번호 (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "quest_id")
    private int questId;

    /** 퀘스트 제목 */
    @Column(nullable = false, length = 100)
    private String title;

    /** 퀘스트 내용 */
    @Column(nullable = false, length = 255)
    private String content;

    /** 퀘스트 완료 시 지급되는 코인 */
    @Column(nullable = false)
    private int coin;

    /** 퀘스트 리셋 시간 (리셋 주기) */
//    @Column(nullable = false)
//    private Timestamp resetTime;
}