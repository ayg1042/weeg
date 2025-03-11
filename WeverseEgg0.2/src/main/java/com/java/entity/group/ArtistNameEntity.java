package com.java.entity.group;

import lombok.*;

import com.java.dto.group.ArtistNameDto;

import jakarta.persistence.*;

@Entity
@Table(name = "Egg_Artist_Name")
@Getter
@Setter
@NoArgsConstructor
public class ArtistNameEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "artist_n_id")
    private int artistNId;

    /** 그룹과의 관계 (Many-to-One) */
    @ManyToOne
    @JoinColumn(name = "group_id")
    private GroupEntity group;

    @Column(name = "artist_name", nullable = false, length = 100)
    private String artistName;
    
    public static ArtistNameEntity From(ArtistNameDto dto) {
    	ArtistNameEntity entity = new ArtistNameEntity();
    	entity.setArtistNId(dto.getArtistNId());
    	entity.setGroup(GroupEntity.From(dto.getGroup()));
    	entity.setArtistName(dto.getArtistName());
    	return entity;
    }
}