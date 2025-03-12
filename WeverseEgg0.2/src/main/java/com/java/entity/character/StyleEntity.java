package com.java.entity.character;

import com.java.dto.character.StyleDto;
import com.java.entity.item.ItemEntity;
import com.java.entity.item.ItemInfoEntity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "Egg_Style")
@Getter
@Setter
@NoArgsConstructor
public class StyleEntity {

    /** 스타일 고유번호 (PK) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "style_id")
    private int styleId;
    
    /** CharacterEntity와의 관계 (Many-to-One) */
    @ManyToOne
    @JoinColumn(name = "character_id")  // 외래 키 설정
    private CharacterEntity character;

    /** 착용 중인 아이템 리스트 (1:N 관계) */
    @ManyToOne
    @JoinColumn(name = "item_id", referencedColumnName = "item_id")
    private ItemEntity item;

	public static StyleEntity From(StyleDto dto) {
		StyleEntity entity = new StyleEntity();
		entity.setCharacter(CharacterEntity.From(dto.getCharacter()));
		entity.setItem(ItemEntity.getId(dto.getItem()));
		return entity;
		
	}
}
