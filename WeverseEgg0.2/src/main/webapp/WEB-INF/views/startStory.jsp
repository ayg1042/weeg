<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>캐릭터생성 스토리</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
   @font-face {
		    font-family: 'NeoDunggeunmo';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
	*{margin: 0; padding: 0; font-family: "NeoDunggeunmo", Pretendard Variable, Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;}
    a{cursor: pointer;}
    /* 헤더 */
    header{
      position: sticky;
      top: 0px;
      z-index: 3000;
      width: 100%;
      height: 80px;
      display: flex;
      background: white;
    }
    #header_wrap{
      border-bottom: 1px solid #EBEDF2;
      width: 100%;
      height: 80px;
      display: flex;
    }
    .main_logo{
      padding-left: 50px;
      width: 186px;
      height: 80px;
      align-items: center;
      display: flex;
    }
    .main_logo a{
      cursor: pointer;
    }
    .main_logo img{
      width: 136px;
      height: 20px;
    }
    .header_action{
      padding: 0 60px 0 12px;
      display: flex;
      align-items: center;
      flex: 1 0 auto;
      column-gap: 28px;
      justify-content: flex-end;
    }
    .header_action .header_singin{
      background: linear-gradient(134deg, #07D8E2 54.07%, #35E99D 99.24%);
      border-radius: 100px;
      color: #fff;
      font-size: 15px;
      font-weight: 700;
      line-height: 18px;
      margin-right: 4px;
      padding: 8px 20px 10px 22px;
      border: none;
      text-align: center;
      cursor: pointer;
    }
    .header_content{
      border-left: 1px solid #E0E0E0;
      align-items: center;
      column-gap: 28px;
      padding-left: 28px;
      display: flex;
      position: relative;
    }
    .header_content button{
      width: 38px;
      height: 38px;
      border: none;
      cursor: pointer;
    }
    .header_content .egg{
      background: no-repeat url('/images/chocieCharacter/egg_icon.png') 0 0 / contain;
    }
    .header_content .jelly{
      background: no-repeat url('/images/chocieCharacter/jelly_icon.png') 0 0 / contain;
    }
    .header_content .shop{
      background: no-repeat url('/images/chocieCharacter/shop_icon.png') 0 0 / contain;
    }
    /* 로그인 후 추가되는 헤더 요소 */
    .header_search, .header_alram, .header_mypage, .header_setting {
      background: none;
      border: none;
      cursor: pointer;
    }
    .header_action svg {
      display: block;
    }
    
    /* 메인 배경,틀 */
    #mainBack{
      width: 100%; 
      height: calc(100vh - 80px);
      background-image: url('/images/mainRoom/game_back.jpg');
    }
    #mainStory{
      width: 1260px;
      height: 760px;
      border: 20px solid #D0D3FE;
      border-radius: 40px;
		  background-image: url('/images/startStory/story_back_01.png');
      margin: 0 auto;
      position: relative;
      top: 40px; /* margin-top 대신 사용 */
    }
    
		.story-bg-1 {
    background-image: url('/images/startStory/story_back_01.png');
    background-size: cover;
		}

		.story-bg-2 {
    background-image: url('/images/startStory/story_back_02.png');
    background-size: cover;
		}
    
    /* 스토리 */
    .textArea{
    width: 100%;
    height: 135px;
    font-size: 30px;
    line-height: 45px;
    padding-left: 84px;
    box-sizing:border-box;
    margin-top:532px;
    }
    
    .bottomArea{
    display:flex;
    width:100%;
    height:93px;
    }
    
    #skip{
    font-size: 16px;
    font-weight: 400;
    padding-top: 47px;
    padding-left: 84px;
    }
    
    #skipBtn{
    cursor:pointer;
    }
    
    #next{
    display: flex;
    width:165px;
    height:93px;
    margin-left:584px;
    }
    
    #nextBtn{
    width: 165px;
    height: 47px;
    border-radius: 40px;
    border:none;
    background-color:#D0D3FE;
    margin-top: 16px;
    font-size: 20px;
    cursor: pointer;
    }

    </style>
    
    <script>
    /* 다음누를시 스토리 대사,배경 변경 */
    	let pageIndex = 0;
    
    	const pages = [
				{bg:"/images/startStory/story_back_01.png",text:"(잠에서 깨어난 나) 부스럭..<br/>하암~ 잘 잤다..<br/>(다리 쪽에서 무언가가 느껴진다)"},
				{bg:"/images/startStory/story_back_01.png",text:"(이불 아래에서 알을 하나 발견함)<br/>???!!!"},
				{bg:"/images/startStory/story_back_01.png",text:"이게 뭐야..!! 내가 낳은 건가...???!!<br/>(알에는 위버스라고 적혀있음)<br/>위..버스...?"},
				{bg:"/images/startStory/story_back_01.png",text:"어제 자기 전까지 보고 자긴 했는데...<br/>......<br/>아무래도 본사로 찾아가 봐야겠어!"},
				{bg:"/images/startStory/story_back_02.png",text:"(위버스 본사에 찾아가는 나)<br/>여기가 위버스 본사군...<br/>저 중에 창문 하나는 내가 했다 진짜.."},
				{bg:"/images/startStory/story_back_02.png",text:"(똑똑..)<br/>"},
				{bg:"/images/startStory/story_back_03.png",text:"안녕하세요.<br/>무슨 일 이시죠?"},
				{bg:"/images/startStory/story_back_04.png",text:"저 이 알을 제가 낳은 거 같아요..."},
				{bg:"/images/startStory/story_back_03.png",text:"헙. 그 알은..!<br/>저쪽 신인개발팀으로 가시면 됩니다. 프로듀서."},
				{bg:"/images/startStory/story_back_04.png",text:"엥 뭔 프로듀서?<br/>일단 가라니까 가보자.."},
				{bg:"/images/startStory/story_back_06.png",text:"당신은 선택받은 프로듀서 입니다."},
				{bg:"/images/startStory/story_back_05.png",text:"갑자기 뭔...<br/>아니 제가 프로듀서라니요."},
				{bg:"/images/startStory/story_back_06.png",text:"크게 될 위인들은 모두 특별한<br/>탄생 스토리를 가지고 있죠..."},
				{bg:"/images/startStory/story_back_06.png",text:"알에서 태어난 박혁거세...<br/>그리고 어머니의 겨드랑이에서 태어난 부처...<br/>이 아이도 마찬가지 입니다."},
				{bg:"/images/startStory/story_back_06.png",text:"세계적인 아이돌이 될 친구가<br/>당신을 프로듀서로 선택했네요."},
				{bg:"/images/startStory/story_back_05.png",text:"그러니까 이 알에서 태어나는 아이돌을<br/>제가 프로듀싱 해야한다는 거죠?"},
				{bg:"/images/startStory/story_back_06.png",text:"네 맞습니다. 이것을 드릴테니 알을 깨서<br/>세계적인 아이돌로 성장시켜주세요.<br/>(망치)"},
				{bg:"/images/startStory/story_back_05.png",text:"(슈니발렌처럼 망치로 알을 깸)<br/>"},
				{bg:"/images/startStory/story_back_06.png",text:"아주 좋습니다(?)<br/>당신은 누구보다 훌륭한 프로듀서가 될 것 같군요.<br/>후후."},
				{bg:"/images/startStory/story_back_06.png",text:""},
    	];
    	
    	function nextBtn(){
    		
    		// 화면 초기화
    		document.getElementById("text").innerHTML = "";
    		
	   		pageIndex = (pageIndex + 1) % pages.length;

        let storyDiv = document.getElementById("mainStory");
        let textElement = document.getElementById("text");
    		
    		storyDiv.className = ""; // 기존 클래스 제거
    	  storyDiv.classList.add(`story-bg-${pageIndex + 1}`); // 새 클래스 추가
    	  
    	  document.getElementById('mainStory').style.backgroundImage= "url("+pages[pageIndex].bg+")" 
    		//document.getElementById("text").innerHTML = pages[pageIndex].text;
    	  
    	  let text = pages[pageIndex].text;
    	  console.log("text : "+text);
    	  //let textArray = [];
    	  let textArray = text.split("<br/>"); // <br/>을 기준으로 문장 나누기
    	  textElement.innerHTML = ""; // 기존 텍스트 초기화
    	  
    	  //const text = pages[pageIndex].text;
     	  //let test = "";

	    	// 타이핑 효과
	    	let i = 0;
	    	let j = 0;
	      //let line = 0;
	      console.log(textArray);
	      console.log(textArray.length);
    	  function typingLine() {
    		  if (i >= textArray.length) return;
    		  
 	        let line = textArray[i]; // 현재 출력할 줄
 	        let span = document.createElement("span"); // 새 줄을 위한 span 태그 생성
 	        textElement.appendChild(span);
					console.log(line);
 	        function typingChar() {
 	            if (j < line.length) {
 	                span.innerHTML += line.charAt(j);
 	                j++;
 	                setTimeout(typingChar, 50); // 50ms 간격으로 글자 추가
 	            } else if(text == ""){
					 				location.href="/"
 	        		} else {
 	                textElement.appendChild(document.createElement("br")); // 줄바꿈 추가
 	                i++; // 다음 줄로 이동
 	                j = 0; // 문자 인덱스 초기화
 	                setTimeout(typingLine, 200); // 한 줄 끝난 후 다음 줄 출력
 	            }
	 	      } // typingChar
	 	      typingChar();
	 	      
    	  } // typingLine
    	  typingLine(); // 타이핑 효과 시작
    	  
    	} // nextBtn
    	
    	// skip 버튼
    	function skipBtn(){
				if(confirm("스토리를 스킵하시겠습니까?")){
					location.href='/';
				}
    	}
    	
    </script>
    
