package com.java.entity.group;

import lombok.*;

import jakarta.persistence.*;

import java.util.List;

import com.java.entity.character.ArtistEntity;

@Entity
@Table(name = "Egg_Group")
@Getter
@Setter
@NoArgsConstructor
public class GroupEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "group_id")
    private int groupId;

    @Column(name = "group_name", nullable = false, length = 100)
    private String groupName;

    @Column(name = "gender", nullable = false, length = 10)
    private String gender;

    @Column(name = "member_count", nullable = false)
    private int memberCount;

    /** 그룹에 속한 예명들 (1:N) */
    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ArtistNameEntity> artistNames;
}