package com.java.dto.member;

import java.util.ArrayList;
import java.util.List;

import com.java.entity.member.MemberEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDto {
	private int user_id;
	private String email;
	private String pw;
	private String nickname; 
	private int jelly;
	
    // 정적 팩토리 메서드 추가
    public static MemberDto Email(MemberEntity entity) {
        MemberDto dto = new MemberDto();
        dto.email = entity.getEmail();
        return dto;
    }
    
    public static MemberDto login(MemberEntity entity) {
    	MemberDto dto = new MemberDto();
    	dto.user_id = entity.getUserId();
    	dto.email = entity.getEmail();
    	dto.nickname = entity.getNickname();
    	dto.jelly = entity.getJelly();
    	return dto;
    }
    
    public static MemberDto From(MemberEntity entity) {
		MemberDto dto = new MemberDto();
		dto.user_id = entity.getUserId();
		dto.email = entity.getEmail();
		dto.pw = entity.getPw();
		dto.nickname = entity.getNickname();
		dto.jelly = entity.getJelly();
		return dto;
	}
    
    // 회원전체리스트
    public static List<MemberDto> list(List<MemberEntity> memEntity) {
    	List<MemberDto> memDtoList = new ArrayList<>();
        
        for (MemberEntity entity : memEntity) {
            MemberDto dto = new MemberDto();
            dto.user_id = entity.getUserId();
            dto.email = entity.getEmail();
            dto.nickname = entity.getNickname();
            dto.jelly = entity.getJelly();
            memDtoList.add(dto);
        }
        return memDtoList;
    }

	public static MemberDto kakaojoin(MemberEntity entity) {
		MemberDto dto = new MemberDto();
    	dto.email = entity.getEmail();
    	dto.nickname = entity.getNickname();
    	return dto;
	}
	
	public static MemberDto jelly(MemberEntity entity) {
		MemberDto dto = new MemberDto();
		dto.jelly = entity.getJelly();
		return dto;
	}


}
