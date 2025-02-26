<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="weverse_login.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>Weverse</title>
	<script>
		$(function(){
			$('.xBtn').hide();
			
			// x 버튼 클릭 이벤트는 한 번만 바인딩
			$('.xBtn').click(function(){
				$('.input_email').val("").trigger('input');
			});

			$('.input_email').on('input', function() {
				var emailVal = $(this).val();
				// 간단한 이메일 정규표현식 예제
				var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				
				if (emailVal.length > 0) {
					$('.xBtn').show();
					if(!emailRegex.test(emailVal)) {
						$('.errorMessage p').text("올바른 이메일 형식이 아닙니다.");
						$('.emailType').css('border-bottom-color', 'rgb(254, 91, 88)');
					} else {
						$('.errorMessage p').text("");
						$('.emailType').css('border-bottom-color', '');
					}
				} else {
					$('.xBtn').hide();
					$('.errorMessage p').text("");
				}
			});

			$(".loginBtn").click(function(){
				var emailVal = $(".input_email").val();
				var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				
				if(!emailRegex.test(emailVal)){
					alert("올바른 이메일 형식이 아닙니다.");
					return false;
				}else{
					location.href="#"
				}
			});
		});// jquery

	</script>
</head>
<body>
	<div class="login_back">
		<div class="logo_section">
			<img src="images/login/weverseAccount_logo.png" id="weAccountImg">
		</div>
		<div class="login_section">
			<h1 class="login_txt">
				위버스 계정으로<br>
				로그인이나 회원가입해 주세요
			</h1>
			<!-- 
			// 회원가입시 사용 가능한 이메일 일 때 
			<h1 class="login_txt">
				qo0723@naver.com
			</h1>
			<h2>이 이메일은 새로 가입할 수 있는 이메일입니다. 계속하시겠습니까?</h2> 
			-->
			<form action="#" method="post" name="loginFrm" class="loginFrm">
				<div class="inputType">
					<label class="input_label">이메일</label>
					<div class="emailType">
						<input class="input_email" type="text" name="email" placeholder="your@email.com">
						<button type="button" class="xBtn"></button>
					</div>
					<div class="errorMessage">
						<p></p>
					</div>
				</div>
			</form>
			<div class="button_area">
				<button type="button" class="loginBtn">이메일로 계속하기</button>
				<!-- <button type="button" class="loginBtn">가입하기</button>/ -->
				<a href="#" class="forgot_email">비밀번호를 잊어버리셨나요?</a>
				<!-- <a href="#" class="prev">이전</a> -->
				<div class="kakao_area">
					<div class="line">
						<hr>
						<span class="orText">혹은</span>
						<hr>
					</div>
					<a href="#"><img src="images/login/kakao_login.png" alt="카카오로그인"></a>
				</div>
			</div>

		</div>
	</div>


	<!-- footer -->
	<footer>
		<div class="login_footer">
			<img src="images/login/login_footer.png" alt="">			
		</div>
	</footer>

	
</body>
</html>