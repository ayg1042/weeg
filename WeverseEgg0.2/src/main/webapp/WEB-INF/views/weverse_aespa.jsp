<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/weverse_aespa.css">
  <title>weverse - aespa</title>
</head>
<body>
  <%@ include file="header.jsp" %>

  <div class="aespa_nav">
    <img src="../images/aespa/aespa_nav.png" alt="">
  </div>
  
  <!-- 컨테이너 -->
  <div id="aespa_container">
    <div class="aespa_mention">
      <img src="../images/aespa/aespa_mention.png" alt="">
    </div>
    
    <div class="aespa_feed">
    
      <div class="aespa_write_feed">
        <img src="../images/aespa/aespa_write.png" alt="" id="writeFeedBtn">
        <div class="feedsort">최신순 <img src="../images/jellyshop/jellyshop_d.png"></div>
        <c:forEach items="${feed }" var="fdto">
        <div class="new_feed_area">
		      <div class="new_feed_info">
		      	<div class="new_feed_profileimg">
		      		<img src="../images/aespa/profileimg.png">
		      	</div>
		      	<div class="new_feed_profile">
		      		<strong>${fdto.member.nickname }</strong>
		      		<p><fmt:formatDate value="${fdto.bdate }" pattern="MM. dd. HH:mm" /></p>
		      	</div>
		      </div>
		      <div class="new_feed_content">
		      ${fdto.bcontent}
		      </div>
