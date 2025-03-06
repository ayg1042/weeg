package com.java.controller;

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

import com.java.dto.quest.QuestDto;
import com.java.entity.quest.QuestProgressEntity;
import com.java.repository.QuestProgressRepository;
import com.java.service.CharacterService;
import com.java.service.QuestService;

import jakarta.servlet.http.HttpSession;


@Controller
public class FController {
	
	@Autowired QuestService questService;
	@Autowired QuestProgressRepository questProgressRepository;
	@Autowired CharacterService characterService;
	
	@GetMapping("/weverserank") // 위버스 에스파 그룹랭킹
	public String rank() {
		return "rank";
	}
	
	
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
	
	@GetMapping("/weverseaespa") // 위버스 에스파 페이지 캐릭터 랭킹 
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
	
	@GetMapping("/modal")
	public String modal(Model model, HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
	
		
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

	        // 응답 데이터 구성
	        response.put("success", true);
	        response.put("newCoin", newCoin);
	        response.put("message", "보상을 받았습니다!");

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("success", false);
	        response.put("message", "보상 받기 실패");
	    }

	    return ResponseEntity.ok(response);
	}

	
	
}
