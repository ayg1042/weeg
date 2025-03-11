<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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