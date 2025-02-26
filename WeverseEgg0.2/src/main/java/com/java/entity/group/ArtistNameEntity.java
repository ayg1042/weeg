package com.java.entity.group;

import lombok.*;

import jakarta.persistence.*;

@Entity
@Table(name = "Egg_Artist_Name")
@Getter
@Setter
@NoArgsConstructor
public class ArtistNameEntity {

    /** 아티스트 PK */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "artist_n_id")
    private int artistNId;
    
    /** GroupEntity와의 관계 (Many-to-One) */
    @ManyToOne
    @JoinColumn(name = "group_id")  // 외래 키 설정
    private GroupEntity group;  // group 필드 추가

    /** 아티스트의 활동명 (예명) */
    @Column(name = "artist_name", nullable = false, length = 100)
    private String artistName;
}