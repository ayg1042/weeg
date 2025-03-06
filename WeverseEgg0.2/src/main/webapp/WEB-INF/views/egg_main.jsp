<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    const images = [
      'images/main_banner1.png',
      'images/main_banner2.png',
      'images/main_banner3.png',
      'images/main_banner4.png'
    ];

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
</script>

<body>
  <!-- 메인 -->
  <div id="egg_mainpage"> 

    <!-- 탑 gnb -->
    <div class="hover_blocker1"></div> <!-- 투명한 네모 박스 (호버방지용)-->
    <div class="hover_blocker2"></div> <!-- 투명한 네모 박스 (호버방지용)-->
    <div id="main_top_gnb">
      <a href="/eggmain" class="logo-link"><img src="images/mainpage/main_egg.png" alt="에그로고"></a>
      <nav>
        <ul>
          <li id="option_title">뉴스</li>
          <li><a href="/wenotice">공지사항</a></li>
          <li><a href="#">업데이트</a></li>
          <li><a href="#">이벤트</a></li>
          <li><a href="#">업데이트</a></li>
        </ul>
        <ul>
          <li id="option_title">가이드</li>
          <li><a href="#">게임정보</a></li>
          <li><a href="#">직업소개</a></li>
          <li><a href="#">확률형아이템</a></li>
        </ul>
        <ul>
          <li id="option_title">커뮤니티</li>
          <li><a href="#">자유게시판</a></li>
          <li><a href="#">EGG 코디</a></li>
        </ul>
        <ul>
          <li id="option_title">랭킹</li>
          <li><a href="#">전체랭킹</a></li>
          <li><a href="#">그룹랭킹 </a></li>
        </ul>
        <ul>
          <li id="option_title">고객지원</li>
          <li><a href="#">도움말/1:1문의</a></li>
          <li><a href="#">버그악용/신고</a></li>
        </ul>
      </nav>

    </div>

    <!-- 메인 이미지 화면 -->
    <div id="main_banner">
      <img src="images/mainpage/main_banner1.png" alt="메인 배너1">
      <img src="images/mainpage/main_banner2.png" alt="메인 배너2">
      <img src="images/mainpage/main_banner3.png" alt="메인 배너3">
      <img src="images/mainpage/main_banner4.png" alt="메인 배너4">
    </div>

    <!-- 하단 이벤트 gnb -->
    <div id="main_bottom_gnb">
      <div class="box1">
        <div class="event-title">아이템 버닝 이벤트</div>
        <div class="event-date">~2025.03.26</div>
      </div>
      <div class="box2">
        <div class="event-title">도전 출석왕</div>
        <div class="event-date">~2025.03.23</div>
      </div>
      <div class="box3">
        <div class="event-title">2025 패션왕 </div>
        <div class="event-date">~2025.03.20</div>
      </div>
      <div class="box4">
        <div class="event-title">주말 3배 이벤트</div>
        <div class="event-date">~2025.03.18</div>
      </div>
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