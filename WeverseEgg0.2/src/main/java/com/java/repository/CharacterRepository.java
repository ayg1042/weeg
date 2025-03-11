package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import jakarta.transaction.Transactional;

import com.java.entity.character.CharacterEntity;

public interface CharacterRepository extends JpaRepository<CharacterEntity, Integer> {

    // 특정 사용자의 모든 캐릭터 조회
    List<CharacterEntity> findByMemberUserId(int userId);

    // 특정 그룹의 모든 캐릭터 조회
    @Query("SELECT c FROM CharacterEntity c " +
           "JOIN c.artist a " +
           "JOIN a.artistName an " +
           "JOIN an.group g " +
           "WHERE g.groupName = :groupName")
    List<CharacterEntity> findAllByGroupName(@Param("groupName") String groupName);

    // 특정 사용자 ID로 캐릭터 찾기 (단일 조회)
    CharacterEntity findByMember_UserId(Integer userId);

    // 캐릭터 ID로 조회 (중복 제거)
    CharacterEntity findByCharacterId(int characterId);

    // ✅ 사용자의 코인 업데이트 (최적화)
    @Modifying
    @Transactional
    @Query("UPDATE CharacterEntity c SET c.coin = c.coin + :rewardCoin WHERE c.member.userId = :userId")
    int addCoinByUserId(@Param("userId") int userId, @Param("rewardCoin") int rewardCoin);
}
