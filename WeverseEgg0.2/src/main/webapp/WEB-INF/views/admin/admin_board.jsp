<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
<title>Insert title here</title>
</head>
<body>
	<div id="admin_container">
	
    <%@ include file="gnb.jsp" %>
    
    <div id="admin_content">
    	<h2>게시판관리</h2>
    	<div class="memberTableArea">
    		<table class="memberTable">
    			<tr>
    				<th>NO.</th>
    				<th>이메일</th>
    				<th>이름</th>
    				<th>닉네임</th>
    				<th>보유젤리</th>
    			</tr>
    			
    		</table>
    	</div>
    </div>
  </div>

</body>
</html>