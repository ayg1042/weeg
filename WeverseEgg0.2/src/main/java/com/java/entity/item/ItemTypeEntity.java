package com.java.entity.item;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Egg_Item_Type")
@Getter
@Setter
@NoArgsConstructor
public class ItemTypeEntity {

    /** 아이템 타입 PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_type_id")
    private int itemTypeId;

    /** 아이템 타입 (예: "헤어", "의상", "악세서리", "소모품", "이벤트") */
    @Column(name = "item_type", nullable = false, length = 50)
    private String itemType;

}