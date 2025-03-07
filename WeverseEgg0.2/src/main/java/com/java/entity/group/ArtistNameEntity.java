package com.java.entity.group;

import lombok.*;

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
}