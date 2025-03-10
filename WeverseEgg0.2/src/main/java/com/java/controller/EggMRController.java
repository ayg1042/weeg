package com.java.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.character.CharacterDto;
import com.java.dto.member.MemberDto;
import com.java.dto.practice.DancePracticeDto;
import com.java.dto.practice.EntertainmentPracticeDto;
import com.java.dto.practice.RapPracticeDto;
import com.java.dto.practice.VocalPracticeDto;
import com.java.service.CharacterService;
import com.java.util.LvCalc;

import jakarta.servlet.http.HttpSession;

@Controller
public class EggMRController {
	
	@Autowired HttpSession session;
	@Autowired CharacterService characterService;

	@GetMapping("/modal")
	public String modal(Model model) {
		
		// 테스트용 세션 저장
		session.setAttribute("session_id", new MemberDto()); 
		// 세션에서 로그인한 사용자 ID 가져오기
//		MemberDto session_id = (MemberDto) session.getAttribute("session_id");
//		System.out.println("session_idsession_id: "+session_id);
//		System.out.println(session_id.getUser_id());
		
		// ======== 트레이닝 ========
		// 임시_ 로그인한 유저의 캐릭터 캐릭터아이디 1인 테이블 가져오기
		int i = 1;
		CharacterDto unitDto = characterService.unit(i);
		System.out.println("unitDto : "+unitDto);
		session.setAttribute("session_character", unitDto);
		System.out.println("session_character 세셔ㅑㄴ : "+session.getAttribute("session_character"));
		
		
		// 유저가 연습생일때의 "PRACTICE_ID = 1" 연습 가져오기(artist가 null이면 vocalId = 1)
		// === 세션에서 캐릭터 정보 가져오기 ===
        CharacterDto character = (CharacterDto) session.getAttribute("session_character");
        model.addAttribute("chDto", character);
        
        
        //== 레벨 경험치 체크 ==
        int vocal = character.getVocal();
        int dance = character.getDance();
        int rap = character.getRap();
        int ent = character.getEntertainment();
        int[] lvResult = LvCalc.lvCalc(vocal, dance, ent, rap);
        model.addAttribute("lvChk", lvResult);

        // === artist가 "윈터"인지 확인 후 연습 데이터 가져오기 ===
        if (character.getArtist().getGroupId().getArtistName().getArtistName() != null && "윈터".equals(character.getArtist().getGroupId().getArtistName().getArtistName())) {
            Map<String, Object> practiceData = characterService.getPracticeIfArtistIsWinter(character);
            // 보컬
            VocalPracticeDto vocalBasic = (VocalPracticeDto) practiceData.get("vocalDto");
            DancePracticeDto danceBasic = (DancePracticeDto) practiceData.get("danceDto");
            RapPracticeDto rapBasic = (RapPracticeDto) practiceData.get("rapDto");
            EntertainmentPracticeDto entertainmentBasic = (EntertainmentPracticeDto) practiceData.get("entertainmentDto");

            model.addAttribute("vocal", vocalBasic);
            model.addAttribute("dance", danceBasic);
            model.addAttribute("rap", rapBasic);
            model.addAttribute("ent", entertainmentBasic);

//            System.out.println("Vocal Practice : " + practiceData.get("vocalDto"));
//            System.out.println("Dance Practice : " + practiceData.get("danceDto"));
//            System.out.println("Rap Practice : " + practiceData.get("rapDto"));
//            System.out.println("entertainmentDto Practice : " + practiceData.get("entertainmentDto"));
            
        }
        
        System.out.println("================= : "+character);
		System.out.println("캐릭터 보유 코인 : "+character.getCoin());
		return "modal";
	}
	
	// 보컬트레이닝
	@PostMapping("/trainSave/vocal")
	@ResponseBody
	public String vocalTrainSave(int vocalScore, int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("session_character");
		//CharacterDto(character_id=1, style=null, artist=ArtistDto(artistId=1, groupId=GroupDto(groupId=1, artistName=ArtistNameDto(artistNId=1, artistName=윈터), groupName=에스파, gender=여성, memberCount=4), level=1, blueMark=1, debutDate=2020-11-17 00:00:00.0), member=MemberDto(user_id=1, email=aaa@naver.com, pw=1111, nickname=길동스, jelly=0), inven=null, nickName=윙터, gender=여자, coin=100000, health=100, fatigue=0, dance=0, vocal=0, rap=0, entertainment=0, charm=0, popularity=0, rank=0, expression=슬픔)
		int character_id = character.getCharacter_id();
		// 보컬연습결과 유저 캐릭터에 저장
		characterService.vocalTrainSave(character_id,vocalScore,health,fatigue,price);
		
		return "연습을 열심히 했습니다!(뿌듯)";
	}
	
	// 댄스트레이닝
	@PostMapping("/trainSave/dance")
	@ResponseBody
	public String danceTrainSave(int danceScore, int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("session_character");
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
		CharacterDto character = (CharacterDto) session.getAttribute("session_character");
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
		CharacterDto character = (CharacterDto) session.getAttribute("session_character");
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
		CharacterDto character = (CharacterDto) session.getAttribute("session_character");
		int character_id = character.getCharacter_id();
		// 음악방송출연 결과 유저 캐릭터에 저장
		characterService.music_actvity_save(character_id,health,fatigue,price);
		return "음악방송에 출연해서 인기도가 올랐습니다!(뿌듯)";
	}
	
	// 예능출연
	@PostMapping("/actSave/ent_actvity")
	@ResponseBody
	public String ent_actvity(int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("session_character");
		int character_id = character.getCharacter_id();
		// 예능출연 결과 유저 캐릭터에 저장
		characterService.ent_actvity(character_id,health,fatigue,price);
		return "예능에 출연해서 인기도가 올랐습니다!(뿌듯)";
	}
	
	// 콘서트
	@PostMapping("/actSave/con_actvity")
	@ResponseBody
	public String con_actvity(int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("session_character");
		int character_id = character.getCharacter_id();
		// 콘서트개최 결과 유저 캐릭터에 저장
		characterService.con_actvity(character_id,health,fatigue,price);
		return "콘서트를 개최해서 인기도가 올랐습니다!(뿌듯)";
	}
	
	// 팬사인회
	@PostMapping("/actSave/sign_actvity")
	@ResponseBody
	public String sign_actvity(int health, int fatigue, int price) {
		CharacterDto character = (CharacterDto) session.getAttribute("session_character");
		int character_id = character.getCharacter_id();
		// 팬사인회 결과 유저 캐릭터에 저장
		characterService.sign_actvity(character_id,health,fatigue,price);
		return "팬사인회를 잘 마치고 인기도가 올랐습니다!(뿌듯)";
	}








}
