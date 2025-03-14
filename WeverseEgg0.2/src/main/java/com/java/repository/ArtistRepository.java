package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.character.ArtistEntity;

public interface ArtistRepository extends JpaRepository<ArtistEntity, Integer> {

}
