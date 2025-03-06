package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.quest.QuestDto;
import com.java.entity.character.CharacterEntity;
import com.java.entity.member.MemberEntity;
import com.java.entity.quest.QuestEntity;
import com.java.entity.quest.QuestProgressEntity;
import com.java.service.QuestService;

import jakarta.servlet.http.HttpSession;

@Controller
public class QuestController {
	@Autowired QuestService questService;
	
	@GetMapping("/questtest") // 전체 리스트 가져오기
	public String quest(Model model) {
		// 퀘스트 리스트 가져오기
		List<QuestDto> list = questService.findAll();
		model.addAttribute("list", list);
		
		return "questTest";
	}
	
	
//	@PostMapping("/quest/test/progress") // 퀘스트 진행 버튼 클릭 시
//    @ResponseBody
//    public Map<String, Object> questProgress(@RequestParam("questId") int questId, @RequestParam("action") String action, Principal principal) {
//        Map<String, Object> response = new HashMap<>();
//
//        // 현재 로그인한 사용자의 캐릭터를 가져오기
//        CharacterEntity character = characterService.findCharacterByMember(principal.getName());
//
//        // 퀘스트 진행 상태 가져오기
//        QuestProgressEntity questProgress = questService.findQuestProgressByCharacterAndQuest(character.getCharacterId(), questId);
//
//        // 퀘스트 진행률 처리 (예: 10%씩 증가)
//        if (action.equals("click")) {
//            int currentProgress = Integer.parseInt(questProgress.getProgress().replace("%", ""));
//            if (currentProgress < 100) {
//                int newProgress = currentProgress + 10; // 10%씩 증가
//                questProgress.setProgress(newProgress + "%");
//                response.put("progress", newProgress); // 진행률을 클라이언트로 반환
//            }
//
//            // 퀘스트 클리어 여부 처리
//            if (Integer.parseInt(questProgress.getProgress().replace("%", "")) == 100) {
//                questProgress.setIsCompleted(1); // 클리어 상태로 변경
//                character.setCoin(character.getCoin() + questProgress.getQuest().getCoin()); // 코인 보상
//                response.put("isCompleted", true); // 퀘스트 완료 처리
//                response.put("rewardCoin", questProgress.getQuest().getCoin()); // 보상 코인
//            }
//
//            questService.saveQuestProgress(questProgress); // 진행상태 업데이트
//            characterService.saveCharacter(character); // 캐릭터 정보 업데이트
//        }
//
//        return response; // JSON 응답
//    }


}



