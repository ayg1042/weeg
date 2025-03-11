package com.java.entity.character;

import java.sql.Timestamp;

import com.java.dto.character.ArtistDto;
import com.java.dto.character.CharacterDto;
import com.java.entity.group.ArtistNameEntity;
import com.java.entity.group.GroupEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Egg_Artist")
@Getter
@Setter
@NoArgsConstructor
public class ArtistEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "artist_id")
    private int artistId;

    /** 예명 정보 (Many-to-One) */
    @ManyToOne
    @JoinColumn(name = "artistNId", referencedColumnName = "artist_n_id", nullable = false)
    private ArtistNameEntity artistName;

    @Column(nullable = false)
    private int clevel;

    @Column(nullable = false)
    private int blueMark;

    @Column(nullable = false)
    private Timestamp debutDate;
    
    

    
}