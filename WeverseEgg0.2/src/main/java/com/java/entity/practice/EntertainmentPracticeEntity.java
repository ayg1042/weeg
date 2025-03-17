package com.java.entity.practice;

import com.java.dto.practice.EntertainmentPracticeDto;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Egg_Entertainment_Practice")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EntertainmentPracticeEntity {

    /** 예능 연습 PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "entertainment_id")
    private int entertainmentId;

    /** 연습 정보 (FK, 연습 타입 참조) */
    @ManyToOne
    @JoinColumn(name = "practice_id", referencedColumnName = "practice_id", nullable = false)
    private PracticeEntity practice;

    /** 연습 이름 */
    @Column(nullable = false)
    private String entertainmentName;

    /** 예능 연습 점수 (연습을 통해 증가하는 예능 능력치) */
    @Column(nullable = false)
    private int entertainmentScore;

	public static EntertainmentPracticeEntity nullId(EntertainmentPracticeDto dto) {
		EntertainmentPracticeEntity entity = new EntertainmentPracticeEntity();
		entity.setEntertainmentName(dto.getEntertainmentName());
		entity.setEntertainmentScore(dto.getEntertainmentScore());
		entity.setPractice(PracticeEntity.From(dto.getPracticeId()));
		return entity;
	}
	public static EntertainmentPracticeEntity From(EntertainmentPracticeDto dto) {
		EntertainmentPracticeEntity entity = new EntertainmentPracticeEntity();
		entity.setEntertainmentId(dto.getEntertainmentId());
		entity.setEntertainmentName(dto.getEntertainmentName());
		entity.setEntertainmentScore(dto.getEntertainmentScore());
		entity.setPractice(PracticeEntity.From(dto.getPracticeId()));
		return entity;
	}
}