package com.java.dto.character;

import java.sql.Timestamp;

import com.java.dto.group.ArtistNameDto;
import com.java.dto.group.GroupDto;
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
@Builder
public class ArtistDto {
    
    /** 아티스트 아이디 PK */
    private int artistId;
    
    /** 소속 그룹 정보 (예: BTS, BLACKPINK 등) FK */
    private ArtistNameDto artistName;
    
    /** 아티스트 레벨 (연습생 → 데뷔 → 성장 과정에서 변화) */
    private int level;
    
    /** 파란딱지 (인증된 아티스트 여부) */
    private int blueMark;
    
    /** 데뷔일 */
    private Timestamp debutDate;
    
 // 정적 팩토리 메서드 추가
    public static ArtistDto rank(ArtistEntity entity) {
    	ArtistDto dto = new ArtistDto();
    	dto.setArtistName(ArtistNameDto.rank(entity.getArtistName()));
        dto.setBlueMark(entity.getBlueMark());
        dto.setLevel(entity.getClevel());
        return dto;
    }
    
    public static ArtistDto info(ArtistEntity entity) {
    	ArtistDto ArtistDto = new ArtistDto();
    	ArtistDto.setArtistName(ArtistNameDto.rank(entity.getArtistName()));
    	ArtistDto.setBlueMark(entity.getBlueMark());
    	ArtistDto.setLevel(entity.getClevel());
    	return ArtistDto;
    }
    
}