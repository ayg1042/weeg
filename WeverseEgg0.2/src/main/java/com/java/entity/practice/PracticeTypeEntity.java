package com.java.entity.practice;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Egg_Practice_Type")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PracticeTypeEntity {

    /** 연습 타입 PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "practice_type_id")
    private int practiceTypeId;

    /** 연습 타입 (예: 춤, 보컬, 랩 등) */
    @Column(nullable = false, length = 50)
    private String practiceType;
}
