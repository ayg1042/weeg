package com.java.entity.practice;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Egg_Dance_Practice")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DancePracticeEntity {

    /** 댄스 연습 PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dance_id")
    private int danceId;

    /** 연습 정보 (FK, 연습 타입 참조) */
    @ManyToOne
    @JoinColumn(name = "practice_id", referencedColumnName = "practice_id", nullable = false)
    private PracticeEntity practice;

    /** 연습 이름 */
    @Column(nullable = false)
    private String danceName;

    /** 댄스 연습 점수 (연습을 통해 증가하는 댄스 능력치) */
    @Column(nullable = false)
    private int danceScore;
}