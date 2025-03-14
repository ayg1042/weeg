package com.java.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.java.dto.character.CharacterDto;
import com.java.entity.member.MemberEntity;
import com.java.entity.quest.QuestEntity;
import com.java.entity.quest.QuestHistoryEntity;
import com.java.entity.quest.QuestProgressEntity;
import com.java.repository.CharacterRepository;
import com.java.repository.MemberRepository;
import com.java.repository.QuestHistoryRepository;
import com.java.repository.QuestProgressRepository;
import com.java.repository.QuestRepository;
import com.java.service.CharacterService;
import com.java.service.QuestService;
import com.java.service.ModalService;

import jakarta.servlet.http.HttpSession;


@Controller
public class FController {
	
	@Autowired QuestService questService;
	@Autowired QuestProgressRepository questProgressRepository;
	@Autowired CharacterService characterService;
	@Autowired QuestHistoryRepository questHistoryRepository;
	@Autowired MemberRepository memberRepository;
	@Autowired QuestRepository questRepository;
	@Autowired CharacterRepository characterRepository;
	@Autowired ModalService modalServiceImpl;
	@Autowired HttpSession session;
	
	
	
	@GetMapping("/") // 위버스 로그인 안 된 페이지
	public String index1() {
		return "main";
	}
	
	@GetMapping("/loggedIn") // 위버스 로그인 된 메인 페이지
	public String index2() {
		return "main2";
	}
	
	@GetMapping("/eggmain") // 에그 메인 게임 시작 페이지
	public String eggMain() {
		return "egg_main";
	}
	
	@GetMapping("/wemypage") // 위버스 마이페이지 (대표캐릭터 선택)
	public String weMypage() {
		return "weMyPage";
	}
	
	@GetMapping("/wenotice") // 위버스 공지사항
	public String weNotice() {
		return "weNotice";
	}
	
	@GetMapping("/weNoticeView") // 위버스 공지사항 뷰페이지
	public String weNoticeView() {
		return "weNoticeView";
	}
		
	
	@PostMapping("/modal/reward")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> claimReward(@RequestParam int questId, HttpSession session) {
	    Map<String, Object> response = new HashMap<>();
	    
	    // 세션에서 캐릭터 정보 가져오기
	    CharacterDto character = (CharacterDto) session.getAttribute("character");

	    if (character == null) {
	        response.put("success", false);
	        response.put("message", "로그인이 필요합니다.");
	        return ResponseEntity.ok(response);
	    }

	    try {
	    	int userId = character.getMember().getUser_id();
	        int character_id = character.getCharacter_id();
	        System.out.println("userId : " + character_id);
	        System.out.println("questId : " + questId);

	        // 퀘스트 보상 코인 가져오기
	        Integer rewardCoin = questService.getRewardCoin(questId);
	        if (rewardCoin == null) {
	            response.put("success", false);
	            response.put("message", "해당 퀘스트가 존재하지 않습니다.");
	            return ResponseEntity.ok(response);
	        }

	        // 기존 코인 가져오기
	        Integer currentCoin = characterService.getUserCoin(character_id);
	        if (currentCoin == null) currentCoin = 0;

	        // 기존 보상 기록 확인
	        QuestHistoryEntity existingHistory = questHistoryRepository.findByQuest_QuestIdAndMember_UserId(questId, userId);
	        if (existingHistory != null && existingHistory.getIsRewarded() == 1) {
	            response.put("success", false);
	            response.put("message", "이미 보상을 받았습니다.");
	            return ResponseEntity.ok(response);
	        }

	        // ✅ 코인 업데이트 (기존 코인 + 보상 코인)
	        characterService.updateCoin(character_id, rewardCoin);
	        System.out.println("보상 코인: " + rewardCoin);

	        // ✅ 보상 기록 저장
	        MemberEntity member = memberRepository.findById(userId)
	                .orElseThrow(() -> new Exception("사용자 정보를 찾을 수 없습니다."));
	        QuestEntity quest = questRepository.findById(questId)
	                .orElseThrow(() -> new Exception("퀘스트 정보를 찾을 수 없습니다."));

	        QuestHistoryEntity history = new QuestHistoryEntity();
	        history.setMember(member);
	        history.setQuest(quest);
	        history.setIsRewarded(1);
	        history.setCompletionDate(new Timestamp(System.currentTimeMillis()));
	        questHistoryRepository.save(history);

	        // ✅ 진행 상태 업데이트 (퀘스트 완료 처리)
	        QuestProgressEntity progress = questProgressRepository.findByQuest_QuestIdAndMember_UserId(questId, userId);
	        if (progress != null) {
	            progress.setIsCompleted(1);
	            questProgressRepository.save(progress);
	        }

	        // 응답 데이터 구성
	        response.put("success", true);
	        response.put("rewardCoin", rewardCoin);
	        response.put("message", "퀘스트 보상을 받았습니다!");
	        response.put("isRewarded", 1);

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("success", false);
	        response.put("message", "보상 받기를 실패했습니다.");
	    }

	    return ResponseEntity.ok(response);
	}

	
	@GetMapping("/rank") // 랭킹 페이지
	public String rank() {
		return "rank";
	}
	

	
	
}
