package com.java.entity.character;

import com.java.entity.member.MemberEntity;
import com.java.entity.character.InvenEntity;
import com.java.entity.character.StyleEntity;
import com.java.dto.character.CharacterDto;
import com.java.entity.character.ArtistEntity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "Egg_Character")
@Getter
@Setter
@NoArgsConstructor
public class CharacterEntity {

    /** 캐릭터 고유번호 (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "character_id")
    private int characterId;

    /** 스타일 정보 (헤어스타일, 의상, 악세서리 등) */
    @OneToMany(mappedBy = "character", cascade = CascadeType.ALL, orphanRemoval = false)
    private List<StyleEntity> styles;

    /** 아티스트 정보 (1:1) */
    @ManyToOne
    @JoinColumn(name = "artist_id", referencedColumnName = "artist_id", nullable = true)
    private ArtistEntity artist;

    /** 사용자 정보 (N:1) */
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private MemberEntity member;

    // 수정됨
    /** 인벤토리 (1:N) */
    @OneToMany(mappedBy = "character", cascade = CascadeType.ALL, orphanRemoval = false)
    private List<InvenEntity> inven;

    /** 캐릭터 닉네임 */
    @Column(name = "nick_name", length = 30, nullable = false, unique = true)
    private String nickName;

    /** 캐릭터 성별 */
    @Column(length = 10, nullable = false)
    private String gender;

    /** 보유 코인 (게임 내 화폐) */
    @Column(nullable = false)
    private int coin;

    /** 체력 (캐릭터의 생명력 또는 에너지) */
    @Column(nullable = false)
    private int health;

    /** 피로도 (연습, 활동에 영향을 줌) */
    @Column(nullable = false)
    private int fatigue;

    /** 댄스 능력치 */
    @Column(nullable = false)
    private int dance;

    /** 보컬 능력치 */
    @Column(nullable = false)
    private int vocal;

    /** 랩 능력치 */
    @Column(nullable = false)
    private int rap;

    /** 예능 능력치 (예능 프로그램 출연 시 영향) */
    @Column(nullable = false)
    private int entertainment;

    /** 매력도 (인기도 확보, 광고 계약 등에 영향) */
    @Column(nullable = false)
    private int charm;

    /** 인기도 (전체적인 유명세를 나타냄) */
    @Column(nullable = false)
    private int popularity;

    /** 랭크 (순위) */
    @Column(nullable = false, name = "crank")
    private int rank;

    /** 표정 */
    @Column(length = 50)
    private String expression;
    
    public static CharacterEntity From(CharacterDto dto) {
    	CharacterEntity entity = new CharacterEntity();
    	entity.setCharacterId(dto.getCharacter_id());
    	entity.setArtist(ArtistEntity.From(dto.getArtist()));
    	entity.setMember(MemberEntity.From(dto.getMember()));
    	entity.setNickName(dto.getNickName());
    	entity.setGender(dto.getGender());
    	entity.setCoin(dto.getCoin());
    	entity.setHealth(dto.getHealth());
    	entity.setFatigue(dto.getFatigue());
    	entity.setDance(dto.getDance());
    	entity.setVocal(dto.getVocal());
    	entity.setRap(dto.getRap());
    	entity.setEntertainment(dto.getEntertainment());
    	entity.setCharm(dto.getCharm());
    	entity.setPopularity(dto.getPopularity());
    	entity.setRank(dto.getRank());
    	entity.setExpression(dto.getExpression());
    	return entity;
    }
    
}
