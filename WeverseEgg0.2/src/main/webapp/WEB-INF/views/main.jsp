<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/main.css">
  <title>weverse</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.session_id}">
        <!-- 로그인 상태 -->
        <!-- 헤더 -->
		  <header>
		      <div id="header_wrap">
		        <div class="main_logo">
		          <a href="/"> <!-- 로그인 안된 페이지로 이동 (임시) -->
		            <img src="../images/main/weverse_logo.png" alt="">
		          </a>
		        </div>
		        <div class="header_action">
		          <button type="button" class="header_search">
		            <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
		              <circle cx="17" cy="18" r="9.9" stroke="currentColor" stroke-width="2.2"></circle>
		              <rect x="22.5701" y="25.787" width="2.5" height="10.8772" rx="1.25" transform="rotate(-45 22.5701 25.787)" fill="currentColor"></rect>
		            </svg>
		          </button>
		          <button type="button" class="header_alram">
		            <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
		              <path d="M14.752 27.6113C14.752 28.9004 15.2232 30.1341 16.0688 31.0351C16.9144 31.9361 18.0649 32.4629 19.257 32.4629C20.4491 32.4629 21.5996 31.95 22.4452 31.0351C23.2907 30.1203 23.762 28.8866 23.762 27.6113" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
		              <path d="M29.3898 27.2924C30.1522 27.2924 30.6789 26.5578 30.4433 25.837C29.8749 24.132 29.3066 22.025 29.3066 20.8745V17.4784C29.3066 10.3535 25.1204 6.51386 19.2569 6.5H19.2431C13.3935 6.5 9.1934 10.3535 9.1934 17.4784V20.8745C9.1934 22.025 8.62507 24.132 8.05675 25.837C7.8211 26.5578 8.34784 27.2924 9.11023 27.2924H29.3898V27.2924Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
		            </svg>
		          </button>
		          <button type="button" class="header_mypage">
		          <a href="/wemypage">
		            <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
		              <path d="M19.0176 18.5246C22.2001 18.5246 24.78 15.9447 24.78 12.7623C24.78 9.57987 22.2001 7 19.0176 7C15.8352 7 13.2553 9.57987 13.2553 12.7623C13.2553 15.9447 15.8352 18.5246 19.0176 18.5246Z" stroke="currentColor" stroke-width="2" stroke-miterlimit="10"></path>
		              <path d="M19.0175 31.8641C22.104 31.8641 24.9255 31.6919 27.0715 31.0958C28.2637 30.7646 29.4691 30.248 30.1182 29.2545C30.6481 28.4332 30.6349 27.2675 30.0255 26.2343C28.6214 23.8234 24.3559 21.6509 19.0837 21.6509H18.9115C13.6394 21.6509 9.37393 23.8234 7.96978 26.2343C7.37368 27.2675 7.34719 28.4332 7.87706 29.2545C8.52615 30.248 9.73159 30.7779 10.9238 31.0958C13.083 31.6786 15.8913 31.8641 18.9778 31.8641H19.0175Z" stroke="currentColor" stroke-width="2" stroke-miterlimit="10"></path>
		            </svg>
		          </a>
		          </button>
		          <button type="button" class="header_setting">
		            <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
		              <path d="M19.0186 25.2673C22.2028 25.2673 24.7731 22.6969 24.7731 19.5128C24.7731 16.3286 22.2028 13.7583 19.0186 13.7583C15.8345 13.7583 13.2642 16.3286 13.2642 19.5128C13.2642 22.6969 15.8345 25.2673 19.0186 25.2673Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
		              <path d="M30.4258 16.2136L28.0729 14.7558C27.9578 14.5384 27.8299 14.3338 27.702 14.1164L27.6253 11.3287C27.5997 10.6893 27.4079 9.92204 26.7174 9.52562L23.6995 7.78649C23.1496 7.4668 22.5102 7.58189 21.8581 7.95273L19.3645 9.29544C19.2494 9.29544 19.1471 9.28266 19.032 9.28266C18.9297 9.28266 18.8402 9.28266 18.7506 9.29544L16.2442 7.93994C15.6816 7.64583 14.9143 7.42844 14.2238 7.82486L11.2059 9.56399C10.656 9.88368 10.4386 10.4975 10.4258 11.2392L10.3491 14.1292C10.2468 14.2827 10.1445 14.4361 10.055 14.6023L7.61253 16.1113C7.07545 16.4566 6.5 17.0064 6.5 17.7993V21.2903C6.5 21.9169 6.92199 22.4156 7.56138 22.7993L9.99105 24.2954C10.0806 24.4617 10.1829 24.6279 10.2852 24.7942L10.3619 27.6714C10.3875 28.3108 10.5793 29.0781 11.2698 29.4745L14.2877 31.2136C14.8376 31.5333 15.477 31.4182 16.1292 31.0474L18.61 29.7047C18.7506 29.7047 18.8785 29.7302 19.0192 29.7302C19.1087 29.7302 19.1854 29.7302 19.2749 29.7302L21.7558 31.0729C22.3184 31.3671 23.0857 31.5844 23.7762 31.188L26.7941 29.4489C27.344 29.1292 27.5614 28.5154 27.5742 27.7737L27.6509 25.0116C27.7916 24.7942 27.9194 24.5768 28.0473 24.3594L30.3875 22.9144C30.9246 22.5691 31.5 22.0192 31.5 21.2264V17.7353C31.5 17.1087 31.078 16.61 30.4386 16.2264L30.4258 16.2136Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		            </path>
		            </svg>
		          </button>
		          <div class="header_content">
		            <a href="/eggmain"><button type="button" class="egg"></button></a>
		            <a href="/jellyshop"><button type="button" class="jelly"></button></a>
		            <button type="button" class="shop"></button>
		          </div>
		        </div>
		      </div>
		  </header>
		    <!-- 컨테이너 -->
		  <div id="main_container">
		    <div class="main_banner1">
		      <img src="../images/main/main_banner.png" alt="">
		    </div>
		    <div class="main_gray">
		      <div class="main_my">
		        <div class="main_community">
		          <img src="../images/main/main_community1.png" alt="">
		          <a><img src="../images/main/riize.png" alt=""></a>
		          <a href="/aespa"  class="aespa"><img src="../images/main/main_aespa.png" alt=""></a>
		        </div>
		        <c:if test="${not empty list}">
			        <div class="main_myidol">
				          <h1>나의 아이돌</h1>
				          <div id="myIdolSection">
					          <c:forEach items="${list}" var="idto" varStatus="status">
					          <div class="my_idol" onclick="location.href='/wemypage'">
					            <div class="my_idol_cha">
					              <img src="../images/main/my_idol.png" alt="">
					            </div>
					            <img class="main_al" src="../images/main/al.png" alt="">
					            <div class="my_idol_nickbox">
					              <p class="my_idol_nick">${idto.nickName }</p>
					            </div>
					          </div>
				       			</c:forEach>
				          </div>
				        </div>
		         </c:if>
		      </div>
		      <div class="main_banner2">
		        <a href="/eggmain"><img src="../images/main/main_banner2.png" alt=""></a>
		      </div>
		    </div>
		    <div class="main_white">
		      <div class="main_merch">
		        <img src="../images/main/main_merch.png" alt="">
		      </div>
		    </div>
		    <div class="main_gray">
		      <div class="main_dm">
		        <img src="../images/main/main_dm.png" alt="">
		      </div>
		      <div class="main_artist">
		        <img src="../images/main/main_artist1.png" alt="">
		        <img src="../images/main/main_artist2.png" alt="">
		        <img src="../images/main/main_artist3.png" alt="">
		        <img src="../images/main/main_artist4.png" alt="">
		        <img src="../images/main/main_artist5.png" alt="">
		        <img src="../images/main/main_artist6.png" alt="">
		        <img src="../images/main/main_artist7.png" alt="">
		        <img src="../images/main/main_artist8.png" alt="">
		        <img src="../images/main/main_artist9.png" alt="">
		        <img src="../images/main/main_artist10.png" alt="">
		        <img src="../images/main/main_artist11.png" alt="">
		      </div>
		    </div>
		  </div>
    </c:when>
    <c:otherwise>
        <!-- 로그아웃 상태 -->
        <!-- 헤더 -->
		  <header>
		      <div id="header_wrap">
		        <div class="main_logo">
		            <img src="../images/main/weverse_logo.png" alt="">
		          </a>
		        </div>
		        <div class="header_action">
		          <a href="/login/login"><button type="button" class="header_singin" >Sign in</button></a>
		          <div class="header_content">
		            <button type="button" class="egg" onclick="location.href='/eggmain'"></button>
		            <button type="button" class="jelly" onclick="location.href='/jellyshop'"></button>
		            <button type="button" class="shop" ></button>
		          </div>
		        </div>
		      </div>
		  </header>
		  <!-- 컨테이너 -->
		  <div id="main_container">
		    <div class="main_banner1">
		      <img src="../images/main/main_banner.png" alt="">
		    </div>
		    <div class="main_gray">
		      <div class="main_dm">
		        <img src="../images/main/main_dm.png" alt="">
		      </div>
		      <div class="main_banner2">
		        <a href="/"><img src="../images/main/main_banner2.png" alt=""></a>
		      </div>
		      <div class="main_artist">
		        <img src="../images/main/main_artist1.png" alt="">
		        <img src="../images/main/main_artist2.png" alt="">
		        <img src="../images/main/main_artist3.png" alt="">
		        <img src="../images/main/main_artist4.png" alt="">
		        <img src="../images/main/main_artist5.png" alt="">
		        <img src="../images/main/main_artist6.png" alt="">
		        <img src="../images/main/main_artist7.png" alt="">
		        <img src="../images/main/main_artist8.png" alt="">
		        <img src="../images/main/main_artist9.png" alt="">
		        <img src="../images/main/main_artist10.png" alt="">
		        <img src="../images/main/main_artist11.png" alt="">
		      </div>
		    </div>
		  </div>
    </c:otherwise>
</c:choose>
  
  

  <!-- footer -->
  <footer>
    <div id="main_footer">
      <img src="../images/main/footer.png" alt="">
    </div>
  </footer>
  
</body>
</html>
