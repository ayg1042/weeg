package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;
import com.java.dto.practice.DancePracticeDto;
import com.java.dto.practice.EntertainmentPracticeDto;
import com.java.dto.practice.PracticeDto;
import com.java.dto.practice.PracticeType;
import com.java.dto.practice.RapPracticeDto;
import com.java.dto.practice.VocalPracticeDto;
import com.java.dto.quest.QuestDto;
import com.java.dto.group.ArtistNameDto;
import com.java.dto.group.GroupDto;
import com.java.service.AdminService;
import com.java.dto.character.CharacterDto;
import com.java.dto.item.ItemDto;
import com.java.dto.item.ItemInfoDto;
import com.java.dto.item.ItemTypeDto;
import com.java.service.CharacterService;
import com.java.service.MemberService;
import com.java.service.ModalService;
import com.java.service.ModalServiceImpl;
import com.java.service.QuestService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired HttpSession session;
	@Autowired CharacterService characterService;
	@Autowired MemberService memberService;
	@Autowired ModalService modalService;
	@Autowired ModalServiceImpl modalServiceImpl;
	@Autowired AdminService adminService;
	
	@GetMapping("")
	public String admin() {
		return "/admin/admin_login";
	}

	@PostMapping("")
	public String admin(String adminId, String adminPw, 
			Model model, RedirectAttributes redirectAttributes) {
		MemberDto admin = memberService.findByEmailAndPw(adminId, adminPw);
		if (admin != null) {
	        session.setAttribute("session_admin", admin);
	        redirectAttributes.addFlashAttribute("lmsg", "1");
	        return "redirect:/admin/main";
	    } else {
	        redirectAttributes.addFlashAttribute("lmsg", "0");
	        return "redirect:/admin";
	    }
	}

	@GetMapping("/logout")
	public String logout() {
		session.removeAttribute("session_admin");
		return "redirect:/admin";
	}

	// 회원관리
	@GetMapping("/main")
	public String main(Model model) {
		// 회원전체리스트
		if(session.getAttribute("session_admin") == null ) return "/main";
		List<MemberDto> memberDto = memberService.findAll();
		System.out.println(memberDto);
		model.addAttribute("memberList", memberDto);
		return "/admin/admin_main";
	}

	// 회원 상세보기
	@GetMapping("/memView")
	public String memview(int user, Model model) {
		if(session.getAttribute("session_admin") == null ) return "/main";
		// 회원 1명 정보 가져오기
		MemberDto memberDto = memberService.findByUserId(user);
		// 해당 회원의 캐릭터 가져오기
		List<CharacterDto> characterDtos = characterService.getCharactersByUserId(user);
		int chListSize = (characterDtos != null) ? characterDtos.size() : 0;

		model.addAttribute("member", memberDto);
		model.addAttribute("chListSize", chListSize);
		model.addAttribute("chList", characterDtos);
		return "/admin/admin_memView";
	}

	
	 // 회원삭제
	 @PostMapping("/memDelete")
	 @ResponseBody public String memDelete(int userId) {
	 System.out.println("에이잭스 확인 : "+userId); memberService.deleteById(userId);
	 return "회원이 삭제되었습니다."; }
	 
	
	@GetMapping("/notice")
	public String board(Model model) {
		if(session.getAttribute("session_admin") == null ) return "/main";
		String category = "notice";
		List<FeedDto> notilist = adminService.notilist(category);
		model.addAttribute("notilist", notilist);
		return "/admin/admin_notice";
	}

	// 게시상태 업데이트 메서드
	@PostMapping("/updateStatus")
	@ResponseBody
	public ResponseEntity<String> updateStatus(@RequestParam int bno, @RequestParam String status) {
		if ("1".equals(status)) {
			status = "게시중";
		} else if ("0".equals(status)) {
			status = "게시안함";
		}

		try {
			// FeedDto에 해당하는 엔티티를 찾아서 상태 업데이트
			adminService.updateStatus(bno, status);
			return ResponseEntity.ok("상태 업데이트 성공");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("상태 업데이트 실패");
		}
	}

	// 공지사항 뷰페이지
	@GetMapping("/noticeView")
	public String noticeView(@RequestParam int bno, Model model) {
		if(session.getAttribute("session_admin") == null ) return "/main";
		FeedDto notice = adminService.notiview(bno);
		model.addAttribute("fdto", notice);
		return "/admin/admin_noticeView";
	}

	// 공지사항 삭제
	@GetMapping("/deleteFeed")
	public String deleteFeed(@RequestParam int bno) {
		if(session.getAttribute("session_admin") == null ) return "/main";
		adminService.delFeed(bno);
		return "/admin/admin_notice";
	}

	// 아이템 리스트
	@GetMapping("/items")
	public String items(@RequestParam(required = false) String category, Model model) {
		if(session.getAttribute("session_admin") == null ) return "/main";
		// 아이템리스트 가져오기
		Collection<? extends ItemDto> itemLists = new ArrayList<>();

		if (category == null || "0".equals(category)) {// 아이템 전체
			itemLists = modalService.getAllItems();
		} else {// 체크된 아이템 리스트
			List<Integer> item_type = new ArrayList<>();
			if ("4".equals(category)) {
				item_type.add(Integer.parseInt(category));
				item_type.add(Integer.parseInt(category) + 1);
			} else if ("6".equals(category)) {
				item_type.add(Integer.parseInt(category));
				item_type.add(Integer.parseInt(category) + 1);
				item_type.add(Integer.parseInt(category) + 2);
				item_type.add(Integer.parseInt(category) + 3);
				item_type.add(Integer.parseInt(category) + 4);
			} else {
				item_type.add(Integer.parseInt(category));
			}
			itemLists = modalService.findByItemInfo_ItemType_ItemTypeIdIn(item_type);
		}

		model.addAttribute("items", itemLists);
		model.addAttribute("selectedCategories", category);

		return "/admin/admin_items";
	}
	
	
	
	// 공지글 작성
		@GetMapping("/noticeWrite")
		public String noticeWrite() {
			if(session.getAttribute("session_admin") == null ) return "/main";
			return "/admin/admin_noticeWrite";
		}
		
		@PostMapping("/noticeWrite")
		public String noticeWrite(
				@RequestParam("notiTitle") String title,
	            @RequestParam("notiContent") String content,
	            @RequestParam("file") MultipartFile file,
	            HttpSession session) {
			
			String category = "notice";
			 // 예: 세션에서 로그인한 사용자 ID 가져오기
		    MemberDto member = (MemberDto) session.getAttribute("session_admin"); 
			adminService.notiWrite(title,content,file,category,member);
			
			return "redirect:/admin/notice";
		}
		
		// 공지글 수정
		@GetMapping("/noticeModify")
		public String noticeModify(@RequestParam int bno, Model model) {
			if(session.getAttribute("session_admin") == null ) return "/main";
			FeedDto notice = adminService.notiview(bno);
			model.addAttribute("notimodi",notice);
			return "/admin/admin_noticeWrite";
		}
		
		@PostMapping("/noticeModify")
		public String noticeModify(
				@RequestParam("bno") int bno,
				@RequestParam("notiTitle") String title,
	            @RequestParam("notiContent") String content,
	            @RequestParam("file") MultipartFile file) {
			
			adminService.notiModi(title,content,file,bno);
			
			return "redirect:/admin/notice";
		}
		
		// 이벤트
		@GetMapping("/event")
		public String event(Model model) {
			if(session.getAttribute("session_admin") == null ) return "/main";
			String category = "event";
			List<FeedDto> notilist = adminService.notilist(category);
			model.addAttribute("notilist",notilist);
			return "/admin/admin_event";
		}
		
		@GetMapping("/eventView")
		public String eventView(@RequestParam int bno, Model model) {
			if(session.getAttribute("session_admin") == null ) return "/main";
			FeedDto event = adminService.notiview(bno);
			model.addAttribute("fdto",event);
			return "/admin/admin_eventView";
		}
		
		@GetMapping("/eventWrite")
		public String eventWrite() {
			if(session.getAttribute("session_admin") == null ) return "/main";
			return "/admin/admin_eventWrite";
		}
		
		@PostMapping("/eventWrite")
		public String eventWrite(
				@RequestParam("eventTitle") String title,
	            @RequestParam("eventContent") String content,
	            @RequestParam("file") MultipartFile file,
	            @RequestParam("file_banner") MultipartFile fileb,
	            @RequestParam("file_modal") MultipartFile filem,
	            HttpSession session) {
			
			String category = "event";
			 // 예: 세션에서 로그인한 사용자 ID 가져오기
		    MemberDto member = (MemberDto) session.getAttribute("session_admin"); 
			adminService.eventWrite(title,content,file,fileb,filem,category,member);
			
			return "redirect:/admin/event";
		}
		
		// 이벤트 수정
		@GetMapping("/eventModify")
		public String eventModify(@RequestParam int bno, Model model) {
			if(session.getAttribute("session_admin") == null ) return "/main";
			FeedDto event = adminService.notiview(bno);
			model.addAttribute("eventmodi",event);
			return "/admin/admin_eventWrite";
		}
		
		@PostMapping("/eventModify")
		public String eventModify(
				@RequestParam("bno") int bno,
				@RequestParam("eventTitle") String title,
	            @RequestParam("eventContent") String content,
	            @RequestParam("file") MultipartFile file,
	            @RequestParam("file_banner") MultipartFile fileb,
	            @RequestParam("file_modal") MultipartFile filem,
	            @RequestParam(value="deleteFile_notice", required = false) boolean delfile,
	            @RequestParam(value="deleteFile_banner", required = false) boolean delfileb,
	            @RequestParam(value="deleteFile_modal", required = false) boolean delfilem) {
			
			adminService.eventModi(title,content,file,fileb,filem,bno,delfile,delfileb,delfilem);
			
			return "redirect:/admin/event";
		}
	

	@GetMapping("/index") // 어드민
	public String index(Model model) {
		
		if(session.getAttribute("session_admin") == null ) return "/main";
		
		List<ItemTypeDto> itemType = modalServiceImpl.getAllItemTypes();
		List<ItemInfoDto> itemInfo = modalServiceImpl.getAllItemInfo();
		List<ItemDto> itemDto = modalServiceImpl.getAllItems();
		List<GroupDto> group = modalServiceImpl.getAllGroup();
		List<ArtistNameDto> artist = modalServiceImpl.getAllArtistName();

		model.addAttribute("itemTypeList", itemType);
		model.addAttribute("itemInfoList", itemInfo);
		model.addAttribute("itemList", itemDto);
		model.addAttribute("groupList", group);
		model.addAttribute("artistList", artist);

		return "index";
	}
	
	// 아이템 추가


	@GetMapping("/itemAdd")
	public String itemAdd(Model model) {
		
		if(session.getAttribute("session_admin") == null ) return "/main";
		
		List<ItemTypeDto> itemType = modalServiceImpl.getAllItemTypes();
		List<ItemInfoDto> itemInfo = modalServiceImpl.getAllItemInfo();
		
		model.addAttribute("itemTypeList", itemType);
		model.addAttribute("itemInfoList", itemInfo);
		
		return "/admin/admin_itemAdd";
	}
	
	
	// 아이템 정보 추가
	@PostMapping("/itemAdd")
	@ResponseBody
	@Transactional
	public String itemAdd(
			@RequestParam("itemName") String itemName,
			@RequestParam("price") int price,
			@RequestParam("itemInfoId") int itemInfoId,
	        @RequestParam("category") String category,
	        @RequestPart MultipartFile file) throws Exception {
		
		String imgName = "";
		if (!file.isEmpty()) {
			imgName = file.getOriginalFilename();
			System.out.println("파일이름 : "+imgName);
			String url = "C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/items/"+category+"/";
			File f = new File(url+imgName); //파일객체 생성
			file.transferTo(f); //파일올리기
		}

		ItemDto item = new ItemDto();
		ItemInfoDto info = new ItemInfoDto();
		info.setItemInfoId(itemInfoId);
		item.setName(itemName);
		item.setImage(imgName);
		item.setPrice(price);
		item.setItemInfo(info);

		modalServiceImpl.addItem(item);

		return "1";
	}

	// 아이템 추가
	@PostMapping("/itemInfoAdd")
	@ResponseBody
	@Transactional
	public String itemInfoAdd(@RequestParam("itemType") String itemType,
			@RequestParam(value = "charm", defaultValue = "0") int charm,
            @RequestParam(value = "dance", defaultValue = "0") int dance,
            @RequestParam(value = "rap", defaultValue = "0") int rap,
            @RequestParam(value = "vocal", defaultValue = "0") int vocal,
            @RequestParam(value = "entertainment", defaultValue = "0") int entertainment,
            @RequestParam(value = "fatgue_recovery", defaultValue = "0") int fatigueRecovery) {

		ItemInfoDto info = new ItemInfoDto();
		ItemTypeDto type = new ItemTypeDto();
		type.setItemTypeId(Integer.parseInt(itemType)); info.setItemType(type);
		info.setCharm(charm); info.setDance(dance); info.setRap(rap);
		info.setVocal(vocal); info.setEntertainment(entertainment);
		info.setFatigueRecovery(fatigueRecovery);

		modalServiceImpl.addItemInfo(info);

		return "1";
	}

	@PostMapping("/itemInfoUpdate")
	@ResponseBody
	@Transactional
	public String itemInfoUpdate(@RequestParam("itemInfoId") String itemInfoId,
			@RequestParam(value = "charm", defaultValue = "0") int charm,
            @RequestParam(value = "dance", defaultValue = "0") int dance,
            @RequestParam(value = "rap", defaultValue = "0") int rap,
            @RequestParam(value = "vocal", defaultValue = "0") int vocal,
            @RequestParam(value = "entertainment", defaultValue = "0") int entertainment,
            @RequestParam(value = "fatgue_recovery", defaultValue = "0") int fatigueRecovery) {
		ItemInfoDto info = modalServiceImpl.getItemInfo(Integer.parseInt(itemInfoId));
		info.setCharm(charm);
		info.setDance(dance);
		info.setRap(rap);
		info.setVocal(vocal);
		info.setEntertainment(entertainment);
		info.setFatigueRecovery(fatigueRecovery);

		modalServiceImpl.updateItemInfo(info);

		return "1";
	}

	@PostMapping("/itemDelete")
	@ResponseBody
	@Transactional
	public String itemDelete(@RequestParam("itemId") String itemId) {
		ItemDto dto = modalServiceImpl.getItem(Integer.parseInt(itemId));
		modalServiceImpl.deleteItem(dto.getItemId());
		return "1";
	}

	@PostMapping("/addGroup")
	@ResponseBody
	@Transactional
	public String addGroup(
			@RequestParam(value = "group_name", defaultValue = "0") String name,
            @RequestParam(value = "member_count", defaultValue = "0") int count,
            @RequestParam(value = "group_gender", defaultValue = "여자") String gender
			) {
		GroupDto dto= new GroupDto();
		dto.setGroupName(name);
		dto.setMemberCount(count);
		dto.setGender(gender);
		modalServiceImpl.addGroup(dto);
		return "1";
	}

	@PostMapping("/updateGroup")
	@ResponseBody
	@Transactional
	public String updateGroup(
			@RequestParam(value = "groupId", defaultValue = "1") int groupId,
			@RequestParam(value = "group_name", defaultValue = "0") String name,
            @RequestParam(value = "member_count", defaultValue = "0") int count,
            @RequestParam(value = "group_gender", defaultValue = "여자") String gender
			) {
		GroupDto dto = new GroupDto();
		dto.setGroupId(groupId);
		dto.setGroupName(name);
		dto.setMemberCount(count);
		dto.setGender(gender);
		modalServiceImpl.updateGroup(dto);
		return "1";
	}

	@PostMapping("/deleteGroup")
	@ResponseBody
	@Transactional
	public String deleteGroup(@RequestParam(value = "groupId") int groupId) {

		GroupDto dto = modalServiceImpl.getGroup(groupId);
		modalServiceImpl.deleteGroup(dto.getGroupId());
		return "1";
	}

	@PostMapping("/addArtistName")
	@ResponseBody
	@Transactional
	public String addArtist(@RequestParam(value = "groupId") int groupId,
			@RequestParam(value = "artistName") String artistName) {
		GroupDto group = modalServiceImpl.getGroup(groupId);
		ArtistNameDto artist = new ArtistNameDto();
		artist.setGroup(group);
		artist.setArtistName(artistName);
		modalServiceImpl.addArtistName(artist);
		return "1";
	}

	@PostMapping("/updateArtistName")
	@ResponseBody
	@Transactional
	public String updateAritstName(
			@RequestParam(value = "artistNId") int artistNId,
			@RequestParam(value = "artistName") String artistName
			) {
		ArtistNameDto artist = modalServiceImpl.getArtistName(artistNId);
		artist.setArtistName(artistName);
		modalServiceImpl.updateArtistName(artist);
		return "1";
	}

	@PostMapping("/deleteArtistName")
	@ResponseBody
	@Transactional
	public String deleteArtistName(@RequestParam(value = "artistNId") int artistNId) {
		ArtistNameDto dto = modalServiceImpl.getArtistName(artistNId);
		modalServiceImpl.deleteArtistName(dto);

		return "1";
	}
	
	@GetMapping("/artist")
	public String artist(Model model) {
		if(session.getAttribute("session_admin") == null ) return "/main";
		List<ArtistNameDto> artist = modalServiceImpl.getAllArtistName();
		List<GroupDto> group = modalServiceImpl.getAllGroup();
		
		model.addAttribute("groupList", group);
		model.addAttribute("artistList", artist);
		
		return "/admin/admin_artist";
	}
	@GetMapping("/group")
	public String group(Model model) {
		if(session.getAttribute("session_admin") == null ) return "/main";
		List<GroupDto> group = modalServiceImpl.getAllGroup();
		
		model.addAttribute("groupList", group);
		
		return "/admin/admin_group";
	}
	
	@GetMapping("/admin_quest")
	public String updateQuest() {
		if(session.getAttribute("session_admin") == null ) return "/main";
		return "/admin/admin_quest";
	}
	@RestController
 	@RequestMapping("/admin")
 	public class AdminQuestController {
 	    @Autowired
 	    private QuestService questService;
 	   
 	    // 퀘스트 목록 조회
 	    @GetMapping("/admin_quest/list")
 	    public List<QuestDto> getAllQuests() {
 	    	return questService.findAll();
 	    }
 	   
 	    // 퀘스트 저장 (기존 퀘스트 수정 또는 새 퀘스트 생성)
 	    @PostMapping("/admin_quest/save")
 	    @Transactional
 	    @ResponseBody
 	    public String saveQuest(QuestDto questdto) {
 	    	System.out.println("퀘스트 저장됨: " + questdto);
 	    	questService.saveQuest(questdto);
 	    	return "퀘스트가 성공적으로 저장되었습니다.";
 	    }
	}

	// 트레이닝 관리
	@GetMapping("/training")
	public String admin_training(Model model) {
		
		if(session.getAttribute("session_admin") == null ) return "/main";
		
		List<PracticeType> practiceType = modalServiceImpl.getAllPracticeType();
		List<PracticeDto> practice = modalServiceImpl.getAllPractice();
		
		List<DancePracticeDto> dancePractice = modalServiceImpl.getAllDancePractice();
		List<VocalPracticeDto> vocalpractice = modalServiceImpl.getAllVocalPractice();
		List<RapPracticeDto> rapPractice = modalServiceImpl.getAllRapPractice();
		List<EntertainmentPracticeDto> enterPractice = modalServiceImpl.getAllEnterPractice();
		
		model.addAttribute("practiceTypeList", practiceType);
		model.addAttribute("practiceList", practice);
		
		model.addAttribute("DanceList", dancePractice);
		model.addAttribute("VocalList", vocalpractice);
		model.addAttribute("RapList", rapPractice);
		model.addAttribute("EnterList", enterPractice);
		
		return "/admin/admin_training";
	}
	
	// 트레이닝 타입 추가
	@PostMapping("/addpracticeType")
	@ResponseBody
	@Transactional
	public String addpracticeType(@RequestParam("practiceType") String practiceType) {
		PracticeType dto = new PracticeType();
		dto.setPracticeType(practiceType);
		modalServiceImpl.addPracticeType(dto);
		return "1";
	}
	
	// 트레이닝 타입 삭제
	@PostMapping("/deletepracticeType")
	@ResponseBody
	@Transactional
	public String deletepracticeType(@RequestParam("practiceType") int practiceTypeId) {
		PracticeType dto = modalServiceImpl.getPracticeType(practiceTypeId);
		modalServiceImpl.deletePracticeType(dto);
		return "1";
	}
	
	// 연습 추가
	@PostMapping("/addPractice")
	@ResponseBody
	@Transactional
	public String addPractice(
			@RequestParam("practiceTypeId") int practiceTypeId,
			@RequestParam("price") int price,
			@RequestParam("health") int health,
			@RequestParam("fatigue") int fatigue
			) {
		PracticeType practiceType = modalServiceImpl.getPracticeType(practiceTypeId);
		PracticeDto dto = new PracticeDto();
		dto.setPracticeType(practiceType);
		dto.setHealth(health);
		dto.setPrice(price);
		dto.setFatigue(fatigue);
		
		modalServiceImpl.addPractice(dto);
		
		return "1";
	}
	
	// 연습 수정
	@PostMapping("/updatePractice")
	@ResponseBody
	@Transactional
	public String updatePractice(
			@RequestParam("updatePracticeId") int updatePracticeId,
			@RequestParam("price") int price,
			@RequestParam("health") int health,
			@RequestParam("fatigue") int fatigue
			) {
		PracticeDto dto = modalServiceImpl.getPractice(updatePracticeId);
		dto.setHealth(health);
		dto.setPrice(price);
		dto.setFatigue(fatigue);
		
		modalServiceImpl.updatePractice(dto);
		
		return "1";
	}
	
	// 연습 삭제
	@PostMapping("/deletePractice")
	@ResponseBody
	@Transactional
	public String deletePractice(
			@RequestParam("practiceId") int practiceId) {
		PracticeDto dto = modalServiceImpl.getPractice(practiceId);
		
		modalServiceImpl.deletePractice(dto);
		
		return "1";
	}
	
	// 춤 추가
	@PostMapping("/addDance")
	@ResponseBody
	@Transactional
	public String addDance(
			@RequestParam("practiceId") int practiceId,
			@RequestParam("name") String name,
			@RequestParam("point") int point
			
			) {
		PracticeDto practice = modalServiceImpl.getPractice(practiceId);
		DancePracticeDto dto = new DancePracticeDto();
		dto.setDanceName(name);
		dto.setDanceScore(point);
		dto.setPracticeId(practice);
		
		modalServiceImpl.addDancePractice(dto);
		
		return "1";
	}
	
	// 춤 삭제
	@PostMapping("/deleteDance")
	@ResponseBody
	@Transactional
	public String deleteDance(
			@RequestParam("danceId") int danceId) {
		DancePracticeDto dto = modalServiceImpl.getDancePractice(danceId);
		modalServiceImpl.deleteDancePractice(dto);
		return "1";
	}
	
	// 보컬 추가
	@PostMapping("/addVocal")
	@ResponseBody
	@Transactional
	public String addVocal(
			@RequestParam("practiceId") int practiceId,
			@RequestParam("name") String name,
			@RequestParam("point") int point
			
			) {
		PracticeDto practice = modalServiceImpl.getPractice(practiceId);
		VocalPracticeDto dto = new VocalPracticeDto();
		dto.setVocalName(name);
		dto.setVocalScore(point);
		dto.setPracticeId(practice);
		
		modalServiceImpl.addVocalPractice(dto);
		
		return "1";
	}
	
	// 보컬 삭제
	@PostMapping("/deleteVocal")
	@ResponseBody
	@Transactional
	public String deleteVocal(
			@RequestParam("vocalId") int vocalId) {
		VocalPracticeDto dto = modalServiceImpl.getVocalPractice(vocalId);
		modalServiceImpl.deleteVocalPractice(dto);
		return "1";
	}
	
	// 랩 추가
	@PostMapping("/addRap")
	@ResponseBody
	@Transactional
	public String addRap(
			@RequestParam("practiceId") int practiceId,
			@RequestParam("name") String name,
			@RequestParam("point") int point
			
			) {
		PracticeDto practice = modalServiceImpl.getPractice(practiceId);
		RapPracticeDto dto = new RapPracticeDto();
		dto.setRapName(name);
		dto.setRapScore(point);
		dto.setPracticeId(practice);
		
		modalServiceImpl.addRapPractice(dto);
		
		return "1";
	}
	
	// 랩 삭제
	@PostMapping("/deleteRap")
	@ResponseBody
	@Transactional
	public String deleteRap(
			@RequestParam("rapId") int rapId) {
		RapPracticeDto dto = modalServiceImpl.getRapPractice(rapId);
		modalServiceImpl.deleteRapPractice(dto);
		return "1";
	}
	
	// 예능 추가
	@PostMapping("/addEnter")
	@ResponseBody
	@Transactional
	public String addEnter(
			@RequestParam("practiceId") int practiceId,
			@RequestParam("name") String name,
			@RequestParam("point") int point
			
			) {
		PracticeDto practice = modalServiceImpl.getPractice(practiceId);
		EntertainmentPracticeDto dto = new EntertainmentPracticeDto();
		dto.setEntertainmentName(name);
		dto.setEntertainmentScore(point);
		dto.setPracticeId(practice);
		
		modalServiceImpl.addEntertainmentPractice(dto);
		
		return "1";
	}
	
	// 예능 삭제
	@PostMapping("/deleteEtner")
	@ResponseBody
	@Transactional
	public String deleteEtner(
			@RequestParam("enterId") int enterId) {
		EntertainmentPracticeDto dto = modalServiceImpl.getEntertainmentPractice(enterId);
		modalServiceImpl.deleteEntertainmentPractice(dto);
		return "1";
	}
	
	
}
