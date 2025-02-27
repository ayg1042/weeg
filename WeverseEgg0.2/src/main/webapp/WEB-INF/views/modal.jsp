<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/css/modal.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<div id="header">헤더 위치</div>
		<div class="main_bg">
			<div class="game_main">
				<div class = 'info_area'>
				
				</div>
				
				<!-- 방꾸미기 -->
				<div id="interior_items">
					<div id='light'></div> <!-- 조명 -->
					<div id='photo_frame'></div> <!-- 액자 -->
					<div id='photo_frame'></div> <!--  -->
					<div id='photo_frame'></div> <!--  -->
					<div id='photo_frame'></div> <!--  -->
					<div id='photo_frame'></div> <!--  -->
					<div id='photo_frame'></div> <!--  -->
					<div id='photo_frame'></div> <!--  -->
				</div>
				
				
				<!-- 캐릭터 -->
				<div class="character_container">
			    <div class="clothing hat"></div>
			    <div class="clothing dress"></div>
				</div>
			
				<!-- 모달 열기 버튼 -->
				<table class="menu">
					<tr>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/practiceBtn.png"></td>
						<td class="open-modal" data-modal="modal2"><img src="/images/egg_menu_btn/activityBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/myBagBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/eventBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/questBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/shopBtn.png"></td>
					</tr>
				</table>
				
				<!-- 모달 창 1 -->
				<div id="modal1" class="modal">
				    <div class="modal-content basic">
				        <span class="close">&times;</span>
				        <h2>기본 모달</h2>
				        <p>이것은 기본 스타일의 모달 창입니다.</p>
				    </div>
				</div>
				<!-- 모달 창 1 -->
				<div id="modal2" class="modal">
				    <div class="modal-content basic">
				        <span class="close">&times;</span>
				        <h2>기본 모달</h2>
				        <p>이것은 기본 스타일의 모달 창입니다.</p>
				    </div>
				</div>
				
				
				
				
				<!-- 
				모달 창 2
				<div id="modal2" class="modal">
				    <div class="modal-content dark">
				        <span class="close">&times;</span>
				        <h2>어두운 모달</h2>
				        <p>어두운 테마의 모달 창입니다.</p>
				    </div>
				</div>
				
				모달 창 3
				<div id="modal3" class="modal">
				    <div class="modal-content animated">
				        <span class="close">&times;</span>
				        <h2>애니메이션 모달</h2>
				        <p>부드럽게 나타나는 모달입니다.</p>
				    </div>
				</div>
				
				모달 창 4
				<div id="modal4" class="modal">
				    <div class="modal-content alert">
				        <span class="close">&times;</span>
				        <h2>알림 모달</h2>
				        <p>이것은 사용자에게 중요한 정보를 알리는 모달입니다.</p>
				    </div>
				</div>
				 -->
			</div>
		</div>
		<script src="/js/modal.js" defer></script>
		
	</body>
</html>