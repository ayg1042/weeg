<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
<title>Insert title here</title>
<style>
	#admin_login_area{
		margin: 200px auto;
		width: 300px;
		height: 150px;
		text-align: center;
	}
	
	.adminloginFrm{
		border: 1px solid #e4e4e4;
		margin-top: 20px;
		padding: 40px 40px 20px;
		box-sizing: border-box;
/* 		display: flex; */
		justify-content: center;
	}
	
	.gichanta{
		display: flex;
		flex-direction: column;         
 	 	justify-content: space-between;
 	 	margin-bottom: 20px;
	}
	
	 .adminloginFrm .form-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
	
	.adminloginFrm input{
		width: 120px;
		border: 1px solid #e4e4e4;
	}
	
	.adminloginFrm label{
		width: 60px;
		text-align: center;
		margin-right: 15px;
	}
	
	.adminloginFrm button{
		width: 70px;
		height: 30px;
		border: none;
		border-radius: 10px;
	}
	
</style>
</head>
<body>
	<div id="admin_login_area">
		<img src="../images/mainpage/main_egg.png">
		<form action="" method="post" name="adminloginFrm" class="adminloginFrm">
			<div class="gichanta">
				<div class="form-row">
					<label>아이디</label>
					<input type="text" name="adminId">
				</div>
				<br/>
				<div class="form-row">
					<label>비밀번호</label>
					<input type="password" name="adminPw">
				</div>
			</div>
			<button>로그인</button>
		</form>
	</div>

</body>
</html>
=======

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
>>>>>>> refs/remotes/origin/master
