package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.character.CharacterDto;
import com.java.dto.character.InvenDto;
import com.java.dto.character.SaveStyleDto;
import com.java.dto.character.StyleDto;
import com.java.dto.feed.FeedDto;
import com.java.dto.item.ItemDto;
import com.java.dto.member.MemberDto;
import com.java.entity.character.StyleEntity;
import com.java.entity.member.MemberEntity;
import com.java.entity.quest.QuestEntity;
import com.java.entity.quest.QuestHistoryEntity;
import com.java.entity.quest.QuestProgressEntity;
import com.java.repository.CharacterRepository;
import com.java.repository.FeedRepository;
import com.java.repository.MemberRepository;
import com.java.repository.QuestHistoryRepository;
import com.java.repository.QuestProgressRepository;
import com.java.repository.QuestRepository;
import com.java.service.AespaService;
import com.java.service.CharacterService;
import com.java.service.MemberService;
import com.java.service.QuestService;
import com.java.service.ModalService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class FController {

	@Autowired
	QuestService questService;
	@Autowired
	QuestProgressRepository questProgressRepository;
	@Autowired
	CharacterService characterService;
	@Autowired
	QuestHistoryRepository questHistoryRepository;
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	QuestRepository questRepository;
	@Autowired
	CharacterRepository characterRepository;
	@Autowired
	ModalService modalServiceImpl;
	@Autowired
	MemberService memberService;
	@Autowired
	AespaService aespaService;
	@Autowired
	HttpSession session;

	@GetMapping("/") // 위버스 로그인 안 된 페이지
	public String index1(Model model, @SessionAttribute(name = "session_id", required = false) MemberDto memberDto) {
		// 로그인한 사용자 정보 가져오기
		if (memberDto != null) {
			int user_id = memberDto.getUser_id();
			// 사용자의 캐릭터 목록 불러오기
			List<CharacterDto> list = characterService.getCharactersByUserId(user_id);
			if (list != null) {
				model.addAttribute("list", list);
			} else {
				model.addAttribute("list", null);
			}
		}
		return "main";
	}

	@GetMapping("/eggmain") // 에그 메인 게임 시작 페이지
	public String eggMain(Model model) {
		List<FeedDto> banners = aespaService.bannerlist();
		model.addAttribute("banners", banners);
		return "egg_main";
	}

	@GetMapping("/wemypage") // 위버스 마이페이지 (대표캐릭터 선택)
	public String weMypage(Model model, @SessionAttribute(name = "session_id", required = false) MemberDto memberDto) {
		// 로그인한 사용자 정보 가져오기
		int user_id = memberDto.getUser_id();
		// 사용자의 캐릭터 목록 불러오기
		List<CharacterDto> list = characterService.getCharactersByUserId(user_id);
		if (list != null) {
			model.addAttribute("list", list);
			// model.addAttribute("userId", user_id);
		} else {
			model.addAttribute("list", null);
		}
		System.out.println(list);
		return "weMyPage";
	}

	@PostMapping("/deleteCharacter") // 위버스 마이페이지 캐릭터 삭제
	@ResponseBody
	@Transactional
	public String deleteCharacter(int characterId) {

		characterService.deleteCharacterById(characterId);

		return "1";
	}

	@GetMapping("/wenotice") // 위버스 공지사항
	public String weNotice(Model model) {
		String category = "notice";
		String status = "게시중";
		List<FeedDto> notilist = aespaService.notilist(category, status);
		model.addAttribute("notilist", notilist);
		return "weNotice";
	}

	@GetMapping("/weNoticeView") // 위버스 공지사항 뷰페이지
	public String weNoticeView(@RequestParam int bno, Model model) {
		FeedDto notice = aespaService.notiview(bno);
		model.addAttribute("fdto", notice);
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
			if (currentCoin == null)
				currentCoin = 0;

			// 기존 보상 기록 확인
			QuestHistoryEntity existingHistory = questHistoryRepository.findByQuest_QuestIdAndMember_UserId(questId,
					userId);
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

			// 기본 퀘스트 보상 메시지
			response.put("message", "퀘스트 보상을 받았습니다!");

			// 퀘스트 아이디가 1,2,3,4가 아닌 경우 랜덤 아이템 보상 추가
			if (questId != 1 && questId != 2 && questId != 3 && questId != 4) {
				// 아이템 인포 아이디가 2인 아이템 리스트 가져오기
				List<ItemDto> itemList = modalServiceImpl.getItemsByItemInfoId(2);
				System.out.println("아이템 리스트 : " + itemList);
				if (itemList != null && !itemList.isEmpty()) {
					// 랜덤으로 하나 선택
					java.util.Random random = new java.util.Random();
					int randomIndex = random.nextInt(itemList.size());
					ItemDto randomItem = itemList.get(randomIndex);

					// 선택된 아이템을 인벤토리에 추가
					InvenDto invenDto = new InvenDto();
					invenDto.setCharacterId(character);
					invenDto.setItemId(randomItem);
					modalServiceImpl.buyItem(invenDto); // 아이템 추가 로직 호출

					// 보상 메시지를 아이템 이름으로 변경
					response.put("rewardItem", randomItem.getName());
					response.put("message", randomItem.getName() + "을(를) 받았습니다!"); // 메시지 수정
					System.out.println("랜덤 보상 아이템 추가됨: " + randomItem.getName());
				}
			}

			// 코인 보상 메시지 추가
			if (rewardCoin != null) {
				response.put("rewardCoin", rewardCoin);
			}

			// 응답 데이터 구성
			response.put("success", true);
			response.put("isRewarded", 1);

		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "보상 받기를 실패했습니다.");
		}

		return ResponseEntity.ok(response);
	}

	@GetMapping("/weBoard") // 위버스에그 자유게시판
	public String weBoard(Model model) {
		List<FeedDto> list = aespaService.findCommunity();
		model.addAttribute("list", list);
		return "weBoard";
	}

	@GetMapping("/weBoardView") // 위버스에그 자유게시판 뷰페이지
	public String weBoardView(int bno, Model model) {
		FeedDto feedDto = aespaService.findById(bno);
		model.addAttribute("fdto", feedDto);
		return "weBoardView";
	}

	@GetMapping("/weBoardWrite") // 위버스에그 자유게시판 글작성 페이지
	public String weBoardWrite() {
		MemberDto user = (MemberDto) session.getAttribute("session_id");
		if (user == null) {
			return "redirect:/login/login";
		}
		return "weBoardWrite";
	}

	@ResponseBody
	@Transactional
	@PostMapping("/weBoardWrite") // 위버스에그 자유게시판 글작성, 이미지파일 업로드
	public String weBoardWrite(@RequestParam("btitle") String btitle, @RequestParam("bcontent") String bcontent,
			@RequestPart MultipartFile files, MemberRepository memberRepository, FeedRepository feedRepository)
			throws IllegalStateException, IOException {

		// 로그인한 사용자 정보 가져오기
		MemberDto user = (MemberDto) session.getAttribute("session_id");
		FeedDto board = new FeedDto();
		String real_fname = "";
		if (!files.isEmpty()) { // 파일첨부가 되어 있으면

			// 최초 파일이름 -> 중복방지를 위해 이름변경
			String origin_fname = files.getOriginalFilename();
			System.out.println("최초 파일이름 : " + origin_fname);

			// 방법1
			long time = System.currentTimeMillis();

			real_fname = String.format("%d_%s", time, origin_fname);
			System.out.println("변경 파일이름 : " + real_fname);
			// 파일저장 위치
			String url = "C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/boardImg/"; // 파일 업로드

			// 파일저장
			File f = new File(url + real_fname);
			// 파일 업로드
			files.transferTo(f);
			// dto에 파일이름 저장
			board.setBfile(real_fname);
		} else {
			board.setBfile("");
		}

		board.setMember(MemberEntity.From(user));
		board.setBtitle(btitle);
		board.setBcontent(bcontent);
		board.setBfile(real_fname);
		board.setCategory("community");
		board.setStatus("게시중");

		// 게시글 저장
		aespaService.weBoardWrite(board);
		return "redirect:/weBoard";
	}

	@GetMapping("/weEvent") // 위버스 이벤트
	public String weEvent(Model model) {
		String category = "event";
		String status = "게시중";
		List<FeedDto> eventlist = aespaService.notilist(category, status);
		model.addAttribute("eventlist", eventlist);
		return "weEvent";
	}

	@GetMapping("/weEventView") // 위버스 이벤트 뷰페이지
	public String weEventView(@RequestParam int bno, Model model) {
		FeedDto event = aespaService.notiview(bno);
		model.addAttribute("fdto", event);
		return "weEventView";
	}

	@GetMapping("/rank") // 위버스에그 랭킹 페이지
	public String rank() {
		return "rank";
	}

}
