package com.java.dto.group;

import java.util.List;

import javax.swing.GroupLayout.Group;

import com.java.entity.group.ArtistNameEntity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ArtistNameDto {
    
    /** 아티스트 PK */
    private int artistNId;
    
    /** 아티스트가 속한 그룹 정보 (GroupDto) */
    private GroupDto group; // GroupDto 추가
    
    /** 아티스트의 활동명 (예명) */
    private String artistName;
    
    // 정적 팩토리 메서드 추가
    public static ArtistNameDto rank(ArtistNameEntity entity) {
    	ArtistNameDto dto = new ArtistNameDto();
    	dto.setArtistNId(entity.getArtistNId());
    	dto.setGroup(GroupDto.rank(entity.getGroup()));
        dto.setArtistName(entity.getArtistName());
        return dto;
    }
    
    
    public static ArtistNameDto info(ArtistNameEntity artistNameEntity) {
    	ArtistNameDto artistNameDto = new ArtistNameDto();
    	artistNameDto.setArtistNId(artistNameEntity.getArtistNId());
    	artistNameDto.setArtistName(artistNameEntity.getArtistName());
    	artistNameDto.setGroup(GroupDto.info(artistNameEntity.getGroup()));
    	
    	return artistNameDto;
    }


	public static ArtistNameDto From(ArtistNameEntity entity) {
		ArtistNameDto dto = new ArtistNameDto();
    	dto.setArtistNId(entity.getArtistNId());
    	dto.setGroup(GroupDto.From(entity.getGroup()));
        dto.setArtistName(entity.getArtistName());
        return dto;
	}
    
}
