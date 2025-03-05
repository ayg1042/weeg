package com.java.dto.character;

import java.util.List;

import com.java.dto.member.MemberDto;
import com.java.entity.character.CharacterEntity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CharacterDto {
	
	/** 캐릭터 고유번호 (Primary Key) */
    private int character_id;
    /** 스타일 정보 (헤어스타일, 의상, 악세서리 등) FK */
    private List<StyleDto> style;
    /** 아티스트 정보 FK */
    private ArtistDto artist;
    /** 사용자 user_id FK */
    private MemberDto member;
    /** 인벤토리 invenId Fk */
    private InvenDto inven;
    /** 캐릭터 닉네임 */
    private String nickName;
    /** 캐릭터 성별 */
    private String gender;
    /** 보유 코인 (게임 내 화폐) */
    private int coin;
    /** 체력 (캐릭터의 생명력 또는 에너지) */
    private int health;
    /** 피로도 (연습, 활동에 영향을 줌) */
    private int fatigue;
    /** 댄스 능력치 */
    private int dance;
    /** 보컬 능력치 */
    private int vocal;
    /** 랩 능력치 */
    private int rap;
    /** 예능 능력치 (예능 프로그램 출연 시 영향) */
    private int entertainment;
    /** 매력도 (인기도 확보, 광고 계약 등에 영향) */
    private int charm;
    /** 인기도 (전체적인 유명세를 나타냄) */
    private int popularity;
    /** 랭크 (순위) */
    private int rank;
    /** 표정 */
    private String expression;
    
    // 정적 팩토리 메서드 추가
    public static CharacterDto from(CharacterEntity entity) {
        CharacterDto dto = new CharacterDto();
        dto.setCharacter_id(entity.getCharacterId());
        dto.setNickName(entity.getNickName());
        dto.setGender(entity.getGender());
        dto.setCoin(entity.getCoin());
        dto.setDance(entity.getDance());
        dto.setHealth(entity.getHealth());
        dto.setFatigue(entity.getFatigue());
        dto.setVocal(entity.getVocal());
        dto.setRap(entity.getRap());
        dto.setEntertainment(entity.getEntertainment());
        dto.setCharm(entity.getCharm());
        dto.setPopularity(entity.getPopularity());
        dto.setRank(entity.getRank());
        dto.setExpression(entity.getExpression());
        return dto;
    }
    
    
    
}
