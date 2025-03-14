package com.java.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.feed.FeedDto;
import com.java.dto.member.MemberDto;
import com.java.entity.member.MemberEntity;
import com.java.repository.AespaRepository;
import com.java.repository.MemberRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AespaRepository aespaRepository;
	@Autowired MemberRepository memberRepository;

	@Override
	public List<FeedDto> notilist(String category) {
		 List<FeedDto> list = aespaRepository.findByCategory(category);
		return list;
	}

	@Override // 게시중 게시안함
	public void updateStatus(int bno, String status) {
		FeedDto feed = aespaRepository.findById(bno)
				.orElse(null);
		feed.setStatus(status);
		aespaRepository.save(feed);
	}

	@Override
	public FeedDto notiview(int bno) {
		FeedDto feed = aespaRepository.findById(bno)
				.orElse(null);
		return feed;
	}

	@Override // 삭제
	public void delFeed(int bno) {
		aespaRepository.deleteById(bno);
	}

	@Override // 공지작성
	public void notiWrite(String title, String content, MultipartFile file, String category, MemberDto member) {
		int id = member.getUser_id();
		MemberEntity memberEntity = memberRepository.findById(id)
				.orElseThrow();
		FeedDto dto = new FeedDto();
	    dto.setBtitle(title);
	    dto.setBcontent(content);
	    dto.setCategory(category);
	    dto.setMember(memberEntity);

	    if (file != null && !file.isEmpty()) {
	        // 파일 업로드 처리
	        String filename = file.getOriginalFilename();
	        
	        // 파일을 특정 경로에 저장
	        String uploadDir = "C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/"+category+"/";
	        File destFile = new File(uploadDir + filename);
	        try {
	            // 실제로 파일을 지정된 경로에 저장
	            file.transferTo(destFile);
	            dto.setBfile(filename);  // 파일명을 FeedDto에 설정
	            System.out.println("사진저장 서비스");
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 파일 저장 실패 시, 예외 처리 (예: null값을 저장하거나 로그 기록)
	            dto.setBfile(null);  // 파일 업로드 실패시 null 처리
	        }
	    } else {
	        dto.setBfile(null); // 파일이 없는 경우, 기본값 처리
	    }

	    aespaRepository.save(dto);
		
	}

	@Override
	public void notiModi(String title, String content, MultipartFile file, int bno) {
		FeedDto dto = aespaRepository.findById(bno)
				.orElse(null);
	    dto.setBtitle(title);
	    dto.setBcontent(content);

	    if (file != null && !file.isEmpty()) {
	        // 파일 업로드 처리
	        String filename = file.getOriginalFilename();
	        
	        // 파일을 특정 경로에 저장
	        String uploadDir = "C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/"+dto.getCategory()+"/";
	        File destFile = new File(uploadDir + filename);
	        try {
	            // 실제로 파일을 지정된 경로에 저장
	            file.transferTo(destFile);
	            dto.setBfile(filename);  // 파일명을 FeedDto에 설정
	            System.out.println("사진저장 서비스");
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 파일 저장 실패 시, 예외 처리 (예: null값을 저장하거나 로그 기록)
	            dto.setBfile(null);  // 파일 업로드 실패시 null 처리
	        }
	    } else {
	        dto.setBfile(null); // 파일이 없는 경우, 기본값 처리
	    }

	    aespaRepository.save(dto);
		
	}

	@Override // 이벤트 글 작성
	public void eventWrite(String title, String content, MultipartFile file, MultipartFile fileb, MultipartFile filem,
			String category, MemberDto member) {
		int id = member.getUser_id();
		MemberEntity memberEntity = memberRepository.findById(id)
				.orElseThrow();
		FeedDto dto = new FeedDto();
	    dto.setBtitle(title);
	    dto.setBcontent(content);
	    dto.setCategory(category);
	    dto.setMember(memberEntity);

	    String uploadDir = "C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/"+category+"/";
	    // 공지 사항 이미지 처리
	    if (file != null && !file.isEmpty()) {
	        String filename = file.getOriginalFilename();
	        // 파일을 특정 경로에 저장
	        saveFile(uploadDir, filename, file);
	        dto.setBfile(filename);
	    } else {
	        dto.setBfile(null); // 파일이 없는 경우, 기본값 처리
	    }
	    
	    // 배너이미지 처리
	    if (fileb != null && !fileb.isEmpty()) {
	    	String filename = fileb.getOriginalFilename();
	    	saveFile(uploadDir, filename, fileb);
	    	dto.setBfile_banner(filename);
	    } else {
	    	dto.setBfile_banner(null); 
	    }
	    
	    // 모달 이미지 처리
	    if (filem != null && !filem.isEmpty()) {
	    	String filename = filem.getOriginalFilename();
	    	saveFile(uploadDir, filename, filem);
	    	dto.setBfile_modal(filename);
	    } else {
	    	dto.setBfile_modal(null); 
	    }

	    aespaRepository.save(dto);
		
	}

	@Override // 이벤트 글 수정
	public void eventModi(String title, String content, MultipartFile file, MultipartFile fileb, MultipartFile filem,
			int bno, boolean delfile, boolean delfileb, boolean delfilem) {
		String uploadDir = "C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/event/";
		FeedDto dto = aespaRepository.findById(bno)
				.orElse(null);
	    dto.setBtitle(title);
	    dto.setBcontent(content);
	    
	    // ===== notice 파일 처리 =====
	    if (delfile) {
	        dto.setBfile(null);
	    } else if (file != null && !file.isEmpty()) {
	        String filename = file.getOriginalFilename();
	        saveFile(uploadDir, filename, file);
	        dto.setBfile(filename);
	    }
	    
	    // ===== banner 파일 처리 =====
	    if (delfileb) {
	        dto.setBfile_banner(null);
	    } else if (fileb != null && !fileb.isEmpty()) {
	        String filename = fileb.getOriginalFilename();
	        saveFile(uploadDir, filename, fileb);
	        dto.setBfile_banner(filename);
	    }

	    // ===== modal 파일 처리 =====
	    if (delfilem) {
	        dto.setBfile_modal(null);
	    } else if (filem != null && !filem.isEmpty()) {
	        String filename = filem.getOriginalFilename();
	        saveFile(uploadDir, filename, filem);
	        dto.setBfile_modal(filename);
	    }
	    aespaRepository.save(dto);
	}
	
	// 사진 저장 메소드
	private void saveFile(String dir, String filename, MultipartFile file) {
	    try {
	        File dest = new File(dir + filename);
	        file.transferTo(dest);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}

}
