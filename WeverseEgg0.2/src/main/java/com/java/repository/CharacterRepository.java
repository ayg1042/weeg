package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import jakarta.transaction.Transactional;

import com.java.dto.character.CharacterDto;
import com.java.entity.character.CharacterEntity;

public interface CharacterRepository extends JpaRepository<CharacterEntity, Integer> {

	List<CharacterEntity> findByMemberUserId(int user_id);
	
	@Query("SELECT c FROM CharacterEntity c " +
		       "JOIN c.artist a " +
		       "JOIN a.artistName an "+
		       "JOIN an.group g "+
		       "WHERE g.groupName = :groupName")
		List<CharacterEntity> findAllByGroupName(@Param("groupName") String GroupKor);
	
    // userId를 기준으로 코인 값을 찾는 쿼리
    @Query("SELECT c.coin FROM CharacterEntity c WHERE c.member.userId = :userId")
    Integer findCoinByUserId(@Param("userId") int userId);

    // userId를 기준으로 코인을 업데이트하는 쿼리
    @Modifying
    @Transactional
    @Query("UPDATE CharacterEntity c SET c.coin = :newCoin WHERE c.member.userId = :userId")
    void updateCoinByUserId(@Param("userId") int userId, @Param("newCoin") int newCoin);

	CharacterEntity findByMember_UserId(Integer userId);
}
