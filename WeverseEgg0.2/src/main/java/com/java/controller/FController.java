package com.java.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.character.ArtistDto;
import com.java.dto.character.CharacterDto;
import com.java.dto.character.InvenDto;
import com.java.dto.character.SaveStyleDto;
import com.java.dto.character.StyleDto;
import com.java.dto.group.ArtistNameDto;
import com.java.dto.group.GroupDto;
import com.java.dto.item.ItemDto;
import com.java.dto.item.ItemInfoDto;
import com.java.dto.item.ItemTypeDto;
import com.java.entity.character.StyleEntity;
import com.java.service.ModalService;

import jakarta.servlet.http.HttpSession;


@Controller
public class FController {
	
	@Autowired ModalService modalServiceImpl;
	@Autowired HttpSession session;
	
	@GetMapping("/index") //어드민
	public String index(Model model) {
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
		if(!file.isEmpty()) {
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
	public String addArtist(
			@RequestParam(value = "groupId") int groupId,
			@RequestParam(value = "artistName") String artistName
			) {
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
	
	@GetMapping("/rank") // 랭킹 페이지
	public String rank() {
		return "rank";
	}
	

	
	
}
