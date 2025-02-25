package com.java.entity.quest;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;

import com.java.entity.member.MemberEntity;

@Entity
@Table(name = "Egg_Quest_History")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuestHistoryEntity {

    /** 히스토리 고유번호 (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "quest_history_id")
    private int questHistoryId;

    /** 플레이어 ID (FK) */
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private MemberEntity member;

    /** 퀘스트 ID (FK) */
    @ManyToOne
    @JoinColumn(name = "quest_id", referencedColumnName = "quest_id")
    private QuestEntity quest;

    /** 보상 지급 여부 (1 - 지급, 0 - 미 지급) */
    @Column(nullable = false)
    private int isRewarded;

    /** 퀘스트 완료 일자 */
    @Column(nullable = false)
    private Timestamp completionDate;
}