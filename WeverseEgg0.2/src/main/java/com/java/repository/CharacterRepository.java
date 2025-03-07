package com.java.repository;

<<<<<<< HEAD
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.character.CharacterEntity;

public interface CharacterRepository extends JpaRepository<CharacterEntity, Integer> {

	List<CharacterEntity> findByMemberUserId(int user_id);
=======
import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.character.CharacterEntity;

public interface CharacterRepository extends JpaRepository<CharacterEntity, Integer>{
>>>>>>> refs/remotes/origin/master

}
