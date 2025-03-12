<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="{% static 'css/admin1/admin_login.css'%}">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>admin 관리자 페이지</title>
<style>

</style>
<script>

	if ('{{lmsg}}' == '1'){
		alert("관리자 로그인되었습니다.")
		location.href='/admin1/admin_memList/'
	}else if('{{lmsg}}' == '0'){
			alert("아이디 또는 패스워드가 일치하지 않습니다.")
	};
	$(function(){
		$(".login_btn").click(function(){
			if($("#user_id").val().length<1){
				alert("아이디를 입력하세요.")
				$("#user_id").focus()
				return false;
			}
			if($("#user_pw").val().length<1){
					alert("비밀번호를 입력하세요.")
					$("#user_pw").focus()
					return false;
			}
			login_frm.submit()
			})
	})
</script>

</head>
<body>
	<nav class="gnb">
			<a href="#" class="logo"><img src="/static/images/admin1/logo_sample.png" alt=""></a>
			<div class="menu">
				<a href="/admin1/admin_memList/">회원관리</a>
				<a href="#">판매관리</a>
				<a href="/admin1/admin_noticeList/">공지사항</a>
				<a href="/admin1/admin_postList/">포스트</a>
				<a href="/admin1/admin_qList/" >1:1문의</a>
				<a href="/admin1/admin_adminList/">관리자설정</a>
				<a href="#">로그아웃</a>
			</div>
	</nav>

	<div class="login_wrap">
		<h2>관리자 로그인</h2>
		<form action="/admin1/login/" method="post" id="login_frm" name="login_frm">
			<div class="id_wrap">
				<label for="user_id">아이디</label>
				<input type="text" id="user_id" name="user_id" placeholder="아이디를 입력하세요">
			</div>
			<div class="pw_wrap">
				<label for="user_pw">비밀번호</label>
				<input type="password" id="user_pw" name="user_pw" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="saveid_wrap">
				<input type="checkbox" id="save_id" name="save_id">
				<label for="save_id">아이디 저장</label>
			</div>
			<button type="button" class="login_btn">로그인</button>
	</form>
	</div>

</body>
</html>
