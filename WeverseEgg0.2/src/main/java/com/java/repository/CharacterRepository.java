package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.entity.character.CharacterEntity;

public interface CharacterRepository extends JpaRepository<CharacterEntity, Integer>{

	@Query("SELECT c FROM CharacterEntity c " +
		       "JOIN c.artist a " +
		       "JOIN a.artistName an "+
		       "JOIN an.group g "+
		       "WHERE g.groupName = :groupName")
		List<CharacterEntity> findAllByGroupName(@Param("groupName") String GroupKor);

}
