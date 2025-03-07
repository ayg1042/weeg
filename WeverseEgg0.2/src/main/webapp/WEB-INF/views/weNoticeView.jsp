<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  </div>

  <!-- 공지사항 -->
  <div id="notice_banner">
    <img src="../images/weNotice/noticeBanner.jpg">
  </div>

  <div id="notice_container">
    <div class="notice_title">
      <div class="title_between" style="justify-content: space-between; display: flex;">
        <div class="title_txt">공지사항</div>
      </div>
    </div>

    <table>
      <tbody>
        <tr>
          <td class="td_title">
            <span class="info_title">[안내] 개인정보처리방침 변경 안내</span>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="info_date">
    	<p>2025-01-01 15:00</p>
    </div>
    <div class="info_area">
    	<div id="notice_img"></div>
    	<p class="info_txt">
    		안녕하세요. 위버스EGG입니다.<br/><br/>
				위버스EGG 서비스를 이용해 주시는 고객 여러분께 진심으로 감사드리며,<br/>
				'개인정보처리방침'에 일부 수정 내용이 있어 2025년 01월 01일자로 변경됩니다.<br/><br/>
				새롭게 바뀌는 주요 개정사항을 확인하시고, 서비스 이용에 참고 부탁드리겠습니다.<br/><br/>
				▣ 개정 사유 및 내용<br/>
				- 일부 개인정보 수탁 업체 삭제 및 위탁업무 내용 변경<br/><br/>
				▣ 적용 일시: 2025년 01월 01일<br/><br/>
				▣ 이의제기 및 문의<br/>
				변경된 ‘개인정보 처리방침’의 내용에 동의하지 않으시는 경우,<br/>
				위버스EGG 서비스의 원활한 제공에 제약이 발생할 수 있습니다.<br/><br/>
				개인정보처리방침 변경에 대한 이의제기 및 문의는<br/>
				고객센터로 접수해 주시면 신속하고 친절하게 안내해드리겠습니다.<br/><br/>
				앞으로도 고객 여러분의 개인정보를 보다 안전하게 보호할 것을 약속드리며,<br/> 
				신뢰받는 서비스로 보답하겠습니다.<br/><br/>
				감사합니다.
    	</p>
    <div class="btnArea">
    	<button onclick="listBtn()" id="listBtn">목록</button>
   	</div>
    </div> <!-- info_area -->
  </div> <!-- notice_container -->

  <script>
	  window.addEventListener("scroll", function () {
		    let gnb = document.getElementById("main_top_gnb");
		    if (window.scrollY > 50) {  // 스크롤 50px 이상일 때 배경 변경
		        gnb.classList.add("scrolled");
		    } else {
		        gnb.classList.remove("scrolled");
		    }
		});
	  
	  function listBtn(){
		  location.href="/wenotice";
	  }
  </script>

</body>

</html>