package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.item.ItemInfoEntity;

public interface ItemInfoRepository extends JpaRepository<ItemInfoEntity, Integer> {

}
