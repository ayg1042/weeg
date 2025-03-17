<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/mainpage.css"/>
  <link rel="stylesheet" type="text/css" href="../css/header.css"/>
  <title>WEVERSEGG</title>
</head>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const boxes = document.querySelectorAll('.box1, .box2, .box3, .box4');
    const banners = document.querySelectorAll('#main_banner img');
    const mainBanner = document.querySelector('#main_banner img');
    const images = Array.from(banners);
    // 초기 상태 설정
    banners[0].classList.add('active');
    boxes.forEach((box, index) => {
      box.addEventListener('click', () => {
        // 모든 박스에서 fade-in 클래스 제거
        boxes.forEach(b => {
          b.querySelector('.event-title').classList.remove('fade-in');
          b.querySelector('.event-date').classList.remove('fade-in');
          if (b.classList.contains('box1')) {
            b.querySelector('.event-title').style.color = '#959595';
            b.querySelector('.event-date').style.color = '#959595';
          }
        });
        // 클릭된 박스에 fade-in 클래스 추가
        box.querySelector('.event-title').classList.add('fade-in');
        box.querySelector('.event-date').classList.add('fade-in');
        // 모든 배너 숨기기
        banners.forEach(banner => {
          banner.classList.remove('active');
        });
        // 클릭된 박스에 해당하는 배너 표시
        if (index < banners.length) {
          banners[index].classList.add('active');
        }
        // 박스 1 클릭 시 텍스트 색상 흰색으로 변경
        if (box.classList.contains('box1')) {
          box.querySelector('.event-title').style.color = '#FFFFFF';
          box.querySelector('.event-date').style.color = '#FFFFFF';
        }
      });
    });
  });
  function stBtn() {
    location.href = "/choiceCharacter";
  }
	
	// 배너이미지 3초마다 자동변경
  document.addEventListener("DOMContentLoaded", function () {
	    let images = document.querySelectorAll("#main_banner img");
	    let currentIndex = 0;
	    function showNextImage() {
	        images[currentIndex].classList.remove("active");
	        currentIndex = (currentIndex + 1) % images.length; // 다음 이미지로 변경
	        images[currentIndex].classList.add("active");
	    }
	    // 처음에 첫 번째 이미지를 활성화
	    images[currentIndex].classList.add("active");
	    // 3초마다 이미지 변경
	    setInterval(showNextImage, 3000);
	});
	
</script>
<body>
  <!-- 메인 -->
  <div id="egg_mainpage">
     <%@ include file="egg_gnb.jsp"%>
    <!-- 메인 이미지 화면 -->
    <div id="main_banner">
    <c:forEach items="${banners }" var="banner">
      <c:if test="${not empty banner.bfile_banner}">
      <img src="../images/event/${banner.bfile_banner}" alt="메인 배너 이미지">
    </c:if>
    </c:forEach>
    </div>
	<div class="egg_main_bottom">
	    <!-- 하단 이벤트 gnb -->
	    <div id="main_bottom_gnb">
	    <c:forEach items="${banners }" var="banner" varStatus="vs">
	     <c:if test="${vs.index < 4}">
	      <div class="box${vs.index +1 }">
	        <div class="event-title">${banner.btitle}</div>
	        <div class="event-date">~2025.03.26</div>
	      </div>
	     </c:if>
	    </c:forEach>
		</div>
	
	    <!-- 게임 스타트 버튼 -->
	    <div id="game_start_btn">
	      <button type="button" onclick="stBtn()" class="game_start">
	        <img src="images/mainpage/start1.png" alt="게임 시작 버튼 호버 전" class="default">
	        <img src="images/mainpage/start2.png" alt="게임 시작 버튼 호버 후" class="hover">
	      </button>
	    </div>
  </div>
  <!-- 메인 끝 -->
</body>
</html>