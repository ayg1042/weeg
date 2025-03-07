package com.java.entity.character;

import java.sql.Timestamp;

import com.java.entity.group.ArtistNameEntity;
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

    /** 아티스트 아이디 (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "artist_id")
    private int artistId;

    /** 예명 정보 (Many-to-One) */
    @ManyToOne
    @JoinColumn(name = "artistNId", referencedColumnName = "artist_n_id", nullable = false)
    private ArtistNameEntity artistName;

    /** 아티스트 레벨 (연습생 → 데뷔 → 성장 과정에서 변화) */
    @Column(nullable = false)
    private int clevel;

    /** 파란딱지 (인증된 아티스트 여부) */
    @Column(nullable = false)
    private int blueMark;

    /** 데뷔일 */
    @Column(nullable = false)
    private Timestamp debutDate;
}
