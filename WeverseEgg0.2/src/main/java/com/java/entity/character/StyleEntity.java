package com.java.entity.character;

import com.java.entity.item.ItemEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "Egg_Style")
@Getter
@Setter
@NoArgsConstructor
public class StyleEntity {

    /** 스타일 고유번호 (PK) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "style_id")
    private int styleId;

    /** 착용 중인 아이템 리스트 (1:N 관계) */
    @OneToMany
    @JoinColumn(name = "style_id")  // ItemEntity에 style_id 컬럼 생성
    private List<ItemEntity> items;
}
