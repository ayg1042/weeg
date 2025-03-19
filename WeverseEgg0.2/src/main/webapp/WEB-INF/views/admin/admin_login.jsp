<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/admin/admin_login.css" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>admin 관리자 페이지</title>
<title>Insert title here</title>
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
