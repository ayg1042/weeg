<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin_boardView.css"/>
  <title>admin</title>
</head>

<body>
	<div id="admin_container">
  	<%@ include file="gnb.jsp" %>
  	<div id="admin_content">
   		<h2>공지사항 상세보기</h2>
   		<div class="noticeTableArea">
   			<table class="viewBoard">
   				<tr>
   					<th>공지사항 제목 부분, 공지사항 제목 부분 입니다.</th>
   				</tr>
   				<tr class="viewDate">
   					<td>2025-03-11</td>
   				</tr>
   				<tr class="viewContent">
   					<td>
   					어쩌구 저쩌구 어쩌구 저쩌구어쩌구 저쩌구 어쩌구 저쩌구어쩌구 저쩌구 어쩌구 저쩌구</br>
   					어쩌구 저쩌구 어쩌구 저쩌구어쩌구 저쩌구 어쩌구 저쩌구어쩌구 저쩌구 어쩌구 저쩌구</br>
   					어쩌구 저쩌구 어쩌구 저쩌구어쩌구 저쩌구 어쩌구 저쩌구어쩌구 저쩌구 어쩌구 저쩌구</br>
   					어쩌구 저쩌구 어쩌구 저쩌구어쩌구 저쩌구 어쩌구 저쩌구어쩌구 저쩌구 어쩌구 저쩌구</br>
   					</td>
   				</tr>
   				
   			</table>
  		</div>
 		</div>
	</div>
</body>

</html>