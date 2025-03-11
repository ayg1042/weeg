<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		    <div class="feed_write_area">
			    <textarea placeholder="위버스에 남겨보세요.."></textarea>
		    </div>
		    <button>등록</button>
		  </div>
		</div>
		
	<script>
	  const modal = document.getElementById("feed_modal");
	  const openBtn = document.getElementById("writeFeedBtn");
	  const closeBtn = document.querySelector(".close");
	
	  openBtn.onclick = function () {
	    modal.style.display = "block";
	  }
	
	  closeBtn.onclick = function () {
	    modal.style.display = "none";
	  }
	
	  // 배경 클릭 시 모달 닫기
	  window.onclick = function (event) {
	    if (event.target == modal) {
	      modal.style.display = "none";
	    }
	  }
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