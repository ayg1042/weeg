package com.java.entity.practice;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Egg_Practice")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PracticeEntity {

    /** 연습의 고유 ID (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "practice_id")
    private int practiceId;

    /** 연습 타입 ID (Foreign Key) */
    @ManyToOne
    @JoinColumn(name = "practice_type_id", referencedColumnName = "practice_type_id", nullable = false)
    private PracticeTypeEntity practiceType;

    /** 연습 시 소모되는 코인 */
    @Column(nullable = false)
    private int price;

    /** 연습 시 소모되는 체력 */
    @Column(nullable = false)
    private int health;

    /** 연습 시 증가하는 피로도 */
    @Column(nullable = false)
    private int fatigue;
}
