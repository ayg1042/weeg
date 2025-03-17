package com.java.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.character.CharacterDto;
import com.java.dto.character.InvenDto;
import com.java.dto.character.SaveStyleDto;
import com.java.dto.character.StyleDto;
import com.java.dto.feed.FeedDto;
import com.java.dto.item.ItemDto;
import com.java.dto.practice.DancePracticeDto;
import com.java.dto.practice.EntertainmentPracticeDto;
import com.java.dto.practice.RapPracticeDto;
import com.java.dto.practice.VocalPracticeDto;
import com.java.dto.quest.QuestDto;
import com.java.entity.member.MemberEntity;
import com.java.entity.quest.QuestEntity;
import com.java.entity.quest.QuestHistoryEntity;
import com.java.entity.quest.QuestProgressEntity;
import com.java.repository.CharacterRepository;
import com.java.repository.MemberRepository;
import com.java.repository.QuestHistoryRepository;
import com.java.repository.QuestProgressRepository;
import com.java.repository.QuestRepository;
import com.java.service.AespaService;
import com.java.service.CharacterService;
import com.java.service.ModalService;
import com.java.service.QuestService;
import com.java.util.LvCalc;

import jakarta.servlet.http.HttpSession;

@Controller
public class EggMRController {
	
	@Autowired HttpSession session;
	@Autowired CharacterService characterService;
	@Autowired CharacterRepository characterRepository;
	@Autowired QuestHistoryRepository questHistoryRepository;
	@Autowired ModalService modalServiceImpl;
	@Autowired AespaService aespaService;
	@Autowired QuestService questService;
	@Autowired QuestProgressRepository questProgressRepository;
	@Autowired QuestRepository questRepository;
	@Autowired MemberRepository memberRepository ;
	
