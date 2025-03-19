package com.java.dto.feed;

import java.sql.Timestamp;

import com.java.entity.character.CharacterEntity;
import com.java.entity.member.MemberEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Egg_FeedCheck")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class FeedCheckDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fcId;
	
	@ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private MemberEntity member;
	
	@ManyToOne
    @JoinColumn(name = "character_id", referencedColumnName = "character_id")
    private CharacterEntity character;
	

	@ManyToOne
    @JoinColumn(name = "bno", referencedColumnName = "bno")
	private FeedDto feed;
	
}
