<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="/js/admin_itemAdd.js"></script>
<link rel="stylesheet" type="text/css" href="../css/admin/admin_itemAdd.css"/>
  <script src="/js/admin0.2.js" defer></script>
  <title>admin</title>
  <script>
  $(function(){
  });// jquery
  </script>
</head>

<body>
	<div id="admin_container">
  	<%@ include file="gnb.jsp" %>
	  	<div id="admin_content">
				<h2>아티스트 관리_그룹 관리</h2>
	   		<div class="data_input_from">
				<div class="memViewTableArea">
				<h3>[그룹 추가]</h3>
				<form action="" method="post">
				    <table>
				        <colgroup>
				            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
				            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
				        </colgroup>
				        <tr>
				            <th><label for="group_name">그룹 이름</label></th>
				            <td><input type="text" name="group_name" id="group_name"></td>
				        </tr>
				        <tr>
				            <th><label for="group_member_count">맴버 수</label></th>
				            <td><input type="number" name="group_member_count" id="group_member_count"></td>
				        </tr>
				        <tr>
						    <th><label for="group_gender">성별</label></th>
						    <td>
						        <select name="group_gender" id="group_gender">
						            <option value="남자">남자</option>
						            <option value="여자">여자</option>
						            <option value="혼성">혼성</option>
						        </select>
						    </td>
						</tr>
				    </table>
				    <button id="add_group">추가하기</button>
				</form>
	    	</div>
			<div class="data_input_from">
				<h3>[그룹 수정]</h3>
				<form action="" method="post">
				    <table>
				        <colgroup>
				            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
				            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
				        </colgroup>
				        <tr>
				            <th><label for="group_update">그룹</label></th>
				            <td>
				                <select name="group_update" id="group_update">
				                    <option>선택</option>
				                    <c:forEach items="${groupList}" var="dto" varStatus="i">
					                    <option value="${dto.groupId}">${dto.groupId}, ${dto.groupName}, ${dto.gender}, ${dto.memberCount}명</option>
				                	</c:forEach>
				                </select>
				            </td>
				        </tr>
				        <tr>
				            <th><label for="update_group_name">그룹 이름</label></th>
				            <td><input type="text" name="update_group_name" id="update_group_name"></td>
				        </tr>
				        <tr>
				            <th><label for="update_group_member_count">맴버 수</label></th>
				            <td><input type="number" name="update_group_member_count" id="update_group_member_count"></td>
				        </tr>
				        <tr>
						    <th><label for="update_group_gender">성별</label></th>
						    <td>
						        <select name="update_group_gender" id="update_group_gender">
						            <option value="남자">남자</option>
						            <option value="여자">여자</option>
						            <option value="혼성">혼성</option>
						        </select>
						    </td>
						</tr>
				    </table>
				    <button id="update_group">수정하기</button>
				</form>
		    </div>
			<div class="data_input_from">
				<h3>[그룹 삭제]</h3>
				<form action="" method="post">
				    <table>
				        <colgroup>
				            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
				            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
				        </colgroup>
				        <tr>
				            <th><label for="group_delete">그룹</label></th>
				            <td>
				                <select name="group_delete" id="group_delete">
				                    <option>선택</option>
				                    <c:forEach items="${groupList}" var="dto" varStatus="i">
					                    <option value="${dto.groupId}">${dto.groupId}, ${dto.groupName}, ${dto.gender}, ${dto.memberCount}명</option>
				                	</c:forEach>
				                </select>
				            </td>
				        </tr>
				    </table>
				    <button id="delete_group">삭제하기</button>
				</form>
		    </div>
	    </div>
	    </div>
	</div>
</body>

</html>