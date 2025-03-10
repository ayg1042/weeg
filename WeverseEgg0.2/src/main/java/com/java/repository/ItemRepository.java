package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.item.ItemEntity;

public interface ItemRepository extends JpaRepository<ItemEntity, Integer> {

	List<ItemEntity> findAll();

}
