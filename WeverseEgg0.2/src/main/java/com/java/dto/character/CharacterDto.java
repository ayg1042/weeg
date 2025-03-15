package com.java.dto.character;

import java.util.List;

import com.java.dto.member.MemberDto;
import com.java.entity.character.ArtistEntity;
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
    private List<InvenDto> inven;
    
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
    /** 랭킹 작업을 위한 임시 총점 컬럼  */
    private int rankedScore;  
    
    // 정적 팩토리 메서드 추가
    public static CharacterDto rank(CharacterEntity entity) {
        CharacterDto dto = new CharacterDto();
        dto.setCharacter_id(entity.getCharacterId());
        dto.setNickName(entity.getNickName());
        dto.setMember(MemberDto.login(entity.getMember()));
        dto.setRank(entity.getRank());
        dto.setArtist(ArtistDto.rank(entity.getArtist()));
        dto.setCharm(entity.getCharm());
        dto.setPopularity(entity.getPopularity());
        return dto;
    }
    
    // 정적 팩토리 메서드 추가
    public static CharacterDto from(CharacterEntity entity) {
        CharacterDto dto = new CharacterDto();
        dto.setCharacter_id(entity.getCharacterId());
        dto.setNickName(entity.getNickName());
        dto.setGender(entity.getGender());
        dto.setArtist(ArtistDto.From(entity.getArtist()));
        dto.setMember(MemberDto.From(entity.getMember()));
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
    
    public static CharacterDto unit(CharacterEntity entity) {
    	CharacterDto unitDto = new CharacterDto();
    	unitDto.setCharacter_id(entity.getCharacterId());
    	unitDto.setArtist(ArtistDto.From(entity.getArtist()));
    	unitDto.setNickName(entity.getNickName());
        unitDto.setGender(entity.getGender());
        unitDto.setMember(MemberDto.From(entity.getMember()));
        unitDto.setCoin(entity.getCoin());
        unitDto.setDance(entity.getDance());
        unitDto.setHealth(entity.getHealth());
        unitDto.setFatigue(entity.getFatigue());
        unitDto.setVocal(entity.getVocal());
        unitDto.setRap(entity.getRap());
        unitDto.setEntertainment(entity.getEntertainment());
        unitDto.setCharm(entity.getCharm());
        unitDto.setPopularity(entity.getPopularity());
        unitDto.setRank(entity.getRank());
        unitDto.setExpression(entity.getExpression());
        return unitDto;
    }
    
    
    public static CharacterDto From(CharacterEntity entity) {
    	CharacterDto dto = new CharacterDto();
    	dto.setCharacter_id(entity.getCharacterId());
    	dto.setCoin(entity.getCoin());
    	return dto;
    }

    
}
