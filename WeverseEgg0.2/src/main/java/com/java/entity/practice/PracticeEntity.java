package com.java.entity.practice;

import com.java.dto.practice.PracticeDto;
import com.java.dto.practice.PracticeType;

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

	public static PracticeEntity nullId(PracticeDto dto) {
		PracticeEntity entity = new PracticeEntity();
		entity.setPracticeType(PracticeTypeEntity.From(dto.getPracticeType()));
		entity.setPrice(dto.getPrice());
		entity.setHealth(dto.getHealth());
		entity.setFatigue(dto.getFatigue());
		return entity;
	}

	public static PracticeEntity From(PracticeDto dto) {
		PracticeEntity entity = new PracticeEntity();
		entity.setPracticeId(dto.getPracticeId());
		entity.setPracticeType(PracticeTypeEntity.From(dto.getPracticeType()));
		entity.setPrice(dto.getPrice());
		entity.setHealth(dto.getHealth());
		entity.setFatigue(dto.getFatigue());
		return entity;
	}
}
