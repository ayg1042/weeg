package com.java.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.quest.QuestDto;
import com.java.entity.character.CharacterEntity;
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

import com.java.dto.item.ItemDto;
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
	
//	@GetMapping("/weverserank") // 위버스 에스파 그룹랭킹
//	public String rank() {
//		return "rank";
//	}
	
	
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
	
	@GetMapping("/jellyshop") //젤리 구매 페이지
	public String jellyShop() {
		return "jelly_shop";
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
	
	@GetMapping("/modal")
	public String modal(Model model, HttpSession session) throws JsonProcessingException {
		
		Integer userId = (Integer) session.getAttribute("user_id");
		System.out.println("현재 사용자 ID: " + userId);  // userId 확인용
		
		// 퀘스트 전체 리스트 가져오기
		List<QuestDto> list = questService.findAll();
		model.addAttribute("list", list);
		
		// 현재 사용자(user_id = 1)의 진행 정보를 조회 (예시)
        // 실제 구현 시 로그인한 사용자의 정보를 사용하도록 수정. (임시) 나중에 세션 사용해야함.
        List<QuestProgressEntity> progressList = questProgressRepository.findAll()
                .stream()
                .filter(qp -> qp.getMember().getUserId() == 1)
                .collect(Collectors.toList());
        
        // 퀘스트 아이디를 key로 진행 정보를 매핑하여 Map 생성 (한 퀘스트에 한 진행 정보가 있다고 가정)
        Map<Integer, QuestProgressEntity> progressMap = new HashMap<>();
        for (QuestProgressEntity qp : progressList) {
            // 퀘스트 아이디를 key로 사용 (중복 없다고 가정)
            progressMap.put(qp.getQuest().getQuestId(), qp);
        }
        model.addAttribute("progressMap", progressMap);
        
     // 사용자 퀘스트 히스토리 가져오기 (isRewarded 확인)
        List<QuestHistoryEntity> historyList = questHistoryRepository.findByMember_UserId(userId);
        System.out.println("퀘스트 히스토리: " + historyList);  // 히스토리 확인용
        Map<Integer, Integer> rewardedMap = new HashMap<>();
        for (QuestHistoryEntity history : historyList) {
            // 각 퀘스트의 isRewarded 상태를 Map에 저장
            rewardedMap.put(history.getQuest().getQuestId(), history.getIsRewarded());
        }
        
     // rewardedMap을 JSON 문자열로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        String rewardedMapJson = objectMapper.writeValueAsString(rewardedMap);
        
        // 모델에 JSON 문자열 전달
        model.addAttribute("rewardedMapJson", rewardedMapJson);
        System.out.println("rewardedMap: " + rewardedMap);
        model.addAttribute("rewardedMap", rewardedMap);
        
     // 캐릭터의 코인 정보 가져오기
        // userId로 해당 사용자의 캐릭터를 찾음
        CharacterEntity character = characterRepository.findByMember_UserId(userId);
        
        // 캐릭터가 존재한다면 코인 정보 전달
        if (character != null) {
            model.addAttribute("userCoin", character.getCoin());
        } else {
            // 캐릭터가 없다면 기본값 0
            model.addAttribute("userCoin", 0);
        }
        
        List<ItemDto> items = modalServiceImpl.getAllItems();
		System.out.println(items);
		model.addAttribute("shopList",items);
		
		return "modal";
	}
	
	@PostMapping("/modal/reward")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> claimReward(@RequestParam int questId, HttpSession session) {
	    Map<String, Object> response = new HashMap<>();

	    Integer userId = (Integer) session.getAttribute("user_id");
	    if (userId == null) {
	        response.put("success", false);
	        response.put("message", "로그인이 필요합니다.");
	        return ResponseEntity.ok(response);
	    }

	    try {
	        // 퀘스트 ID에 해당하는 보상 코인 가져오기
	        System.out.println("userId : " + userId);
	        System.out.println("questId : " + questId);
	        Integer rewardCoin = questService.getRewardCoin(questId);
	        if (rewardCoin == null) {
	            response.put("success", false);
	            response.put("message", "해당 퀘스트가 존재하지 않습니다.");
	            return ResponseEntity.ok(response);
	        }

	        // 현재 사용자 코인 가져오기
	        Integer userCoin = characterService.getCoin(userId);
	        if (userCoin == null) userCoin = 0; // 기본값 0

	        // 새로운 코인 값 계산
	        int newCoin = userCoin + rewardCoin;

	        // 사용자 코인 업데이트
	        characterService.updateCoin(userId, newCoin);
	        
	     // QuestHistoryEntity에서 보상받았는지 확인

	        QuestHistoryEntity existingHistory = questHistoryRepository.findByQuest_QuestIdAndMember_UserId(questId, userId);
	        if (existingHistory != null && existingHistory.getIsRewarded() == 1) {
	            response.put("success", false);
	            response.put("message", "이미 보상을 받았습니다.");
	            return ResponseEntity.ok(response);
	        }
	        
	        // ✅ MemberEntity & QuestEntity 조회
	        MemberEntity member = memberRepository.findById(userId).orElseThrow(() -> new Exception("사용자 정보를 찾을 수 없습니다."));
	        QuestEntity quest = questRepository.findById(questId).orElseThrow(() -> new Exception("퀘스트 정보를 찾을 수 없습니다."));

	     // ✅ 보상 기록 저장
	        QuestHistoryEntity history = new QuestHistoryEntity();
	        history.setMember(member);  // 기존에 존재하는 MemberEntity 설정
	        history.setQuest(quest);    // 기존에 존재하는 QuestEntity 설정
	        history.setIsRewarded(1);   // 보상받음 상태
	        history.setCompletionDate(new Timestamp(System.currentTimeMillis())); // 보상 받은 시간 설정
	        questHistoryRepository.save(history); // 저장
	        
	     // ✅ 진행 상태 업데이트 (퀘스트 완료 처리)
	        QuestProgressEntity progress = questProgressRepository.findByQuest_QuestIdAndMember_UserId(questId, userId);
	        if (progress != null) {
	            progress.setIsCompleted(1);  // 퀘스트 완료 상태로 변경
	            questProgressRepository.save(progress); // 진행 상태 업데이트
	        }

	        // 응답 데이터 구성
	        response.put("success", true);
	        response.put("newCoin", newCoin);
	        response.put("message", "보상을 받았습니다!");
	        response.put("isRewarded", 1);  // 보상 상태 추가

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("success", false);
	        response.put("message", "보상 받기 실패");
	    }
	    

	    return ResponseEntity.ok(response);
	}
	

	@GetMapping("/rank") // 랭킹 페이지
	public String rank() {
		return "rank";
	}

	
	
}
