<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		        <col style="width: 10%;">
		        <col style="width: 25%;">
		        <col style="width: 20%;">
		        <col style="width: 15%;">
	    		</colgroup>
    			<tr>
    				<th>NO.</th>
    				<th>이메일</th>
    				<th>닉네임</th>
    				<th>보유젤리</th>
    			</tr>
    			<c:if test="${not empty memberList}">
    				<c:forEach items="${memberList}" var="mlist">
		    			<tr>
		    				<td>${mlist.user_id}</td>
		    				<td><a href="/admin/memView?user=${mlist.user_id}">${mlist.email}</a></td>
		    				<td>${mlist.nickname}</td>
		    				<td>${mlist.jelly}</td>
		    			</tr>
    				</c:forEach>
    			</c:if>
    			<c:if test="empty memberList">
	    			<tr>
	    				<td>등록된 회원이 없습니다.</td>
	    			</tr>
    			</c:if>
    		</table>
    	</div>
    </div>
  </div>

</body>
</html>