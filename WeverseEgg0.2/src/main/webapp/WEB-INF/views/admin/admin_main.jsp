<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
<link rel="stylesheet" type="text/css" href="../css/admin/admin_main.css"/>
<title>Insert title here</title>
</head>
<body>
	<div id="admin_container">
	<%@ include file="gnb.jsp" %>
    
    <div id="admin_content">
    	<h2>회원정보</h2>
    	<div class="memberTableArea">
    		<table class="memberTable">
	    		<colgroup>
		        <col style="width: 5%;">
		        <col style="width: 25%;">
		        <col style="width: 20%;">
		        <col style="width: 20%;">
		        <col style="width: 15%;">
	    		</colgroup>
    			<tr>
    				<th>NO.</th>
    				<th>이메일</th>
    				<th>이름</th>
    				<th>닉네임</th>
    				<th>보유젤리</th>
    			</tr>
    			<tr>
    				<td>1</td>
    				<td><a href="#">aaa@naver.com</a></td>
    				<td>홍길동</td>
    				<td>길동스</td>
    				<td>1000</td>
    			</tr>
    			<tr>
    				<td>1</td>
    				<td><a href="#">aaa@naver.com</a></td>
    				<td>홍길동</td>
    				<td>길동스</td>
    				<td>1000</td>
    			</tr>
    			<tr>
    				<td>1</td>
    				<td><a href="#">aaa@naver.com</a></td>
    				<td>홍길동</td>
    				<td>길동스</td>
    				<td>1000</td>
    			</tr>
    			<tr>
    				<td>1</td>
    				<td><a href="#">aaa@naver.com</a></td>
    				<td>홍길동</td>
    				<td>길동스</td>
    				<td>1000</td>
    			</tr>
    		</table>
    	</div>
    </div>
  </div>

</body>
</html>