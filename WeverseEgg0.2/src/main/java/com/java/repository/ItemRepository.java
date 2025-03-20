package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.item.ItemEntity;

public interface ItemRepository extends JpaRepository<ItemEntity, Integer> {

	List<ItemEntity> findAll();

	List<ItemEntity> findByItemInfo_ItemType_ItemTypeIdIn(List<Integer> item_type);

	List<ItemEntity> findByItemInfo_ItemInfoId(int infoId);

}