</head>

<body>
	<!-- 헤더 -->
  <header>
    <div id="header_wrap">
      <div class="main_logo">
        <a href="/">
          <img src="/images/chocieCharacter/weverse_logo.png" alt="">
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
          <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M19.0176 18.5246C22.2001 18.5246 24.78 15.9447 24.78 12.7623C24.78 9.57987 22.2001 7 19.0176 7C15.8352 7 13.2553 9.57987 13.2553 12.7623C13.2553 15.9447 15.8352 18.5246 19.0176 18.5246Z" stroke="currentColor" stroke-width="2" stroke-miterlimit="10"></path>
            <path d="M19.0175 31.8641C22.104 31.8641 24.9255 31.6919 27.0715 31.0958C28.2637 30.7646 29.4691 30.248 30.1182 29.2545C30.6481 28.4332 30.6349 27.2675 30.0255 26.2343C28.6214 23.8234 24.3559 21.6509 19.0837 21.6509H18.9115C13.6394 21.6509 9.37393 23.8234 7.96978 26.2343C7.37368 27.2675 7.34719 28.4332 7.87706 29.2545C8.52615 30.248 9.73159 30.7779 10.9238 31.0958C13.083 31.6786 15.8913 31.8641 18.9778 31.8641H19.0175Z" stroke="currentColor" stroke-width="2" stroke-miterlimit="10"></path>
          </svg>
        </button>
        <button type="button" class="header_setting">
          <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M19.0186 25.2673C22.2028 25.2673 24.7731 22.6969 24.7731 19.5128C24.7731 16.3286 22.2028 13.7583 19.0186 13.7583C15.8345 13.7583 13.2642 16.3286 13.2642 19.5128C13.2642 22.6969 15.8345 25.2673 19.0186 25.2673Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
            <path d="M30.4258 16.2136L28.0729 14.7558C27.9578 14.5384 27.8299 14.3338 27.702 14.1164L27.6253 11.3287C27.5997 10.6893 27.4079 9.92204 26.7174 9.52562L23.6995 7.78649C23.1496 7.4668 22.5102 7.58189 21.8581 7.95273L19.3645 9.29544C19.2494 9.29544 19.1471 9.28266 19.032 9.28266C18.9297 9.28266 18.8402 9.28266 18.7506 9.29544L16.2442 7.93994C15.6816 7.64583 14.9143 7.42844 14.2238 7.82486L11.2059 9.56399C10.656 9.88368 10.4386 10.4975 10.4258 11.2392L10.3491 14.1292C10.2468 14.2827 10.1445 14.4361 10.055 14.6023L7.61253 16.1113C7.07545 16.4566 6.5 17.0064 6.5 17.7993V21.2903C6.5 21.9169 6.92199 22.4156 7.56138 22.7993L9.99105 24.2954C10.0806 24.4617 10.1829 24.6279 10.2852 24.7942L10.3619 27.6714C10.3875 28.3108 10.5793 29.0781 11.2698 29.4745L14.2877 31.2136C14.8376 31.5333 15.477 31.4182 16.1292 31.0474L18.61 29.7047C18.7506 29.7047 18.8785 29.7302 19.0192 29.7302C19.1087 29.7302 19.1854 29.7302 19.2749 29.7302L21.7558 31.0729C22.3184 31.3671 23.0857 31.5844 23.7762 31.188L26.7941 29.4489C27.344 29.1292 27.5614 28.5154 27.5742 27.7737L27.6509 25.0116C27.7916 24.7942 27.9194 24.5768 28.0473 24.3594L30.3875 22.9144C30.9246 22.5691 31.5 22.0192 31.5 21.2264V17.7353C31.5 17.1087 31.078 16.61 30.4386 16.2264L30.4258 16.2136Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          </path>
          </svg>
        </button>
        <div class="header_content">
          <button type="button" class="egg"></button>
          <button type="button" class="jelly"></button>
          <button type="button" class="shop"></button>
        </div>
      </div>
    </div>
  </header>
  
  <div id="mainBack">
    <div id="mainStory">
    
    	<div class="textArea">
    		<p id="text">(잠에서 깨어난 나) 부스럭..<br/>하암 ~ 잘 잤다..<br/>(다리 쪽에서 무언가가 느껴진다)</p>
    	</div>
    	
    	<div class="bottomArea">
				<div id="skip">
					<p id="skipBtn" onclick="skipBtn()">skip ></p>
				</div>    		
				<div id="next">
					<button type="button" onclick="nextBtn()" id="nextBtn">다음 ></button>
				</div>
    	</div> <!-- bottomArea -->
    	
    </div> <!-- mainStory -->
  </div> <!-- mainBack -->

</body>
</html>