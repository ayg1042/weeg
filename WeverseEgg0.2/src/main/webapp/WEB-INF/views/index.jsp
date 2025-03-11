<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전자시계</title>
    <!-- <script src="https://cdn.tailwindcss.com"></script>
    <script src="/js/Clock.js" defer></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
    <link rel="stylesheet" href="/css/admin.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/admin.js" defer></script>
    
</head>
<body>
<!-- <body class="flex flex-col items-center justify-center min-h-screen bg-gray-100"> -->
    <!-- 
    <div class="text-center">
        <h1 class="text-3xl font-bold mb-4">디지털 시계</h1>
        <div id="clock" class="text-5xl font-mono bg-white p-4 rounded-lg shadow-md">--:--:--</div>
    </div>
    
    <div class="mt-8 text-center">
        <h2 class="text-2xl font-bold mb-2">타이머</h2>
        <input id="timerInput" type="number" placeholder="초 입력" class="border p-2 rounded-md">
        <button id="startTimer" class="ml-2 bg-blue-500 text-white px-4 py-2 rounded-md">시작</button>
        <div id="timer" class="text-4xl font-mono bg-white p-4 mt-4 rounded-lg shadow-md">00:00</div>
    </div> -->
    
    <div class="data_input_from">
		<h2>아이템 추가</h2>
		<hr>
		<h3>아이템 정보 추가</h3>
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
		                    <c:forEach items="${itemTypeList}" var="dto" varStatus="i">
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
		<h2>아이템 추가</h2>
		<hr>
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

</body>
</html>