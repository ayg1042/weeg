<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
<title>Insert title here</title>
</head>
<body>
	<div id="admin_container">
	
    <%@ include file="gnb.jsp" %>
    
    <div id="admin_content">
    	<h2>공지사항</h2>
    	<div class="noticeTableArea">
	    	<button class="writeBtn" onclick="location.href='/admin/noticeWrite'">글쓰기</button>
    		<table class="noticeTable">
    			<colgroup>
		        <col style="width: 10%;">
		        <col style="width: *;">
		        <col style="width: 30%;">
		        <col style="width: 20%;">
	    		</colgroup>
    			<tr>
    				<th>NO.</th>
    				<th>제목</th>
    				<th>작성일</th>
    				<th>게시상태</th>
    			</tr>
    			<c:forEach items="${notilist }" var="fdto" varStatus="no">
	    			<tr>
	    				<td>${no.index + 1}</td>
	    				<td><a href="/admin/noticeView?bno=${fdto.bno }">${fdto.btitle }</a></td>
	    				<td><fmt:formatDate value="${fdto.bdate}" pattern="yyyy-MM-dd"/></td>
	    				<td>
	    					<label class="switch">
								<input type="checkbox" class="toggleStatus"
								<c:if test="${fdto.status == '게시중'}">checked</c:if>
								data-bno="${fdto.bno}"
                    			data-status="${fdto.status}">
								<span class="slider"></span>
							</label>
							<span class="status-text">${fdto.status }</span>
	    				</td>
	    			</tr>
    			</c:forEach>
    		</table>
    	</div>
    </div>
  </div>

</body>
</html>