package com.java.entity.item;

import lombok.*;

import com.java.dto.item.ItemDto;
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
    
    public static ItemEntity From(ItemDto dto) {
    	ItemEntity entity = new ItemEntity();
    	entity.setItemId(dto.getItemId());
    	entity.setItemInfo(ItemInfoEntity.getId(dto.getItemInfo()));
    	entity.setName(dto.getName());
    	entity.setPrice(dto.getPrice());
    	entity.setImage(dto.getImage());
    	return entity;
    }
    
    public static ItemEntity join(ItemDto dto) {
    	ItemEntity entity = new ItemEntity();
		entity.name = dto.getName();
		entity.price = dto.getPrice();
		entity.image = dto.getImage();
		entity.itemInfo = ItemInfoEntity.From(dto.getItemInfo());
		return entity;
    }
    
    public static ItemEntity getId(ItemDto dto) {
    	ItemEntity entity = new ItemEntity();
		entity.setItemId(dto.getItemId());
		return entity;
    }
    
}