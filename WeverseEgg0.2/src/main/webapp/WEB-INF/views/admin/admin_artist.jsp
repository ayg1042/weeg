<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/admin/admin_itemAdd.css"/>
<script src="/js/admin0.2.js" defer></script>
<title>Insert title here</title>
</head>
<body>
	<div id="admin_container">
	    <%@ include file="gnb.jsp" %>
	       
	    <div id="admin_content">
	   	<h2>아티스트 관리</h2></br>
	   	<a href="/admin/group">그룹 관리</a>
	    <div class="data_input_from">
			<div class="memViewTableArea">
			<h3>[아티스트 추가]</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <th><label for="artist_group">그룹</label></th>
			            <td>
			                <select name="artist_group" id="artist_group">
			                	<option>선택</option>
			                    <c:forEach items="${groupList}" var="dto" varStatus="i">
				                    <option value="${dto.groupId}">${dto.groupId}, ${dto.groupName}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <th><label for="artist_name">아티스트 이름</label></th>
			            <td><input type="text" name="artist_name" id="artist_name"></td>
			        </tr>
			    </table>
			    <button id="artist_save">저장하기</button>
			</form>
	    </div>
		<div class="data_input_from">
			<h3>[아티스트 수정]</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <th><label for="update_artist_group">그룹</label></th>
			            <td>
			                <select name="update_artist_group" id="update_artist_group">
			                    <option>선택</option>
			                    <c:forEach items="${artistList}" var="dto" varStatus="i">
				                    <option value="${dto.artistNId}">${dto.artistNId}, ${dto.group.groupName}, ${dto.artistName}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <th><label for="update_artist_name">아티스트 이름</label></th>
			            <td><input type="text" name="update_artist_name" id="update_artist_name"></td>
			        </tr>
			    </table>
			    <button id="update_artist_save">저장하기</button>
			</form>
	    </div>
		<div class="data_input_from">
			<h3>[아티스트 삭제]</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <th><label for="delete_artist_group">그룹</label></th>
			            <td>
			                <select name="delete_artist_group" id="delete_artist_group">
			                    <option>선택</option>
			                    <c:forEach items="${artistList}" var="dto" varStatus="i">
				                    <option value="${dto.artistNId}">${dto.artistNId}, ${dto.group.groupName}, ${dto.artistName}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			    </table>
			    <button id="delete_artist_save">삭제하기</button>
			</form>
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