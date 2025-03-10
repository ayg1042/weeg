<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/login/weverse_login.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>Weverse</title>
</head>
<body>
	<div class="login_back">
		<div class="logo_section">
			<img src="../images/login/weverseAccount_logo.png" id="weAccountImg">
		</div>
		<div class="login_section">
			<h1 class="login_txt">
				가입이 완료되었습니다.
			</h1>
			<h2 class="setnick">
				위버스 계정으로 Weverse Egg, Weverse 및 관련 서비스를 모두 이용할 수 있습니다.
			</h2>
			<!-- 
			// 회원가입시 사용 가능한 이메일 일 때 
			<h1 class="login_txt">
				qo0723@naver.com
			</h1>
			<h2>이 이메일은 새로 가입할 수 있는 이메일입니다. 계속하시겠습니까?</h2> 
			-->
			
			<div class="button_area_nick">
				<button type="button" class="setpwBtn" onclick="location.href='/login/login-2'">로그인으로 돌아가기</button>
			</div>

		</div>
	</div>


	<!-- footer -->
	<footer>
		<div class="login_footer">
			<img src="../images/login/login_footer.png" alt="">			
		</div>
	</footer>

	
</body>
</html>