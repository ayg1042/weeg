<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/mainpage.css" />
<link rel="stylesheet" type="text/css" href="../css/header.css" />
<link rel="stylesheet" type="text/css" href="../css/rank.css" />
<title>랭킹</title>
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

// 스크롤시 헤더 색상변경
window.addEventListener("scroll", function () {
    let gnb = document.getElementById("main_top_gnb");
    if (window.scrollY > 50) {  // 스크롤 50px 이상일 때 배경 변경
        gnb.classList.add("scrolled");
    } else {
        gnb.classList.remove("scrolled");
    }
});

// 페이지 넘버링
document.addEventListener("DOMContentLoaded", function () {
   const paginationLinks = document.querySelectorAll(".pagination a");

   paginationLinks.forEach(link => {
     link.addEventListener("click", function (event) {
       event.preventDefault(); // 페이지 이동 막기

       // 좌우 화살표(«, ») 버튼이면 active 클래스 변경하지 않음
       if (this.innerHTML === "«" || this.innerHTML === "»") {
         return;
       }

       // 기존 active 클래스 제거
       paginationLinks.forEach(link => link.classList.remove("active"));

       // 클릭한 버튼에 active 클래스 추가
       this.classList.add("active");
     });
   });
 });
</script>

<body>
	<%@ include file="header.jsp"%>

	<!-- 메인 -->
	<div id="egg_rankpage">

		<!-- 탑 gnb -->
		<div class="hover_blocker1"></div>
		<!-- 투명한 네모 박스 (호버방지용)-->
		<div class="hover_blocker2"></div>
		<!-- 투명한 네모 박스 (호버방지용)-->
		<div id="main_top_gnb">
			<a href="/" class="logo-link"><img
				src="/images/rank/main_egg.png" alt="에그로고"></a>
			<nav>
				<ul>
					<li id="option_title">뉴스</li>
					<li><a href="/wenotice">공지사항</a></li>
					<li><a href="/weEvent">이벤트</a></li>
				</ul>
				<ul>
					<li id="option_title">가이드</li>
					<li><a href="#">게임정보</a></li>
					<li><a href="#">직업소개</a></li>
					<li><a href="#">확률형아이템</a></li>
				</ul>
				<ul>
					<li id="option_title">커뮤니티</li>
					<li><a href="/weBoard">자유게시판</a></li>
					<li><a href="#">EGG 코디</a></li>
				</ul>
				<ul>
					<li id="option_title">랭킹</li>
					<li><a href="#">나의랭킹</a></li>
				</ul>
				<ul>
					<li id="option_title">고객지원</li>
					<li><a href="#">도움말/1:1문의</a></li>
					<li><a href="#">버그악용/신고</a></li>
				</ul>
			</nav>

		</div>


		<!-- 랭킹 메인 -->
		<div id="topArea"></div>
		<div class="rankArea">
			<h2 id="teamName">에스파</h2>
			<div id="idolArea">
				<div class="real_idol">
					<img src="/images/rank/exWinter.png">
				</div>
				<div class="real_idol">
					<img src="/images/rank/exGiselle.png">
				</div>
				<div class="real_idol"></div>
				<div class="real_idol"></div>
			</div>
			<h2 id="rankText">랭킹</h2>
			<div id="userRank">
				<table class="rank_table">
					<colgroup>
						<col width="170px">
						<col width="352px">
						<col width="231px">
						<col width="231px">
						<col width="231px">
					</colgroup>
					<thead>
						<tr>
							<th>순위</th>
							<th>캐릭터 정보</th>
							<th>레벨</th>
							<th>매력도</th>
							<th>인기도</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ranklist }" var="chardto">
							<tr class="cha_info">
								<td>
									<p class="ranking_num">${chardto.rank }</p>
									<div class="like">
										<div class="like_area">
											<img id="heart" alt="하트" src="/images/rank/RedHeart.png">
											<p class="like_num">999</p>
										</div>
									</div>
								</td>
								<td class="rankUser">
									<div class="char_img">
										<img id="charImg" alt="랭킹유저"
											src="/images/rank/exCharacter.png">
									</div>
									<div class="nickName">
										<p>${chardto.nickName }</p>
										<p id="groupName">${chardto.artist.artistName.artistName }
											/ ${chardto.artist.artistName.group.groupName}</p>
									</div>
								</td>
								<td>
									<p class="level">LV. ${chardto.artist.level }</p>
								</td>
								<td>
									<p class="attract">${ chardto.charm}</p>
								</td>
								<td>
									<p class="popularity">${ chardto.popularity}</p>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- rankArea -->
		
		<!-- 페이지 넘버링 -->
    <div class="pagination">
      <a href="#">&laquo;</a>
      <a href="#" class="active">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">&raquo;</a>
    </div>

	</div>
	<!-- 메인 끝 -->

</body>
</html>