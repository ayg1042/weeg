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

		<%@ include file="egg_gnb.jsp"%>

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