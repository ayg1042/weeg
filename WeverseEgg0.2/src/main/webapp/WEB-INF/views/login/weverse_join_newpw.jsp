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
	<script>
		$(function(){
			$('.xBtn1').hide();
			$('.xBtn2').hide();
			
			
			// x 버튼 클릭 이벤트는 한 번만 바인딩
			$('.xBtn1').click(function(){
				$('#newpw').val("").trigger('input');
			});

			$('.xBtn2').click(function(){
				$('#newpwchk').val("").trigger('input');
			});

			$('#newpw').on('input', function() {
				var pwVal = $(this).val();
				if (pwVal.length > 0) {
					$('.xBtn1').show();
				};
				 // 비밀번호 검증 로직 실행
				 validatePassword(pwVal);
			});

			$('#newpwchk').on('input', function() {
				var pwVal = $(this).val();
				if (pwVal.length > 0) {
					$('.xBtn2').show();
				};
				if (pwVal == $("#newpw").val()){
					$(".pwchkmsg").text("비밀번호가 일치합니다.")
					$(".pwchkmsg").css('color', 'rgb(0, 203, 213)')
					$(".chk2").css('border-bottom-color', 'rgb(0, 203, 213)')
				}else{
					$(".pwchkmsg").text("비밀번호가 일치하지 않습니다. 다시 확인해주세요.")
					$(".pwchkmsg").css('color', 'rgb(254, 91, 88)');
					$(".chk2").css('border-bottom-color', 'rgb(254, 91, 88)');
				}
			});

			// 비밀번호 보기 안보기
			$('.eyeBtn1').click(function(){
				var pwInput = $('#newpw');
				var type = pwInput.attr('type');
				if (type === 'password') {
						pwInput.attr('type', 'text');
						$(this).css('background-image', 'url(../images/login/eye_open.svg)'); // 눈 열린 아이콘
				} else {
						pwInput.attr('type', 'password');
						$(this).css('background-image', 'url(../images/login/eye_close.svg)'); // 눈 닫힌 아이콘
				}
			});
			$('.eyeBtn2').click(function(){
				var pwInput = $('#newpwchk');
				var type = pwInput.attr('type');
				if (type === 'password') {
						pwInput.attr('type', 'text');
						$(this).css('background-image', 'url(../images/login/eye_open.svg)'); // 눈 열린 아이콘
				} else {
						pwInput.attr('type', 'password');
						$(this).css('background-image', 'url(../images/login/eye_close.svg)'); // 눈 닫힌 아이콘
				}
			});

			// 비밀번호 유효성 검사 함수
			function validatePassword(password) {
        let lengthCheck = password.length >= 8 && password.length <= 32;
        let letterCheck = /[a-zA-Z]/.test(password);
        let numberCheck = /[0-9]/.test(password);
        let specialCharCheck = /[!@#$%^&*(),.?":{}|<>]/.test(password);

        // 비밀번호 조건 메시지 색상 업데이트
        updateValidationMessage($(".pw-length"), lengthCheck);
        updateValidationMessage($(".pw-letter"), letterCheck);
        updateValidationMessage($(".pw-number"), numberCheck);
        updateValidationMessage($(".pw-special"), specialCharCheck);

				// 모든 조건이 충족되었는지 확인 후 input 테두리 변경
        if (lengthCheck && letterCheck && numberCheck && specialCharCheck) {
            $(".chk").css('border-bottom-color', 'rgb(0, 203, 213)');
        } else {
            $(".chk").css('border-bottom-color', 'rgb(254, 91, 88)');
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
			<img src="../images/login/weverseAccount_logo.png" id="weAccountImg">
		</div>
		<div class="login_section">
			<h1 class="login_txt">
				새 비밀번호를 설정해 주세요.
			</h1>
			<form action="#" method="post" name="setpwFrm" class="setpwFrm">
				<div class="inputType_email">
					<label class="input_label">새로운 비밀번호</label>
					<div class="newpw chk">
						<input id="newpw" class="input_newpw" type="password" name="newpw" placeholder="새로운 비밀번호">
						<button type="button" class="xBtn1"></button>
						<button type="button" class="eyeBtn1"></button>
					</div>
					<div class="setpwMessage">
						<p class="pw-length">8 - 32자</p>
						<p class="pw-letter">영문 1글자 이상</p>
						<p class="pw-number">1글자 이상 숫자</p>
						<p class="pw-special">1글자 이상 특수문자</p>
					</div>
				</div>
				<div class="inputType_pw">
					<label class="input_label">새로운 비밀번호 확인</label>
					<div class="newpw chk2">
						<input id="newpwchk" class="input_newpw" type="password" name="newpwchk" placeholder="새로운 비밀번호 확인">
						<button type="button" class="xBtn2"></button>
						<button type="button" class="eyeBtn2"></button>
					</div>
					<div class="chkpwMessage">
						<p class="pwchkmsg"></p>
					</div>
				</div>
			</form>
			<div class="button_area_pw">
				<button type="button" class="setpwBtn">다음</button>
				<a href="#" class="prev">이전</a>
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