<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- <script src="/js/admin_itemAdd.js"></script> -->
  <link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin_memView.css"/>
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
			<h2>아이템 추가</h2>
   		<div class="memViewTableArea">
				<h3>아이템 정보 추가</h3>
   			<div class="data_input_from">
				<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="item-type">아이템 타입</label></td>
		            <td>
		                <select name="item-type" id="item-type">
		                    	<option>선택</option>
		                    <c:forEach items="${itemTypeList}" var="dto" varStatus="i">
		                    	<option>선택</option>
			                    <option value="${dto.itemTypeId}">
			                    	<c:if test="${dto.itemType == 1}">모자</c:if>
			                    	<c:if test="${dto.itemType == 2}">의상</c:if>
			                    	<c:if test="${dto.itemType == 3}">펫</c:if>
			                    	<c:if test="${dto.itemType == 4}">소모품</c:if>
			                    	<c:if test="${dto.itemType == 5}">이벤트</c:if>
			                    	<c:if test="${dto.itemType == 6}">화분</c:if>
			                    	<c:if test="${dto.itemType == 7}">소파</c:if>
			                    	<c:if test="${dto.itemType == 8}">카펫</c:if>
			                    	<c:if test="${dto.itemType == 9}">서랍</c:if>
			                    	<c:if test="${dto.itemType == 10}">액자</c:if>
			                    </option>
		                	</c:forEach>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td><label for="charm">매력도</label></td>
		            <td><input type="text" name="charm" id="charm"></td>
		        </tr>
		        <tr>
		            <td><label for="dance">댄스</label></td>
		            <td><input type="text" name="dance" id="dance"></td>
		        </tr>
		        <tr>
		            <td><label for="rap">랩</label></td>
		            <td><input type="text" name="rap" id="rap"></td>
		        </tr>
		        <tr>
		            <td><label for="vocal">보컬</label></td>
		            <td><input type="text" name="vocal" id="vocal"></td>
		        </tr>
		        <tr>
		            <td><label for="entertainment">예능</label></td>
		            <td><input type="text" name="entertainment" id="entertainment"></td>
		        </tr>
		        <tr>
		            <td><label for="fatigue_recovery">소모품<br>(피로 회복량)</label></td>
		            <td><input type="text" name="fatigue_recovery" id="fatigue_recovery"></td>
		        </tr>
		    </table>
		    <button id="item_info_save">저장하기</button>
		</form>
    </div>
    <div class="data_input_from">
		<h3>아이템 추가</h3>
		<form enctype="multipart/form-data">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="item-info">아이템 정보</label></td>
		            <td>
		                <select name="item-info" id="item-info">
		                	<c:forEach items="${itemInfoList}" var="dto">
		                    	<option value="${dto.itemType.itemTypeId}_${dto.itemInfoId}">
		                    	<c:if test="${dto.itemType.itemTypeId == 1}">
		                    	모자, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 2}">
		                    	의상, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 3}">
		                    	펫, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 4}">
		                    	소모품, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 5}">
		                    	이벤트, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 6}">
		                    	화분, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 7}">
		                    	소파, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 8}">
		                    	카펫, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 9}">
		                    	서랍, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 10}">
		                    	액자, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	</option>
		                	</c:forEach>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td><label for="item_name">이름</label></td>
		            <td><input type="text" name="item_name" id="item_name"></td>
		        </tr>
		        <tr>
		            <td><label for="price">가격</label></td>
		            <td><input type="text" name="price" id="price"></td>
		        </tr>
		        <tr>
		            <td><label for="img">이미지</label></td>
		            <td><input type="file" name="img" id="img"></td>
		        </tr>
		    </table>
		    <button id="item_save">저장하기</button>
		</form>
    </div>
    <div class="data_input_from">
		<h2>아이템 수정</h2>
		<hr>
		<h3>아이템 정보 수정</h3>
		<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="update_item-type">아이템 정보</label></td>
		            <td>
		                <select name="update_item-info" id="update_item-info">
		                	<option>선택</option>
		                	<c:forEach items="${itemInfoList}" var="dto">
		                    	<option value="${dto.itemType.itemTypeId}_${dto.itemInfoId}">
		                    	<c:if test="${dto.itemType.itemTypeId == 1}">
		                    	모자, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 2}">
		                    	의상, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 3}">
		                    	펫, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 4}">
		                    	소모품, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 5}">
		                    	이벤트, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 6}">
		                    	화분, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 7}">
		                    	소파, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 8}">
		                    	카펫, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 9}">
		                    	서랍, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	<c:if test="${dto.itemType.itemTypeId == 10}">
		                    	액자, 회복 : ${dto.fatigueRecovery}, 매력도 : ${dto.charm}, 댄스 : ${dto.dance}, 보컬 : ${dto.vocal}, 랩 : ${dto.rap}, 예능 : ${dto.entertainment}
		                    	</c:if>
		                    	</option>
		                	</c:forEach>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td><label for="update_charm">매력도</label></td>
		            <td><input type="text" name="update_charm" id="update_charm"></td>
		        </tr>
		        <tr>
		            <td><label for="update_dance">댄스</label></td>
		            <td><input type="text" name="update_dance" id="update_dance"></td>
		        </tr>
		        <tr>
		            <td><label for="update_rap">랩</label></td>
		            <td><input type="text" name="update_rap" id="update_rap"></td>
		        </tr>
		        <tr>
		            <td><label for="update_vocal">보컬</label></td>
		            <td><input type="text" name="update_vocal" id="update_vocal"></td>
		        </tr>
		        <tr>
		            <td><label for="update_entertainment">예능</label></td>
		            <td><input type="text" name="update_entertainment" id="update_entertainment"></td>
		        </tr>
		        <tr>
		            <td><label for="update_fatigue_recovery">소모품<br>(피로 회복량)</label></td>
		            <td><input type="text" name="update_fatigue_recovery" id="update_fatigue_recovery"></td>
		        </tr>
		    </table>
		    <button id="update_item_info_save">수정하기</button>
		</form>
    </div>
    </div>
	</div>
</body>

</html>