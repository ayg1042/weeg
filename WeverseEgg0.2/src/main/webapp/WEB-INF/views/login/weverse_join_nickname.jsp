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
			
			// x 버튼 클릭 이벤트는 한 번만 바인딩
			$('.xBtn').click(function(){
				$('.input_nickname').val("").trigger('input');
			});

			$('.input_nickname').on('input', function() {
				var nickVal = $(this).val();
				if (nickVal.length > 0) {
					$('.xBtn').show();
				};
				 // 비밀번호 검증 로직 실행
				 validatePassword(nickVal);
			});

			// 비밀번호 유효성 검사 함수
			function validatePassword(nickname) {
			let lengthCheck = nickname.length >= 1 && nickname.length <= 32;

			// 비밀번호 조건 메시지 색상 업데이트
			updateValidationMessage($(".EM"), lengthCheck);

				if (lengthCheck) {
						$(".chk").css('border-bottom-color', 'rgb(0, 203, 213)');
						$(".EM").text("")
				} else {
						$(".chk").css('border-bottom-color', 'rgb(254, 91, 88)');
						$(".EM").text("유효한 닉네임을 입력해주세요.")
				}
			}

			// 메시지 색상 업데이트 함수
			function updateValidationMessage(element, isValid) {
					if (isValid) {
							element.css('color', 'rgb(0, 203, 213)');  // 조건 충족 시 색상 변경
					} else {
							element.css('color', 'rgb(254, 91, 88)');  // 조건 불충족 시 색상 변경
					}
			}

			$(".setpwBtn").click(function(){
				location.href="#"
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
				닉네임을 입력해주세요.
			</h1>
			<h2 class="setnick">
				1–32자 길이로 숫자, 특수문자 조합의 공통 닉네임이며, 나중에 계정 설정에서 변경할 수 있습니다.
			</h2>
			<!-- 
			// 회원가입시 사용 가능한 이메일 일 때 
			<h1 class="login_txt">
				qo0723@naver.com
			</h1>
			<h2>이 이메일은 새로 가입할 수 있는 이메일입니다. 계속하시겠습니까?</h2> 
			-->
			<form action="#" method="post" name="nicknameFrm" class="nicknameFrm">
				<div class="inputType">
					<label class="input_label">닉네임</label>
					<div class="emailType chk">
						<input class="input_nickname" type="text" name="nickname" value="랜덤닉네임">
						<button type="button" class="xBtn"></button>
					</div>
					<div class="errorMessage">
						<p class="EM"></p>
					</div>
				</div>
			</form>
			<div class="button_area_nick">
				<button type="button" class="setpwBtn">다음</button>
				<a href="#" class="prev">이전</a>
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