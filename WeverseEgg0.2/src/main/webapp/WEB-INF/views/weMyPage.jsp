<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/header.css" />
  <link rel="stylesheet" type="text/css" href="../css/weMyPage.css" />
  <title>WEVERSEGG_MyPAGE</title>
</head>


<body>

  <!-- 마이페이지 메인 -->
  <div id="userInfoBar">

    <!-- 상단 프로필 -->
    <div class="profile_wrap">
      <h2 class="profile_name">${sessionScope.session_id.getNickname()}</h2>
      <address class="profile_address">${sessionScope.session_id.getEmail()}</address>
      <button type="button" class="profile_signout" onclick="location.href='/login/logout'">로그아웃</button>
    </div>
    <img src="../images/WeMyPage/myPage_topnavi.PNG" alt="상단내비이미지">
  </div>

  <!-- 왼쪽 내비게이션 -->
  <div id="myPage_navi">
    <div id="left_navi">
      <div class="MyJellyContent">
        <a class="MyJellyPoint" href="#">0</a>
        <a class="MyJellyCharge" href="#">충전</a>
      </div>
      <a class="MyShopView" href="#">샵 주문 내역</a>

      <!-- 바로가기 사이트 -->
      <div class="LinkCotainer">
        <div class="LinkContent">
          <a href="#" class="LinkItem">
            <div class="Img_W"><img src="../images/WeMyPage/WeMa.png" class="WeMagazine"></div>
            Weverse Magazine
          </a>
          <a href="#" class="LinkItem">
            <div class="Img_W"><img src="../images/WeMyPage/WeCo.png" class="WeMagazine"></div>
            Weverse Concerts
          </a>
          <a href="#" class="LinkItem">
            <div class="Img_W"><img src="../images/WeMyPage/WeSu.png" class="WeMagazine"></div>
            Weverse Survey
          </a>
          <a href="#" class="LinkItem">
            <div class="Img_W"><img src="../images/WeMyPage/WeBTS.png" class="WeMagazine"></div>
            BTS Island: In the SEOM
            <a href="#" class="LinkItem">
              <div class="Img_W"><img src="../images/WeMyPage/egg_icon.png" class="WeMagazine"></div>
              Weverse Egg
            </a>
        </div>
      </div>
    </div>

    <!-- 미디어 구매 내역 -->
    <div id="center_navi">

      <div class="avatar_zone">

        <h3 class="myAvatarTitle">나의 아바타</h3>

        <div class="avatar_list">

          <div class="myAvatarContainer">
            <div class="myAvatar">
              <!-- "main_avatar" 대표 캐릭터 (img에 아이디/클래스 만들어서 캐릭터 가져가세요.)-->
              <div id="main_avatar">메인</div>
              <img src="../images/WeMyPage/winter.png" class="myidol" alt="첫번째 대표 캐릭터">
            </div>
            <div class="avatar_blank">
            </div>
            <div class="al_img1">
              <img src="../images/WeMyPage/al.png">
            </div>
            <div class="avatar_name">윈터츄</div>
            <button class="selectButton">대표 아바타 선택</button>
          </div>

          <div class="myAvatarContainer">
            <div class="myAvatar">
              <img src="../images/WeMyPage/zizel.png" class="myidol" alt="두번째 캐릭터">
            </div>
            <div class="al_img2">
              <img src="../images/WeMyPage/al.png">
            </div>
            <div class="avatar_name">지젤츄</div>
            <button class="selectButton">대표 캐릭터 선택</button>
          </div>

          <div class="myAvatarContainer">
            <div class="myAvatar">
              <!-- 이미지 이름 lockidol.png 시 대표 캐릭터로 선택 불가 -->
              <img src="../images/WeMyPage/lockidol.png" class="myidol" alt="생성전 캐릭터">
            </div>
            <div class="avatar_blank">
            </div>
            <div class="al_img3">
              <img src="../images/WeMyPage/al.png">
            </div>
            <div class="avatar_name">미생성 아바타</div>
            <button class="selectButton">대표 캐릭터 선택</button>
          </div>

        </div>
      </div>
      <img src="../images/WeMyPage/mediaHistory.PNG" alt="">
    </div>
  </div>

  <!-- 대표 캐릭터 선택 스크립트 -->
  <script>
    document.querySelectorAll('.myAvatarContainer').forEach(container => {
      container.addEventListener('click', function () {
        const firstContainer = document.querySelector('.avatar_list .myAvatarContainer:first-child');
        const firstImage = firstContainer.querySelector('.myAvatar img');
        const firstName = firstContainer.querySelector('.avatar_name');
        const clickedImage = this.querySelector('.myAvatar img');
        const clickedName = this.querySelector('.avatar_name');

        if (clickedImage.src.includes('lockidol.png')) {
          alert('잠긴 아바타는 선택할 수 없습니다.');
          return;
        }

        const confirmChange = confirm('이 아바타를 대표 아바타로 선택하시겠습니까?');
        if (confirmChange) {
          // 아바타 이미지 교체
          const tempSrc = firstImage.src;
          firstImage.src = clickedImage.src;
          clickedImage.src = tempSrc;

          // 아바타 이름 교체
          const tempName = firstName.textContent;
          firstName.textContent = clickedName.textContent;
          clickedName.textContent = tempName;
        }
      });
    });
  </script>

</body>

</html>