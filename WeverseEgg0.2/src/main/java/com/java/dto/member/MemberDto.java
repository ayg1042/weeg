package com.java.dto.member;

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
    	dto.email = entity.getEmail();
    	dto.pw = entity.getPw();
    	dto.nickname = entity.getNickname();
    	return dto;
    }
}
