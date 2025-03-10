package com.java.entity.character;

import java.util.List;

import com.java.dto.character.InvenDto;
import com.java.entity.item.ItemEntity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "Egg_Inven")
@Data
public class InvenEntity {

    /** 인벤토리 PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "inven_id")
    private int invenId;

    /** 캐릭터 FK (1:N) */
    @ManyToOne
    @JoinColumn(name = "character_id", referencedColumnName = "character_id")
    private CharacterEntity character;

    /** 아이템 리스트 (1:N) */
    @ManyToOne
    @JoinColumn(name = "item_id", referencedColumnName = "item_id")
    private ItemEntity item;
    
    public static InvenEntity From(InvenDto dto) {
    	InvenEntity entity = new InvenEntity();
    	entity.setCharacter(CharacterEntity.From(dto.getCharacterId()));
    	entity.setItem(ItemEntity.From(dto.getItemId()));
    	return entity;
    }
    
}