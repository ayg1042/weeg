package com.java.entity.item;

import lombok.*;

import com.java.entity.character.InvenEntity;

import jakarta.persistence.*;

@Entity
@Table(name = "Egg_Item")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ItemEntity {

	/** 아이템의 고유 ID (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id")
    private int itemId;

    /** 아이템 정보 (아이템 타입 등) (ManyToOne 관계) */
    @ManyToOne
    @JoinColumn(name = "item_info_id", referencedColumnName = "item_info_id")
    private ItemInfoEntity itemInfo;

    /** 아이템의 이름 */
    @Column(nullable = false, length = 100)
    private String name;

    /** 아이템의 가격 (구매에 필요한 머니) */
    @Column(nullable = false)
    private int price;

    /** 아이템의 이미지 경로 또는 URL */
    @Column(length = 255)
    private String image;
}