	@GetMapping("/modal")
	public String modal(Model model) throws JsonProcessingException {
        
		// === 세션에서 캐릭터 정보 가져오기 ===
		CharacterDto character = (CharacterDto) session.getAttribute("character");
        model.addAttribute("chDto", character);
//        System.out.println(character);

  
        //== 레벨 경험치 체크 ==
        int vocal = character.getVocal();
        int dance = character.getDance();
        int rap = character.getRap();
        int ent = character.getEntertainment();
        int[] lvResult = LvCalc.lvCalc(vocal, dance, ent, rap);
        // 레벨 캐릭터db 저장
        int level = lvResult[0];
//        characterService.lvSave(character.getCharacter_id(), level);
        
        model.addAttribute("lvChk", lvResult);

        // === artist가 "연습생"인지 확인 후 연습생의 트레이닝 데이터 가져오기 ===
        // 유저가 연습생일때의 "PRACTICE_ID = 1" 연습 가져오기(artist가 null이면 vocalId = 1)
        if (character.getArtist().getArtistName().getArtistName() != null && "연습생".equals(character.getArtist().getArtistName().getArtistName())) {
            Map<String, Object> practiceData = characterService.getPracticeIfArtistIsBasic(character);
            VocalPracticeDto vocalBasic = (VocalPracticeDto) practiceData.get("vocalDto");
            DancePracticeDto danceBasic = (DancePracticeDto) practiceData.get("danceDto");
            RapPracticeDto rapBasic = (RapPracticeDto) practiceData.get("rapDto");
            EntertainmentPracticeDto entertainmentBasic = (EntertainmentPracticeDto) practiceData.get("entertainmentDto");
            model.addAttribute("vocal", vocalBasic);
            model.addAttribute("dance", danceBasic);
            model.addAttribute("rap", rapBasic);
            model.addAttribute("ent", entertainmentBasic);
        }else {// 연습생 데뷔 후
        	Map<String, Object> practiceData = characterService.getPracticeIfArtistIsBasic(character);
        	 VocalPracticeDto vocalDebut = (VocalPracticeDto) practiceData.get("vocalDto");
             DancePracticeDto danceDebut = (DancePracticeDto) practiceData.get("danceDto");
             RapPracticeDto rapDebut = (RapPracticeDto) practiceData.get("rapDto");
             EntertainmentPracticeDto entertainmentDebut = (EntertainmentPracticeDto) practiceData.get("entertainmentDto");
             model.addAttribute("vocal", vocalDebut);
             model.addAttribute("dance", danceDebut);
             model.addAttribute("rap", rapDebut);
             model.addAttribute("ent", entertainmentDebut);
        }
        
        System.out.println("================= : "+character);
		System.out.println("캐릭터 보유 코인 : "+character.getCoin());
		
		
//		전체 아이템 리스트
		List<ItemDto> items = modalServiceImpl.getAllItems();
		model.addAttribute("shopList", items);

		// 캐릭터 스타일
		int danceStyle = 0;
		int vocalStyle = 0;
		int enterStyle = 0;
		int rapStyle = 0;
		List<StyleDto> style = modalServiceImpl.getAllStyle(character.getCharacter_id());
		if (style == null) {
			model.addAttribute("styleList", 0);
		} else {
			for (int i = 0; i < style.size(); i++) {
				String type = style.get(i).getItem().getItemInfo().getItemType().getItemType();
				if (Integer.parseInt(type) == 1) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					danceStyle += style.get(i).getItem().getItemInfo().getDance();
					vocalStyle += style.get(i).getItem().getItemInfo().getVocal();
					enterStyle += style.get(i).getItem().getItemInfo().getEntertainment();
					rapStyle += style.get(i).getItem().getItemInfo().getRap();
					model.addAttribute("hat", img);
					model.addAttribute("hat_id", itemId);
				} else if (Integer.parseInt(type) == 2) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					danceStyle += style.get(i).getItem().getItemInfo().getDance();
					vocalStyle += style.get(i).getItem().getItemInfo().getVocal();
					enterStyle += style.get(i).getItem().getItemInfo().getEntertainment();
					rapStyle += style.get(i).getItem().getItemInfo().getRap();
					model.addAttribute("outfit", img);
					model.addAttribute("outfit_id", itemId);
				} else if (Integer.parseInt(type) == 3) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					danceStyle += style.get(i).getItem().getItemInfo().getDance();
					vocalStyle += style.get(i).getItem().getItemInfo().getVocal();
					enterStyle += style.get(i).getItem().getItemInfo().getEntertainment();
					rapStyle += style.get(i).getItem().getItemInfo().getRap();
					model.addAttribute("pet", img);
					model.addAttribute("pet_id", itemId);
				} else if (Integer.parseInt(type) == 6) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("pot", img);
					model.addAttribute("pot_id", itemId);
				} else if (Integer.parseInt(type) == 7) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("sofa", img);
					model.addAttribute("sofa_id", itemId);
				} else if (Integer.parseInt(type) == 8) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("carpet", img);
					model.addAttribute("carpet_id", itemId);
				} else if (Integer.parseInt(type) == 9) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("drawer", img);
					model.addAttribute("drawer_id", itemId);
				} else if (Integer.parseInt(type) == 10) {
					String img = style.get(i).getItem().getImage();
					int itemId = style.get(i).getItem().getItemId();
					model.addAttribute("frame", img);
					model.addAttribute("frame_id", itemId);
				}
			}

			// 스타일 점수
			model.addAttribute("danceStyle", danceStyle);
			model.addAttribute("vocalStyle", vocalStyle);
			model.addAttribute("enterStyle", enterStyle);
			model.addAttribute("rapStyle", rapStyle);
			
			// 퀘스트 전체 리스트 가져오기
			List<QuestDto> list = questService.findAll();
			model.addAttribute("list", list);

			// 현재 사용자(user_id = 1)의 진행 정보를 조회 (예시)
			// 실제 구현 시 로그인한 사용자의 정보를 사용하도록 수정. (임시) 나중에 세션 사용해야함.
			List<QuestProgressEntity> progressList = questProgressRepository.findAll().stream()
					.filter(qp -> qp.getMember().getUserId() == 1).collect(Collectors.toList());

			// 퀘스트 아이디를 key로 진행 정보를 매핑하여 Map 생성 (한 퀘스트에 한 진행 정보가 있다고 가정)
			Map<Integer, QuestProgressEntity> progressMap = new HashMap<>();
			for (QuestProgressEntity qp : progressList) {
				// 퀘스트 아이디를 key로 사용 (중복 없다고 가정)
				progressMap.put(qp.getQuest().getQuestId(), qp);
			}
			model.addAttribute("progressMap", progressMap);

			// 사용자 퀘스트 히스토리 가져오기 (isRewarded 확인)
			List<QuestHistoryEntity> historyList = questHistoryRepository
					.findByMember_UserId(character.getMember().getUser_id());
			System.out.println("퀘스트 히스토리: " + historyList); // 히스토리 확인용
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
			model.addAttribute("userCoin", character.getCoin());
		}

		//이벤트 리스트
		List<FeedDto> events = aespaService.bannerlist();
		model.addAttribute("events",events);
		
		// 데뷔
		if(session.getAttribute("debut") != null) {			
			int debutCheck = (int)session.getAttribute("debut");
			model.addAttribute("debutCheck", debutCheck);
			//session.removeAttribute("debut");
		}
		
		// 케릭터 인벤토리
		List<InvenDto> Inven = modalServiceImpl.getCharacterInven(character.getCharacter_id());
		System.out.println("Inven List - "+Inven);
		model.addAttribute("invenList", Inven);
		model.addAttribute("character", character);
		
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        System.out.println(character.getArtist().getLevel());
		
		
		return "modal";
	}

	@ResponseBody
	@PostMapping("/buyItem") //아이템 구매
	public String memDelete(String itemId) {
		// 세션에서 가져올꺼임
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		List<InvenDto> Inven = modalServiceImpl.getCharacterInven(character.getCharacter_id());
		// 중복아이템 확인
		Set<Integer> invenItemIds = Inven.stream()
                .map(inven -> inven.getItemId().getItemId())
                .collect(Collectors.toSet());
		if (invenItemIds.contains(Integer.parseInt(itemId))) {
			return "2";
		}
		// 케릭터 결제로직
		// 아이템 가져오기
		ItemDto item = modalServiceImpl.getItem(Integer.parseInt(itemId));
		int coin = character.getCoin() - item.getPrice();
		if(coin < 0) {
			return "0";
		}
		character.setCoin(coin);
		modalServiceImpl.characterSave(character);
		session.setAttribute("character", character);
		// 결제

		// 아이템 추가
		InvenDto Inven1 = new InvenDto();
		Inven1.setCharacterId(character);
		Inven1.setItemId(item);
		modalServiceImpl.buyItem(Inven1);

		return "1";
	}

	@Transactional
	@ResponseBody
	@PostMapping("/styleSave")
	public String styleSave(@RequestBody ArrayList<SaveStyleDto> styleList) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		int charm = 0;
		modalServiceImpl.deleteStyleByUserId(character.getCharacter_id());
		for (SaveStyleDto item : styleList) {
			if (item.getItemId() != "") {
				StyleDto dto = new StyleDto();
				ItemDto iDto = new ItemDto();
				iDto.setItemId(Integer.parseInt(item.getItemId()));
				dto.setCharacter(character);
				dto.setItem(iDto);
				ItemDto styleItem = modalServiceImpl.getItem(iDto.getItemId());
				charm += styleItem.getItemInfo().getCharm();
				modalServiceImpl.styleSave(dto);
			}

		}
		character.setCharm(charm);
		modalServiceImpl.characterSave(character);
		return "1";
	}

	@Transactional
	@ResponseBody
	@PostMapping("/itemUse")
	public String itemUse(String invenId, String itemId) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");

		// 사용 로직
		ItemDto item = modalServiceImpl.getItem(Integer.parseInt(itemId));
		if(character.getFatigue() == 0) return "0";
		int fatigue = character.getFatigue() - item.getItemInfo().getFatigueRecovery();
		if(fatigue < 0) fatigue = 0;
		character.setFatigue(fatigue);
		
		// 해당 아이템 삭제
		modalServiceImpl.deleteInvenItem(Integer.parseInt(invenId));
		modalServiceImpl.characterSave(character);
		session.setAttribute("character", character);
		return "1";
	}

	// 보컬트레이닝
	@PostMapping("/trainSave/vocal")
	@ResponseBody
	public String vocalTrainSave(int vocalScore, int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		// CharacterDto(character_id=1, style=null, artist=ArtistDto(artistId=1,
		// groupId=GroupDto(groupId=1, artistName=ArtistNameDto(artistNId=1,
		// artistName=윈터), groupName=에스파, gender=여성, memberCount=4), level=1,
		// blueMark=1, debutDate=2020-11-17 00:00:00.0), member=MemberDto(user_id=1,
		// email=aaa@naver.com, pw=1111, nickname=길동스, jelly=0), inven=null,
		// nickName=윙터, gender=여자, coin=100000, health=100, fatigue=0, dance=0, vocal=0,
		// rap=0, entertainment=0, charm=0, popularity=0, rank=0, expression=슬픔)
		int character_id = character.getCharacter_id();
		// 보컬연습결과 유저 캐릭터에 저장
		characterService.vocalTrainSave(character_id, vocalScore, health, fatigue, price);

		// 퀘스트 진행도 업데이트 - 1번 퀘스트
		int questId = 1;
		updateQuestProgress(character, questId);

		return "연습을 열심히 했습니다!(뿌듯)";
	}

	// 댄스트레이닝
	@PostMapping("/trainSave/dance")
	@ResponseBody
	public String danceTrainSave(int danceScore, int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		//CharacterDto(character_id=1, style=null, artist=ArtistDto(artistId=1, groupId=GroupDto(groupId=1, artistName=ArtistNameDto(artistNId=1, artistName=윈터), groupName=에스파, gender=여성, memberCount=4), level=1, blueMark=1, debutDate=2020-11-17 00:00:00.0), member=MemberDto(user_id=1, email=aaa@naver.com, pw=1111, nickname=길동스, jelly=0), inven=null, nickName=윙터, gender=여자, coin=100000, health=100, fatigue=0, dance=0, vocal=0, rap=0, entertainment=0, charm=0, popularity=0, rank=0, expression=슬픔)
		int character_id = character.getCharacter_id();
		// 보컬연습결과 유저 캐릭터에 저장
		characterService.danceTrainSave(character_id,danceScore,health,fatigue,price);
		
		return "연습을 열심히 했습니다!(뿌듯)";
	}

	// 랩트레이닝
	@PostMapping("/trainSave/rap")
	@ResponseBody
	public String rapTrainSave(int rapScore, int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		//CharacterDto(character_id=1, style=null, artist=ArtistDto(artistId=1, groupId=GroupDto(groupId=1, artistName=ArtistNameDto(artistNId=1, artistName=윈터), groupName=에스파, gender=여성, memberCount=4), level=1, blueMark=1, debutDate=2020-11-17 00:00:00.0), member=MemberDto(user_id=1, email=aaa@naver.com, pw=1111, nickname=길동스, jelly=0), inven=null, nickName=윙터, gender=여자, coin=100000, health=100, fatigue=0, dance=0, vocal=0, rap=0, entertainment=0, charm=0, popularity=0, rank=0, expression=슬픔)
		int character_id = character.getCharacter_id();
		// 보컬연습결과 유저 캐릭터에 저장
		characterService.rapTrainSave(character_id,rapScore,health,fatigue,price);
		
		return "연습을 열심히 했습니다!(뿌듯)";
	}

	// 예능트레이닝
	@PostMapping("/trainSave/ent")
	@ResponseBody
	public String entTrainSave(int entScore, int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		//CharacterDto(character_id=1, style=null, artist=ArtistDto(artistId=1, groupId=GroupDto(groupId=1, artistName=ArtistNameDto(artistNId=1, artistName=윈터), groupName=에스파, gender=여성, memberCount=4), level=1, blueMark=1, debutDate=2020-11-17 00:00:00.0), member=MemberDto(user_id=1, email=aaa@naver.com, pw=1111, nickname=길동스, jelly=0), inven=null, nickName=윙터, gender=여자, coin=100000, health=100, fatigue=0, dance=0, vocal=0, rap=0, entertainment=0, charm=0, popularity=0, rank=0, expression=슬픔)
		int character_id = character.getCharacter_id();
		// 보컬연습결과 유저 캐릭터에 저장
		characterService.entTrainSave(character_id,entScore,health,fatigue,price);
		
		return "연습을 열심히 했습니다!(뿌듯)";
	}

	// 음악방송출연
	@PostMapping("/actSave/music_actvity")
	@ResponseBody
	public String music_actvity(int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		int character_id = character.getCharacter_id();
		// 음악방송출연 결과 유저 캐릭터에 저장
		characterService.music_actvity_save(character_id,health,fatigue,price);
		return "음악방송에 출연해서 인기도가 올랐습니다!(뿌듯)";
	}

	// 예능출연
	@PostMapping("/actSave/ent_actvity")
	@ResponseBody
	public String ent_actvity(int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		int character_id = character.getCharacter_id();
		// 예능출연 결과 유저 캐릭터에 저장
		characterService.ent_actvity(character_id,health,fatigue,price);
		return "예능에 출연해서 인기도가 올랐습니다!(뿌듯)";
	}

	// 콘서트
	@PostMapping("/actSave/con_actvity")
	@ResponseBody
	public String con_actvity(int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		int character_id = character.getCharacter_id();
		// 콘서트개최 결과 유저 캐릭터에 저장
		characterService.con_actvity(character_id,health,fatigue,price);
		return "콘서트를 개최해서 인기도가 올랐습니다!(뿌듯)";
	}

	// 팬사인회
	@PostMapping("/actSave/sign_actvity")
	@ResponseBody
	public String sign_actvity(int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("character");
		int character_id = character.getCharacter_id();
		// 팬사인회 결과 유저 캐릭터에 저장
		characterService.sign_actvity(character_id,health,fatigue,price);
		return "팬사인회를 잘 마치고 인기도가 올랐습니다!(뿌듯)";
	}

	// 퀘스트 진행도 업데이트 메서드
	private void updateQuestProgress(CharacterDto character, int questId) {
	    // CharacterDto 내의 MemberDto에서 userId를 추출
	    int userId = character.getMember().getUser_id();

	    // Repository의 연관관계 기반 메서드 사용하여 progressEntity 조회
	    QuestProgressEntity progressEntity = questProgressRepository.findByQuest_QuestIdAndMember_UserId(questId, userId);

	    if (progressEntity == null) {
	        // 레코드가 없으면 새롭게 생성 (초기 진행도 "0%")
	        progressEntity = new QuestProgressEntity();

	        // MemberEntity 및 QuestEntity 설정
	        MemberEntity member = memberRepository.findById(userId).orElse(null);
	        if (member == null) {
	            // 만약 member가 DB에 없다면 새로 생성 후 저장
	            member = new MemberEntity();
	            member.setUserId(userId);
	            memberRepository.save(member);
	        }
	        progressEntity.setMember(member);

	        QuestEntity quest = questRepository.findById(questId).orElse(null);
	        if (quest == null) {
	            // 만약 quest가 DB에 없다면 새로 생성 후 저장
	            quest = new QuestEntity();
	            quest.setQuestId(questId);
	            questRepository.save(quest);
	        }
	        progressEntity.setQuest(quest);

	        progressEntity.setIsCompleted(0);
	        progressEntity.setProgress("0%");
	    }

	    // 현재 진행도 ("30%" -> 30) 파싱
	    int currentProgress = Integer.parseInt(progressEntity.getProgress().replace("%", ""));

	    // 퀘스트 수행 횟수 설정 (기본값: 5)
	    int required = 5;
	    if (questId == 1 || questId == 2) {
	        required = 10;
	    } else if (questId == 3 || questId == 4) {
	        required = 5;
	    } else {
	        required = 1; // 예외적인 경우 1번 수행으로 100% 완료
	    }

	    // 증가량 계산 (100%를 required 횟수로 나누기)
	    int increment = 100 / required;

	    // 현재 진행도 업데이트 (100%를 초과할 경우 100으로 고정)
	    currentProgress += increment;
	    if (currentProgress > 100) {
	        currentProgress = 100;
	    }

	    progressEntity.setProgress(currentProgress + "%");

	    // 100%가 되면 완료 상태 업데이트
	    if (currentProgress == 100) {
	        progressEntity.setIsCompleted(1);
	    }

	    // 변경사항 저장
	    questProgressRepository.save(progressEntity);
	}

	
	

}
