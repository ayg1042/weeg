package com.java.service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.character.CharacterDto;
import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;
import com.java.entity.character.CharacterEntity;
import com.java.entity.member.MemberEntity;
import com.java.repository.AespaRepository;
import com.java.repository.CharacterRepository;

@Service
public class AespaServiceImpl implements AespaService {
	
	@Autowired CharacterRepository characterRepository;
	@Autowired AespaRepository aespaRepository;
	
	// 랭크 계산하기
	public void getRankedCharacterList(String GroupKor) {
        // 1. DB에서 그룹명이 에스파인 캐릭터 목록 가져오기
        List<CharacterEntity> characterList = characterRepository.findAllByGroupName(GroupKor);
        
     // 인기 + 매력 합산 후 정렬 (내림차순)
        List<CharacterEntity> sortedList = characterList.stream()
            .sorted((c1, c2) -> Integer.compare(
                (c2.getPopularity() + c2.getCharm()), 
                (c1.getPopularity() + c1.getCharm())
            ))
            .collect(Collectors.toList());

        // 랭크 반영
        int rank = 1;
        for (CharacterEntity entity : sortedList) {
            entity.setRank(rank++);
            characterRepository.save(entity);
        }
    }

	@Override
	public List<CharacterDto> findAll(String GroupKor) {
		List<CharacterEntity> characterList = characterRepository.findAllByGroupName(GroupKor);
				
		// 순위를 기준으로 내림차순 정렬 (rank가 높은 순서대로)
	    return characterList.stream()
	        .sorted(Comparator.comparingInt(CharacterEntity::getRank))  // rank 기준 내림차순 정렬
	        .map(CharacterDto::rank)  // CharacterEntity를 CharacterDto로 변환
	        .collect(Collectors.toList());
	}

	@Override // 피드 글쓰기
	public void newfeed(MemberDto memberDto, String feedWrite) {
		MemberEntity member = MemberEntity.From(memberDto);
		
		FeedDto feedDto = new FeedDto();
		feedDto.setBcontent(feedWrite);
		feedDto.setMember(member);
		feedDto.setCategory("feed");
		feedDto.setStatus("게시중");
		feedDto.setBfile(null);
		
		aespaRepository.save(feedDto);
	}

	@Override
	public List<FeedDto> feedlist() {
		List<FeedDto> feedlist = aespaRepository.findAllByCategoryOrderByBdateDesc("feed");
		return feedlist;
	}

	@Override // 공지사항 가져오기
	public List<FeedDto> notilist(String category, String status) {
		List<FeedDto> notilist = aespaRepository.findAllByCategoryAndStatusOrderByBdateDesc(category, status);
		return notilist;
	}

	@Override // 공지사항 뷰페이지
	public FeedDto notiview(int bno) {
		FeedDto feed = aespaRepository.findById(bno)
				.orElse(null);
		return feed;
	}

	@Override // egg main 배너 이미지 가져오기
	public List<FeedDto> bannerlist() {
		List<FeedDto> banners = aespaRepository.findByCategoryAndStatus("event", "게시중");
		return banners;
	}


}
