package com.java.entity.quest;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;

import com.java.entity.member.MemberEntity;

@Entity
@Table(name = "Egg_Quest_Progress")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestProgressEntity {

    /** 진행도 고유번호 (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "progress_id")
    private int progressId;

    /** 플레이어 ID (FK) */
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private MemberEntity member;

    /** 퀘스트 ID (FK) */
    @ManyToOne
    @JoinColumn(name = "quest_id", referencedColumnName = "quest_id")
    private QuestEntity quest;

    /** 퀘스트 클리어 여부 (1 -> 클리어, 0 -> 클리어 못함) */
    @Column(nullable = false)
    private int isCompleted;

    /** 퀘스트 진행률 (예: "50%" 같은 문자열) */
    @Column(length = 10, nullable = false)
    private String progress;

    /** 퀘스트 남은 시간 */
    @Column(nullable = true)
    private Timestamp remainingTime;
}