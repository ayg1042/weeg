package com.java.entity.member;

import com.java.dto.member.MemberDto;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Egg_Member")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MemberEntity {

    /** 사용자 ID (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int userId;

    /** 아이디 */
    @Column(nullable = false, unique = true, length = 50)
    private String email;

    /** 비밀번호 */
    @Column(nullable = false, length = 100)
    private String pw;
    
    /** 닉네임 */
    @Column(nullable = false, length = 100)
    private String nickname;
    
    @Column(nullable = false, length = 100)
    private int jelly;
    
 // 정적 팩토리 메서드 추가
    public static MemberEntity join(MemberDto dto) {
        MemberEntity entity = new MemberEntity();
        entity.email = dto.getEmail();
        entity.pw = dto.getPw();
        entity.nickname = dto.getNickname();
        return entity;
    }
}