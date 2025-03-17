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
  <link rel="stylesheet" type="text/css" href="css/weNoticeView.css" />
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
          <li><a href="/rank">나의랭킹</a></li>
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
    <img src="../images/weNotice/top_img3.png">
  </div>

  <div id="notice_container">
    <div class="notice_title">
      <div class="title_between" style="justify-content: space-between; display: flex;">
        <div class="title_txt">이벤트</div>
      </div>
    </div>

    <table>
      <tbody>
        <tr>
          <td class="td_title">
            <span class="info_title">${fdto.btitle }</span>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="info_date">
    	<p><fmt:formatDate value="${fdto.bdate}" pattern="yyyy-MM-dd HH:mm"/></p>
    </div>
    <div class="info_area">
    	<div id="notice_img"></div>
    	<p class="info_txt">
    		${fdto.bcontent }
    	</p>
    	<c:if test="${fdto.bfile != null }"><img src="../images/event/${fdto.bfile}"></c:if>
    <div class="btnArea">
    	<button onclick="listBtn()" >목록</button>
   	</div>
    </div> <!-- info_area -->
  </div> <!-- notice_container -->

  <script>
		//스크롤시 헤더 색상변경
	  window.addEventListener("scroll", function () {
		    let gnb = document.getElementById("main_top_gnb");
		    if (window.scrollY > 50) {  // 스크롤 50px 이상일 때 배경 변경
		        gnb.classList.add("scrolled");
		    } else {
		        gnb.classList.remove("scrolled");
		    }
		});
	  
	  function listBtn(){
		  location.href="/weEvent";
	  }
  </script>

</body>

</html>