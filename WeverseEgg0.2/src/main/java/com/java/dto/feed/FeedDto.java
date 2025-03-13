package com.java.dto.feed;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.java.entity.member.MemberEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Egg_Feed")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class FeedDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bno;
	
	private String btitle;
	
	@Lob
	private String bcontent;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="id")
	private MemberEntity member;
	
	private Timestamp bdate;
	private String bfile;
	private String bfile_banner;
	private String bfile_modal;
	
	@Column(nullable= false)
	private String category;
	
	private String status= "게시안함";
	
	@PrePersist
    public void setBdate() {
        // 객체가 null일 때, bdate를 현재 시간으로 자동 설정
        if (this.bdate == null) {
            this.bdate = Timestamp.valueOf(LocalDateTime.now());
        }
    }

}
