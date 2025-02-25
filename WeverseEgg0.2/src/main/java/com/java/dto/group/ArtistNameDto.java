package com.java.dto.group;

import javax.swing.GroupLayout.Group;

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
	/** 아티스트의 활동명 (예명) */
    private String artistName;
    
}
