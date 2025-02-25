package com.java.entity.practice;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Egg_Vocal_Practice")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VocalPracticeEntity {

    /** 보컬 연습 PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vocal_id")
    private int vocalId;

    /** 연습 정보 (FK, 연습 타입 참조) */
    @ManyToOne
    @JoinColumn(name = "practice_id", referencedColumnName = "practice_id", nullable = false)
    private PracticeEntity practice;

    /** 연습 이름 */
    @Column(nullable = false)
    private String vocalName;

    /** 보컬 연습 점수 (연습을 통해 얻는 보컬 능력치) */
    @Column(nullable = false)
    private int vocalScore;
}