<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
		<form action="/admin" method="post" name="adminloginFrm" class="adminloginFrm">
			<div class="gichanta">
				<div class="form-row">
					<label>아이디</label>
					<input type="text" name="adminId" value="admin" readonly>
				</div>
				<br/>
				<div class="form-row">
					<label>비밀번호</label>
					<input type="password" name="adminPw" id="admin_pw">
				</div>
			</div>
			<button type="button" class="login_btn">로그인</button>
		</form>
	</div>

	<script>
		$(function () {
			// 클릭 이벤트
			$(".login_btn").click(function () {
				if ($("#admin_pw").val().length < 1) {
					alert("비밀번호를 입력하세요.");
					$("#admin_pw").focus();
					return false;
				}
				adminloginFrm.submit();
			});
	
			<%
				String lmsg = (String) request.getAttribute("lmsg");
				if (lmsg != null) {
			%>
				const lmsg = "<%= lmsg %>";
				if (lmsg === '1') {
					alert("관리자 로그인되었습니다.");
				} else if (lmsg === '0') {
					alert("패스워드가 일치하지 않습니다.");
				}
			<% } %>
		});
	</script>
</body>
</html>
