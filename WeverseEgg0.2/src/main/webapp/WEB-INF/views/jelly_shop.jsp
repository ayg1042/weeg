<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/jelly_shop.css">
  <title>Jelly Shop</title>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const header = document.querySelector(".jelly_header");
      const headerTrigger = header.offsetTop; // 스크롤 위치에 따른 동작을 설정할 원래 위치 저장

      window.addEventListener("scroll", function () {
        if (window.scrollY > headerTrigger) {
            if (!header.classList.contains("sticky")) {
                header.classList.add("sticky");
            }
        } else {
            if (header.classList.contains("sticky")) {
                header.classList.remove("sticky");
            }
        }
      });

      // Toggle hidden_info on image click
      const toggleButton = document.getElementById("toggle-info");
      const hiddenInfo = document.querySelector(".hidden_info");

      toggleButton.addEventListener("click", function () {
        // 숨겨져 있으면 보여주고, 보여져 있으면 숨김
        if (hiddenInfo.style.display === "none" || hiddenInfo.style.display === "") {
          hiddenInfo.style.display = "block";
        } else {
          hiddenInfo.style.display = "none";
        }
      });
    });
    
  </script>
</head>
<body>
  <div id="jelly_container">
    <div class="jelly_side">
      <div class="jelly_side_top">
        <h1 class="jelly_logo"><img src="../images/jellyshop/jellyshop_logo.png" alt=""></h1>
        <c:choose>
    		<c:when test="${not empty sessionScope.session_id}">
	        <div class="my_jelly">
	          <strong>
	            <img src="../images/main/jelly_icon.png" alt="">
	            My Jelly
	          </strong>
	          <p class="jelly_total">${jelly}</p>
	        </div>
	        <div class="jelly_count">
	          <ul>
	            <li>충전젤리<strong>${jelly}</strong></li>
	            <li>충전한도<strong><fmt:formatNumber value ="${1500-jelly}"  pattern="#,###"/></strong><em>최대 1,500</em></li>
	          </ul>
	        </div>
	      	</c:when>
   		  	<c:otherwise>
   		 	<div class="my_jelly">
	          <strong>
	            <img src="../images/main/jelly_icon.png" alt="">
	            My Jelly
	          </strong>
	          <p class="jelly_total">0</p>
	        </div>
	        <div class="jelly_count">
	          <ul>
	            <li>충전젤리<strong>0</strong></li>
	            <li>충전한도<strong><fmt:formatNumber value ="1500"  pattern="#,###"/></strong><em>최대 1,500</em></li>
	          </ul>
	        </div>
   		  </c:otherwise>
		</c:choose>
      </div>
      <div class="jelly_side_footer">
        <a href="/"><img src="../images/jellyshop/jellyshop_side_footer.png" alt=""></a>
      </div>
    </div>
    <div class="jelly_content">
      <header class="jelly_header">
        <div class="header_myinfo">
          <span>한국어 - KO | KRW</span>
          <img src="../images/jellyshop/jellyshop_d.png" alt="">
          <div class="myinfoo">
		  <c:choose>
		    <c:when test="${not empty sessionScope.session_id}">
	            <strong>${sessionScope.session_id.getNickname()}</strong>
	            <img id="toggle-info" src="../images/jellyshop/jellyshop_d.png" alt="">
	            <div class="hidden_info">
	              <strong>${sessionScope.session_id.getNickname()}</strong>
	              <span>${sessionScope.session_id.getEmail()}</span>
	              <button onclick="location.href='/login/logout'">로그아웃</button>
	            </div>
    		</c:when>
    		<c:otherwise>
	    		<strong>로그인하세요.</strong>
		            <img id="toggle-info" src="../images/jellyshop/jellyshop_d.png" alt="">
		            <div class="hidden_info">
		              <button onclick="location.href='/login/login'">로그인</button>
		            </div>
    		</c:otherwise>
    	   </c:choose>
          
          </div>
        </div>
        <nav class="jelly_nav">
          <div>소개</div>
          <div class="black">일반 충전</div>
          <div>자동 충전</div>
          <div>조회</div>
          <div>FAQ</div>
        </nav>
      </header>
      <div class="jelly_contentt">
        <h2 class="jelly_title">일반 충전</h2>
        <ul>
          <li>
            <a href="javascript:void(0)" class="jelly_sale" data-jelly="4" data-price="1200">
              <img src="../images/jellyshop/jelly4.png" alt="">
            </a>
          </li>
          <li>
            <a href="javascript:void(0)" class="jelly_sale" data-jelly="8" data-price="2400">
              <img src="../images/jellyshop/jelly8.png" alt="">
            </a>
          </li>
          <li>
           <a href="javascript:void(0)" class="jelly_sale" data-jelly="21" data-price="6000">
              <img src="../images/jellyshop/jelly20.png" alt="">
            </a>
          </li>
          <li>
            <a href="javascript:void(0)" class="jelly_sale" data-jelly="43" data-price="12000">
              <img src="../images/jellyshop/jelly40.png" alt="">
            </a>
          </li>
          <li>
            <a href="javascript:void(0)" class="jelly_sale" data-jelly="65" data-price="18000">
              <img src="../images/jellyshop/jelly60.png" alt="">
            </a>
          </li>
          <li>
            <a href="javascript:void(0)" class="jelly_sale" data-jelly="87" data-price="24000">
              <img src="../images/jellyshop/jelly80.png" alt="">
            </a>
          </li>
          <li>
            <a href="javascript:void(0)" class="jelly_sale" data-jelly="131" data-price="36000">
              <img src="../images/jellyshop/jelly120.png" alt="">
            </a>
          </li>
          <li>
            <a href="javascript:void(0)" class="jelly_sale" data-jelly="175" data-price="48000">
              <img src="../images/jellyshop/jelly160.png" alt="">
            </a>
          </li>
          <li>
            <a href="javascript:void(0)" class="jelly_sale" data-jelly="264" data-price="72000">
              <img src="../images/jellyshop/jelly240.png" alt="">
            </a>
          </li>
        </ul>
        <footer>
          <img src="../images/jellyshop/content_footer.png" alt="">
        </footer>
      </div>

    </div>
  </div>
  <script>
	      document.querySelectorAll(".jelly_sale").forEach(item => {
	          item.addEventListener("click", function(event) {
	
	              let jellyCount = this.getAttribute("data-jelly");
	              let price = this.getAttribute("data-price");
	              let url = `/jellyshop/buy?jellyCount=`+jellyCount+`&price=`+price;
	              
	              console.log(jellyCount)
	
	           // URL에 값이 정상적으로 들어가도록 encoding

	              // URL로 이동
	              location.href = url;
	          });
	      });
  </script>
  
</body>
</html>