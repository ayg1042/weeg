<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
<link rel="stylesheet" type="text/css" href="../css/admin/admin_items.css"/>
<title>Insert title here</title>

</head>
<body>
	<div id="admin_container">
    <%@ include file="gnb.jsp" %>
        
    <div id="admin_content">
    	<h2>아이템 관리</h2></br>
    	<a href="/admin/itemAdd">아이템 추가</a>
    	<div class="itemsTableArea">
    		<form action="/admin/items" id="filterForm" method="GET">
			    <label><input type="radio" name="category" value="0"
		       	  ${selectedCategories == null || selectedCategories.contains("0") ? "checked" : ""}> 전체</label>
			    <label><input type="radio" name="category" value="2"
			        ${selectedCategories != null && selectedCategories.contains("2") ? "checked" : ""}> 의상</label>
			    <label><input type="radio" name="category" value="1"
			        ${selectedCategories != null && selectedCategories.contains("1") ? "checked" : ""}> 모자</label>
			    <label><input type="radio" name="category" value="3"
			        ${selectedCategories != null && selectedCategories.contains("3") ? "checked" : ""}> 펫</label>
			    <label><input type="radio" name="category" value="6"
			        ${selectedCategories != null && selectedCategories.contains("6") ? "checked" : ""}> 인테리어</label>
			    <label><input type="radio" name="category" value="4"
			        ${selectedCategories != null && selectedCategories.contains("4") ? "checked" : ""}> 간식/기타</label>
				</form>
   			</br>

    		<table class="itemTable">
    			<colgroup>
		        <col style="width: 6%;">
		        <col style="width: 10%;">
		        <col style="width: *;">
		        <col style="width: 8%;">
		        <col style="width: 7%;">
		        <col style="width: 7%;">
		        <col style="width: 13%;">
		        <col style="width: 15%;">
		        <col style="width: 10%;">
	    		</colgroup>
    			<tr>
    				<th>번호</th>
    				<th>타입</th>
    				<th>이름</th>
    				<th>가격</th>
    				<th colspan="2">효과</th>
    				<th>판매일</th>
    				<th>이미지</th>
    				<th>삭제</th>
    			</tr>
    			<c:forEach items="${items}" var="items">
    			<tr class="item_cont">
    				<td>${items.itemId}</td>
    				<c:if test="${items.itemInfo.itemType.itemType == 1}">
    				<td>모자</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 2}">
    				<td>의상</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 3}">
    				<td>펫</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 4}">
    				<td>소모품</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 5}">
    				<td>이벤트</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 6}">
    				<td>인테리어_화분</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 7}">
    				<td>인테리어_소파</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 8}">
    				<td>인테리어_카펫</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 9}">
    				<td>인테리어_서랍</td>
    				</c:if>
    				<c:if test="${items.itemInfo.itemType.itemType == 10}">
    				<td>인테리어_액자</td>
    				</c:if>
    				<td>${items.name}</td>
    				<td>${items.price}</td>
    				<td>
    				보컬</br>
    				댄스</br>
    				랩</br>
    				예능</br>
    				매력도</br>
    				피로회복
    				</td>
    				<td>
    				+ ${items.itemInfo.vocal}</br>
    				+ ${items.itemInfo.dance}</br>
    				+ ${items.itemInfo.rap}</br>
    				+ ${items.itemInfo.entertainment}</br>
    				+ ${items.itemInfo.charm}</br>
    				+ ${items.itemInfo.fatigueRecovery}
    				</td>
    				<td>
    				판매시작 : ${items.itemInfo.startDate}</br>
    				판매종료 : ${items.itemInfo.endDate}
    				</td>
    				<td>
    					<img alt="" src="">
    				</td>
    				<td>
    					<button type="button">삭제</button>
    				</td>
    			</tr>
    			</c:forEach>
    			
    		</table>
    	</div>
    </div>
  </div>

</body>
<script>
	document.addEventListener("DOMContentLoaded", function () {
    const radios = document.querySelectorAll("input[name='category']");
    const form = document.getElementById("filterForm");

    radios.forEach(radio => {
        radio.addEventListener("change", function () {
            form.submit();
        });
    });
	});
</script>
</html>