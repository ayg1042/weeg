<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin_boardView.css"/>
  <title>admin</title>
  <script>
  	function delBtn() {
  		if(confirm("삭제하시겠습니까?")){
  			location.href="/admin/deleteFeed?bno=${fdto.bno}";
  		}
  	}
  </script>
</head>

<body>
	<div id="admin_container">
  	<%@ include file="gnb.jsp" %>
	  	<div id="admin_content">
	   		<h2>이벤트 상세보기</h2>
	   		<div class="noticeTableArea">
	   			<table class="viewBoard">
	   				<tr>
	   					<th>${fdto.btitle }</th>
	   				</tr>
	   				<tr class="viewDate">
	   					<td><fmt:formatDate value="${fdto.bdate}" pattern="yyyy-MM-dd"/></td>
	   				</tr>
	   				<tr class="viewContent">
	   					<td>
	   					${fdto.bcontent }<br/>
	   					<c:if test="${fdto.bfile != null }"><img src="../images/event/${fdto.bfile}"></c:if>
	   					<c:if test="${fdto.bfile_banner != null }">
	   						<hr/>
	   						EGG MAIN - 배너 이미지<br/><br/>
	   						<img src="../images/event/${fdto.bfile_banner}">
	   					</c:if>
	   					<c:if test="${fdto.bfile_modal != null }">
	   						<hr/>
	   						EGG MAIN - 모달 이벤트창 이미지<br/><br/>
	   						<img src="../images/event/${fdto.bfile_modal}">
	   					</c:if>
	   					</td>
	   				</tr>
	   			</table>
	  		</div>
	  		<div class="noticeButtonArea">
	  			<button type="button" onclick="location.href='/admin/event'">목록</button>
	  			<button type="button" onclick="location.href='/admin/eventModify?bno=${fdto.bno}'">수정</button>
	  			<button type="button" onclick="delBtn()">삭제</button>
	  		</div>
 		</div>
	</div>
</body>

</html>