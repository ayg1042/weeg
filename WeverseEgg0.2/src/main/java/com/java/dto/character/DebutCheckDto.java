package com.java.dto.character;

import com.java.entity.character.ArtistEntity;
import com.java.entity.character.CharacterEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "Egg_DebutCheck")
public class DebutCheckDto {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "debutid")
    private int debutId;
	
    @ManyToOne
    @JoinColumn(name = "character_id", referencedColumnName = "character_id")
    private CharacterEntity character;

    @ManyToOne
    @JoinColumn(name = "artist_id", referencedColumnName = "artist_id")
    private ArtistEntity artist;
}