<!-- 	      <div id="new_feed_area"> -->
<!-- 		      <div class="new_feed_info"> -->
<!-- 		      	<div class="new_feed_profileimg"> -->
<!-- 		      		<img src="../images/aespa/profileimg.png"> -->
<!-- 		      	</div> -->
<!-- 		      	<div class="new_feed_profile"> -->
<!-- 		      		<strong>길동스</strong> -->
<!-- 		      		<p>시간</p> -->
<!-- 		      	</div> -->
<!-- 		      </div> -->
<!-- 		      <div class="new_feed_content"> -->
<!-- 		      내가 쓴 글 -->
<!-- 		      </div> -->
<!-- 	      </div> -->
	      <div class="new_feedbtn">
	      	<button type="button" class="feedEmotionBtn1" aria-pressed="false">
	      		<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
	      		<g clip-path="url(#clip0_7_57)">
	      		<path d="M24.4473 18.9094L22.5435 15.5931C23.2313 14.328 23.6244 12.891 23.6244 11.3557C23.6244 11.0486 23.6121 10.7538 23.5752 10.4468C23.5138 9.85721 23.391 9.26766 23.219 8.71494C22.9611 7.87973 22.5803 7.10594 22.1013 6.39355C21.9417 6.16018 21.7697 5.92682 21.5977 5.71801C21.2416 5.27584 20.8362 4.8828 20.3941 4.51433C18.8587 3.24923 16.9058 2.48772 14.7564 2.48772C12.607 2.48772 10.654 3.24923 9.11873 4.51433C8.67656 4.87052 8.28352 5.27584 7.91504 5.71801C7.7308 5.9391 7.55885 6.16018 7.41146 6.39355C7.35005 6.47953 7.3132 6.57779 7.26407 6.66377L6.47799 6.08649C6.14636 5.85312 5.79017 5.7303 5.40941 5.7303C4.93039 5.7303 4.45138 5.92682 4.11975 6.28301C3.78812 6.62692 3.60388 7.10594 3.61617 7.59724C3.61617 7.63408 3.61617 7.65865 3.61617 7.6955L3.86182 10.238L1.78608 11.5399C1.78608 11.5399 1.71238 11.589 1.67553 11.6136C1.12282 12.0189 0.864888 12.6945 0.987713 13.37C1.11054 14.0455 1.60184 14.586 2.26509 14.7702L4.79529 15.4089L5.45854 17.7549C5.45854 17.7549 5.47082 17.804 5.48311 17.8286C5.72876 18.5532 6.41658 19.0445 7.17809 19.0445C7.77993 19.0445 8.33265 18.7497 8.66427 18.2462L8.84851 17.9637C10.4084 19.3639 12.4718 20.2114 14.7318 20.2114C15.2845 20.2114 15.8127 20.1499 16.3408 20.064L18.9079 22.9749C19.8536 24.0189 20.8362 24.2277 21.4995 24.2277C22.2364 24.2277 22.9734 23.9698 23.5752 23.5031C24.2999 22.9381 24.5947 22.3608 24.7789 21.8818C25.1351 20.9483 25 19.8674 24.4227 18.9094H24.4473ZM9.45035 14.4877H9.43807C9.37666 14.4877 9.32753 14.5123 9.2784 14.5246C9.25383 14.5246 9.21699 14.5246 9.19242 14.5491C9.13101 14.586 9.0696 14.6474 9.02047 14.7211L8.66427 15.2861L7.75537 16.7477L7.37461 17.3618C7.37461 17.3618 7.27635 17.4478 7.21494 17.4478C7.21494 17.4478 7.21494 17.4478 7.20266 17.4478C7.20266 17.4478 7.19037 17.4478 7.17809 17.4478C7.11668 17.4355 7.05527 17.3987 7.0307 17.325L6.19549 14.3649C6.14636 14.1929 6.01125 14.0701 5.8393 14.021L2.73183 13.2349C2.65813 13.2103 2.609 13.1489 2.59672 13.0875C2.58444 13.0138 2.59672 12.9401 2.67042 12.891L5.26202 11.2697C5.47082 11.1469 5.56908 10.9504 5.54452 10.6924L5.23746 7.54811C5.23746 7.54811 5.26202 7.44985 5.28659 7.413C5.28659 7.413 5.29887 7.40072 5.31115 7.38843C5.348 7.36387 5.38485 7.35159 5.42169 7.3393H5.43398C5.43398 7.3393 5.50767 7.3393 5.54452 7.37615L8.28352 9.40276L8.45547 9.42733L11.4278 8.16223C11.4278 8.16223 11.477 8.16223 11.5015 8.16223C11.5015 8.16223 11.5015 8.16223 11.5138 8.16223C11.5629 8.16223 11.6121 8.1868 11.6489 8.22364C11.6489 8.22364 11.6489 8.23593 11.6612 8.24821C11.6858 8.29734 11.7103 8.34647 11.6858 8.40788L10.6418 11.4048C10.6049 11.5031 10.6049 11.589 10.6172 11.675C10.6295 11.761 10.6786 11.8224 10.7277 11.8838L12.7543 14.2421C12.8526 14.3649 12.7543 14.5491 12.607 14.5614L9.46264 14.5L9.45035 14.4877ZM14.7687 18.6269C12.8158 18.6269 11.0471 17.8531 9.74513 16.588L10.0522 16.0967L12.5701 16.1459C13.3071 16.1459 13.9212 15.7528 14.216 15.1264C14.5107 14.5123 14.437 13.7876 14.0072 13.2472C13.9949 13.2349 13.9826 13.2103 13.958 13.1981L12.349 11.3188L13.1842 8.92375C13.3685 8.33419 13.2702 7.73234 12.9386 7.27789C12.607 6.82344 12.0665 6.54094 11.5015 6.54094C11.2927 6.54094 11.0839 6.57779 10.8874 6.65148C10.8628 6.65148 10.8383 6.67605 10.8137 6.67605L8.59058 7.6218H8.5783C9.85568 5.50921 12.1525 4.08444 14.7932 4.08444C18.7973 4.08444 22.0522 7.3393 22.0522 11.3434C22.0522 15.3475 18.7973 18.6024 14.7932 18.6024L14.7687 18.6269ZM23.305 21.3291C23.1945 21.6361 23.0471 21.9186 22.6172 22.2503C22.261 22.5205 21.8434 22.631 21.524 22.631C21.4626 22.631 21.3889 22.6187 21.3275 22.6064C21.2784 22.6064 21.2293 22.6064 21.1801 22.5819C21.1064 22.5696 21.045 22.5328 20.9713 22.5082C20.9222 22.4836 20.8731 22.4836 20.8239 22.4591C20.738 22.4222 20.652 22.3608 20.5783 22.2994C20.5414 22.2748 20.5169 22.2625 20.48 22.238C20.3695 22.152 20.2467 22.0415 20.1361 21.9186L18.0727 19.5727C19.4237 19.0322 20.6151 18.1602 21.5486 17.0548L23.0839 19.7323C23.4156 20.2851 23.477 20.8746 23.3173 21.3168L23.305 21.3291Z" fill="#444444"></path></g>
	      		<defs><clipPath id="clip0_7_57"><rect width="24" height="21.7277" fill="white" transform="translate(1 2.5)"></rect></clipPath></defs>
	      		</svg>
	      	</button>
	      	<button type="button" class="feedEmotionBtn2">
	      	<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M22.7912 12.25C22.7912 6.98327 18.5168 2.7088 13.25 2.7088C7.98327 2.7088 3.7088 6.98327 3.7088 12.25C3.7088 16.2846 6.21678 19.7303 9.74976 21.1261C9.74976 21.1261 9.79338 21.1479 9.82609 21.1588C10.2295 21.3115 10.6439 21.4423 11.0692 21.5405C14.5258 22.4455 18.6258 22.2819 20.5995 21.9548C21.1338 21.8567 21.341 21.3878 21.0684 20.908C20.774 20.3846 20.3596 19.7522 20.2833 19.1851C20.0325 17.2769 22.7912 16.0229 22.7803 12.3591C22.7803 12.3264 22.7803 12.2936 22.7803 12.2609L22.7912 12.25Z" stroke="#444444" stroke-width="1.6" stroke-miterlimit="10"></path></svg>
	      	</button>
	      </div>
	    </div>
        </c:forEach>
        	
        <img src="../images/aespa/aespa_feed1.png" alt="">
        <img src="../images/aespa/aespa_feed2.png" alt="">
        <img src="../images/aespa/aespa_feed3.png" alt="">
        <img src="../images/aespa/aespa_feed4.png" alt="">
      </div>
      
      <!-- 모달창 구조 -->
		<div id="feed_modal" class="feed_modal">
		  <div class="feed-content">
		    <div class="feed close">&times;</div>
		    <div class="feed_content_top">
			    <strong>포스트 쓰기</strong>
			    <p>aepsa</p>
		    </div>
		    <form action="" method="post" name="feedFrm">
			    <div class="feed_write_area">
				    <textarea id="feed_write" name="feedWrite" placeholder="위버스에 남겨보세요.."></textarea>
			    </div>
			    <div class="feed_button_area">
				    <button type="button" class="feedBtn">등록</button>
			    </div>
		    </form>
		  </div>
		</div>
		
	<script>
	  const modal = document.getElementById("feed_modal");
	  const openBtn = document.getElementById("writeFeedBtn");
	  const closeBtn = document.querySelector(".close");
	  const feedBtn = document.querySelector(".feedBtn");
	  const textarea = document.getElementById("feed_write");
	
	  openBtn.onclick = function () {
	    modal.style.display = "block";
	  }
	
	  closeBtn.onclick = function () {
	    modal.style.display = "none";
	  }
	  
	  feedBtn.onclick = function () {
	    feedFrm.submit();
	  }
	  
	  // 입력 감지하는 버튼 (실시간)
	  textarea.addEventListener("input", () => {
	    const value = textarea.value.trim();

	    if (value.length > 0) {
	      feedBtn.style.background = "linear-gradient(135deg, #0ed5bc, #14e0a9)";
	      feedBtn.style.color = "white";
	      feedBtn.style.cursor = "pointer";
	    } else {
	      feedBtn.style.background = "#e4e4e4";
	      feedBtn.style.color = "#8e8e8e";
	      feedBtn.style.cursor = "default";
	    }
	  });

	  // placeholder 
	  textarea.addEventListener("focus", () => {
	    textarea.placeholder = "";
	  });

	  textarea.addEventListener("blur", () => {
	    // 아무것도 안 썼으면 다시 placeholder 복구
	    if (textarea.value === "") {
	      textarea.placeholder = "위버스에 남겨보세요..";
	    }
	  });
	</script>
      
      <div class="aespa_side">
        <div class="aespa_members">
          <img src="../images/aespa/aespa_side.png" alt="">
        </div>
        <div class="aespa_membership">
          <img src="../images/aespa/aespa_membership.png" alt="">
          <img src="../images/aespa/aespa_myprofile.png" alt="">
        </div>
        <div class="ranking">
          <div class="ranking_top">
            <img src="../images/aespa/rank/trophy.png" alt=""><span>팬 게임 랭킹 TOP 10</span>
            <a href="/aespa/rank"></a>
          </div>
          <table>
            <tbody>
              <tr onclick="rankerBtn()">
                <td class="rank"><img src="../images/aespa/rank/gold.png">1등</td>
                <td class="rank_nick"> 나만의나만의천사(윈터)</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr> 
              <tr>
                <td class="rank"><img src="../images/aespa/rank/silver.png">2등</td>
                <td class="rank_nick"> 나만의나만의여왕님(지젤)</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
              <tr>
                <td class="rank"><img src="../images/aespa/rank/bronze.png">3등</td>
                <td class="rank_nick"> 나만의나만의요정(카리나)</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
              <tr>
                <td class="Rank">4등</td>
                <td class="rank_nick"> 나만의나만의공주(닝닝)</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
              <tr>
                <td class="Rank">5등</td>
                <td class="rank_nick"> 배돈까</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
              <tr>
                <td class="Rank">6등</td>
                <td class="rank_nick"> 나만의나만의..</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
              <tr>
                <td class="Rank">7등</td>
                <td class="rank_nick"> 나만의나만의..</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
              <tr>
                <td class="Rank">8등</td>
                <td class="rank_nick"> 나만의나만의..</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
              <tr>
                <td class="Rank">9등</td>
                <td class="rank_nick"> 나만의나만의..</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
              <tr>
                <td class="Rank">10등</td>
                <td class="rank_nick"> 나만의나만의..</td>
                <td class="rank_score"><img src="../images/aespa/rank/rank_heart.png" alt="">999,999,999</td>
              </tr>
            </tbody>
          </table>
        </div>
        <script>
          function rankerBtn() {
            alert("버튼이 클릭되었습니다!");
          }
          document.addEventListener("DOMContentLoaded", function () {
              document.querySelectorAll(".rank_nick").forEach(nickElement => {
                  const text = nickElement.innerText.trim();
                  if (text.length >= 6) {
                      // 기존 텍스트 보관
                      const originalText = text + " &nbsp;&nbsp; " + text; // 무한 스크롤 효과용
  
                      // 애니메이션을 적용할 요소 생성
                      let wrapper = document.createElement("div");
                      wrapper.classList.add("scroll");
                      wrapper.innerHTML = originalText;
  
                      // 기존 내용을 덮어쓰기
                      nickElement.innerHTML = "";
                      nickElement.appendChild(wrapper);
                  }
              });
          });
        </script>
        <div>
          <img src="../images/aespa/aespa_notice.png" alt="">
        </div>
        <div class="aespa_footer">
          <img src="../images/aespa/aespa_footer.png" alt="">
        </div>
      </div>
    </div>
   </div>




  
</body>
</html>