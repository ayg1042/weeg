package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.character.ArtistEntity;


public interface ArtistRepository extends JpaRepository<ArtistEntity, Integer>{

	//ArtistEntity findBycharacterId(int character_id);
	
	//캐릭터아이디로 아티스트찾기
	//ArtistEntity findByArtistId(int character_id);

}
