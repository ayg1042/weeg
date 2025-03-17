<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/mainpage.css" />
  <link rel="stylesheet" type="text/css" href="css/header.css" />
  <link rel="stylesheet" type="text/css" href="css/weBoardView.css" />
  <title>WEVERSEGG_NOTICE</title>
</head>

<body>
  <!-- 메인 -->
  <div id="egg_writepage">
     <%@ include file="egg_gnb.jsp"%>
  </div>

  <!-- 공지사항 -->
  <div id="notice_banner">
    <img src="../images/weNotice/top_img2.png">
  </div>

  <div id="notice_container">
    <div class="notice_title">
      <div class="title_between" style="justify-content: space-between; display: flex;">
        <div class="title_txt">자유게시판</div>
      </div>
    </div>

    <table>
      <tbody>
        <tr>
          <td class="td_title">
            <span class="info_title">${fdto.btitle}</span>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="info_date">
    	<p><fmt:formatDate value="${fdto.bdate }" pattern="yyyy-MM-dd"/></p>
    </div>
    <div class="info_area">
    	<div id="notice_img"></div>
    	<div id="board_img">
    		<c:if test="${fdto.bfile != null}">
        	<img src="/images/boardImg/${fdto.bfile }"/>
        </c:if>
    	</div>
    	<p class="info_txt">
    		${fdto.bcontent }
    	</p>
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
		  location.href="/weBoard";
	  }
  </script>

</body>

</html>