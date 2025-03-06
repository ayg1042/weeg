<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/mainpage.css" />
  <link rel="stylesheet" type="text/css" href="css/header.css" />
  <link rel="stylesheet" type="text/css" href="css/weNotice.css" />
  <title>WEVERSEGG_NOTICE</title>
</head>

<body>
  <!-- 메인 -->
  <div id="egg_mainpage">

    <!-- 탑 gnb -->
    <div class="hover_blocker1"></div> <!-- 투명한 네모 박스 (호버방지용)-->
    <div class="hover_blocker2"></div> <!-- 투명한 네모 박스 (호버방지용)-->
    <div id="main_top_gnb">
      <a href="/eggmain" class="logo-link"><img src="../images/mainpage/main_egg.png" alt="에그로고"></a>
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
          <li><a href="/weverserank">전체랭킹</a></li>
          <li><a href="/weverserank">그룹랭킹 </a></li>
        </ul>
        <ul>
          <li id="option_title">고객지원</li>
          <li><a href="#">도움말/1:1문의</a></li>
          <li><a href="#">버그악용/신고</a></li>
        </ul>
      </nav>

    </div>
  </div>

  <!-- 공지사항 -->
  <div id="notice_banner">
    <img src="../images/weNotice/noticeBanner.jpg">
  </div>

  <div id="notice_container">
    <div class="notice_title">
      <div class="title_between" style="justify-content: space-between; display: flex;">
        <div class="title_txt">공지사항</div>
        <form action="">
          <div class="search_inputBox">
            <input type="text" name="text" class="searchN" placeholder="검색어를 입력하세요.">
            <img src="../images/weNotice/ico-search.svg" class="search_icon" alt="검색아이콘">
          </div>
        </form>
      </div>
    </div>

    <table>
      <colgroup>
        <col class="w-[1056px]">
        <col class="w-[160px]">
      </colgroup>
      <tbody>
        <c:forEach items="${list}" var="qdto">
	        <tr>
	          <td>
	            <span class="info_title">${qdto.coin }</span>
	          </td>
	          <td class="info_date">${qdto.content }</td>
	          <td>코인 ${qdto.coin}</td>
	          <td>0/10</td>
	          <td><button class="questProgressButton" data-quest-id="${qdto.questId}">클릭</button></td>
	        </tr>
        </c:forEach>
      </tbody>
    </table>


	<script>
	    $(document).ready(function() {
	        // 버튼 클릭 시 퀘스트 진행 상태 업데이트
	        $(".questProgressButton").click(function() {
	            var questId = $(this).data("quest-id");
	
	            $.ajax({
	                url: "/quest/test/progress",
	                type: "POST",
	                data: {
	                    questId: questId,
	                    action: "click"
	                },
	                success: function(response) {
	                    // 서버에서 돌아온 결과로 진행률 업데이트
	                    if(response.progress) {
	                        var progressText = response.progress + "%";
	                        $('#progress-' + questId).text(progressText);
	                    }
	
	                    if(response.isCompleted) {
	                        alert("퀘스트 완료! 보상: " + response.rewardCoin + "코인");
	                    }
	                },
	                error: function(xhr, status, error) {
	                    alert("퀘스트 진행 중 오류가 발생했습니다.");
	                }
	            });
	        });
	    });
	</script>

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

  <script>
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

</body>

</html>