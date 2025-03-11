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

import jakarta.servlet.http.HttpSession;

import com.java.service.ModalService;


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
	
	@GetMapping("/index") //테스트 페이지
	public String index() {
		return "main";
	}
	
	@GetMapping("/") // 위버스 로그인 안 된 페이지
	public String index1() {
		return "main";
	}
	
	@GetMapping("/loggedIn") // 위버스 로그인 된 메인 페이지
	public String index2() {
		return "main2";
	}
	
	@GetMapping("/aespa") // 위버스 에스파 페이지 캐릭터 랭킹 
	public String weverseAespa() {
		return "weverse_aespa";
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
	
//	@GetMapping("/modal")
//	public String modal(Model model, HttpSession session) throws JsonProcessingException {
//		
//		CharacterDto character = (CharacterDto) session.getAttribute("character");
//		
//		Integer userId = (Integer) session.getAttribute("user_id");
//		System.out.println("현재 사용자 ID: " + userId);  // userId 확인용
//		
//		// 퀘스트 전체 리스트 가져오기
//		List<QuestDto> list = questService.findAll();
//		model.addAttribute("list", list);
//		
//		// 현재 사용자(user_id = 1)의 진행 정보를 조회 (예시)
//        // 실제 구현 시 로그인한 사용자의 정보를 사용하도록 수정. (임시) 나중에 세션 사용해야함.
//        List<QuestProgressEntity> progressList = questProgressRepository.findAll()
//                .stream()
//                .filter(qp -> qp.getMember().getUserId() == 1)
//                .collect(Collectors.toList());
//        
//        // 퀘스트 아이디를 key로 진행 정보를 매핑하여 Map 생성 (한 퀘스트에 한 진행 정보가 있다고 가정)
//        Map<Integer, QuestProgressEntity> progressMap = new HashMap<>();
//        for (QuestProgressEntity qp : progressList) {
//            // 퀘스트 아이디를 key로 사용 (중복 없다고 가정)
//            progressMap.put(qp.getQuest().getQuestId(), qp);
//        }
//        model.addAttribute("progressMap", progressMap);
//        
//     // 사용자 퀘스트 히스토리 가져오기 (isRewarded 확인)
//        List<QuestHistoryEntity> historyList = questHistoryRepository.findByMember_UserId(userId);
//        System.out.println("퀘스트 히스토리: " + historyList);  // 히스토리 확인용
//        Map<Integer, Integer> rewardedMap = new HashMap<>();
//        for (QuestHistoryEntity history : historyList) {
//            // 각 퀘스트의 isRewarded 상태를 Map에 저장
//            rewardedMap.put(history.getQuest().getQuestId(), history.getIsRewarded());
//        }
//        
//     // rewardedMap을 JSON 문자열로 변환
//        ObjectMapper objectMapper = new ObjectMapper();
//        String rewardedMapJson = objectMapper.writeValueAsString(rewardedMap);
//        
//        // 모델에 JSON 문자열 전달
//        model.addAttribute("rewardedMapJson", rewardedMapJson);
//        System.out.println("rewardedMap: " + rewardedMap);
//        model.addAttribute("rewardedMap", rewardedMap);
//        
//     // 캐릭터의 코인 정보 가져오기
//        // userId로 해당 사용자의 캐릭터를 찾음
//        CharacterEntity character1 = characterRepository.findByMember_UserId(userId);
//        
//        // 캐릭터가 존재한다면 코인 정보 전달
//        if (character1 != null) {
//            model.addAttribute("userCoin", character1.getCoin());
//        } else {
//            // 캐릭터가 없다면 기본값 0
//            model.addAttribute("userCoin", 0);
//        }
//        
//        List<ItemDto> items = modalServiceImpl.getAllItems();
//		System.out.println(items);
//		model.addAttribute("shopList",items);
//		

	
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
//	        int updatedCoin = currentCoin + rewardCoin;
	        characterService.updateCoin(character_id, rewardCoin);
	        System.out.println("보상 코인: " + rewardCoin);

	        // ✅ 세션의 캐릭터 정보 업데이트
	        // session.setAttribute("character", character);

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
