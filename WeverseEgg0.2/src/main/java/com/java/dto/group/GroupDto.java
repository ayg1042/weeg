package com.java.dto.group;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GroupDto {
	
	 /** 그룹 ID (PK) - 그룹을 식별하는 고유한 번호 */
    private int groupId;
    /** 그룹 멤버 (예: 방탄소년단, 블랙핑크) FK */
    private ArtistNameDto artistName;
    /** 그룹 이름 */
    private String groupName;
    /** 성별 - 그룹의 성별 (예: 남성, 여성, 혼성) */
    private String gender;
    /** 멤버 수 - 그룹에 속한 멤버의 수 */
    private int memberCount;
	
}
