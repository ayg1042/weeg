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

    /** 그룹 ID (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "group_id")
    private int groupId;

    /** 그룹 이름 */
    @Column(name = "group_name", nullable = false, length = 100)
    private String groupName;

    /** 성별 - 그룹의 성별 (예: 남성, 여성, 혼성) */
    @Column(name = "gender", nullable = false, length = 10)
    private String gender;

    /** 멤버 수 - 그룹에 속한 멤버의 수 */
    @Column(name = "member_count", nullable = false)
    private int memberCount;

    /** 그룹 멤버 (1:N) - 그룹에 속한 아티스트 이름들 */
    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ArtistNameEntity> artistNames;

}