package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.item.ItemTypeEntity;

public interface ItemTypeRepository extends JpaRepository<ItemTypeEntity, Integer> {

}
