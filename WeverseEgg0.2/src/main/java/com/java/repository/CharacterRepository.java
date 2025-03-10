package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.entity.character.CharacterEntity;

public interface CharacterRepository extends JpaRepository<CharacterEntity, Integer>{

	List<CharacterEntity> findByMemberUserId(int user_id);

	@Query("SELECT c FROM CharacterEntity c " +
		       "JOIN c.artist a " +
		       "JOIN a.artistName an "+
		       "JOIN an.group g "+
		       "WHERE g.groupName = :groupName")
		List<CharacterEntity> findAllByGroupName(@Param("groupName") String GroupKor);
	
	CharacterEntity findBycharacterId(int i);


}
