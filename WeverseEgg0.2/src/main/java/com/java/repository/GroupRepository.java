package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.group.GroupEntity;

public interface GroupRepository extends JpaRepository<GroupEntity, Integer> {

}
