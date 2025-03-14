package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.group.ArtistNameEntity;

public interface ArtistNameRepository extends JpaRepository<ArtistNameEntity, Integer> {

}
