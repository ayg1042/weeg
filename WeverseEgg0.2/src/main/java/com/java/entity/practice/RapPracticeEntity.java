package com.java.entity.practice;

import com.java.dto.practice.RapPracticeDto;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Egg_Rap_Practice")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RapPracticeEntity {

    /** 랩 연습 PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rap_id")
    private int rapId;

    /** 연습 정보 (FK, 연습 타입 참조) */
    @ManyToOne
    @JoinColumn(name = "practice_id", referencedColumnName = "practice_id", nullable = false)
    private PracticeEntity practice;

    /** 연습 이름 */
    @Column(nullable = false)
    private String rapName;

    /** 랩 연습 점수 (연습을 통해 얻는 랩 능력치) */
    @Column(nullable = false)
    private int rapScore;

	public static RapPracticeEntity nullId(RapPracticeDto dto) {
		RapPracticeEntity entity = new RapPracticeEntity();
		entity.setPractice(PracticeEntity.From(dto.getPracticeId()));
		entity.setRapName(dto.getRapName());
		entity.setRapScore(dto.getRapScore());
		return entity;
	}

	public static RapPracticeEntity From(RapPracticeDto dto) {
		RapPracticeEntity entity = new RapPracticeEntity();
		entity.setRapId(dto.getRapId());
		entity.setPractice(PracticeEntity.From(dto.getPracticeId()));
		entity.setRapName(dto.getRapName());
		entity.setRapScore(dto.getRapScore());
		return entity;
	}
}