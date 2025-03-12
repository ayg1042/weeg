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
    <div class="data_input_from">
		<h2>아이템 삭제</h2>
		<hr>
		<h3>아이템</h3>
		<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="delete_item-type">아이템 정보</label></td>
		            <td>
		                <select name="delete_item-info" id="delete_item-info">
		                	<c:forEach items="${itemList}" var="dto">
		                    	<option value="${dto.itemId}">
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 1}">
		                    	모자 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 2}">
		                    	의상 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 3}">
		                    	펫 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 4}">
		                    	소모품 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 5}">
		                    	이벤트 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 6}">
		                    	화분 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 7}">
		                    	소파 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 8}">
		                    	카펫 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 9}">
		                    	서랍 - ${dto.name}
		                    	</c:if>
		                    	<c:if test="${dto.itemInfo.itemType.itemType == 10}">
		                    	액자 - ${dto.name}
		                    	</c:if>
		                    	</option>
		                	</c:forEach>
		                </select>
		            </td>
		        </tr>
		    </table>
		    <button id="delete_item_info_save">삭제하기</button>
		</form>
    </div>
	<div class="data_input_from">
		<h2>그룹</h2>
		<hr>
		<h3>그룹 추가</h3>
		<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="group_name">그룹 이름</label></td>
		            <td><input type="text" name="group_name" id="group_name"></td>
		        </tr>
		        <tr>
		            <td><label for="group_member_count">맴버 수</label></td>
		            <td><input type="number" name="group_member_count" id="group_member_count"></td>
		        </tr>
		        <tr>
				    <td><label for="group_gender">성별</label></td>
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
		<h2>그룹</h2>
		<hr>
		<h3>그룹 수정</h3>
		<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="group_update">그룹</label></td>
		            <td>
		                <select name="group_update" id="group_update">
		                    <c:forEach items="${groupList}" var="dto" varStatus="i">
			                    <option value="${dto.groupId}">${dto.groupId}, ${dto.groupName}, ${dto.gender}, ${dto.memberCount}명</option>
		                	</c:forEach>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td><label for="update_group_name">그룹 이름</label></td>
		            <td><input type="text" name="update_group_name" id="update_group_name"></td>
		        </tr>
		        <tr>
		            <td><label for="update_group_member_count">맴버 수</label></td>
		            <td><input type="number" name="update_group_member_count" id="update_group_member_count"></td>
		        </tr>
		        <tr>
				    <td><label for="update_group_gender">성별</label></td>
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
		<h2>그룹</h2>
		<hr>
		<h3>그룹 삭제</h3>
		<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="group_delete">그룹</label></td>
		            <td>
		                <select name="group_delete" id="group_delete">
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
	<div class="data_input_from">
		<h2>아티스트</h2>
		<hr>
		<h3>아티스트 추가</h3>
		<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="artist_group">그룹</label></td>
		            <td>
		                <select name="artist_group" id="artist_group">
		                    <c:forEach items="${groupList}" var="dto" varStatus="i">
			                    <option value="${dto.groupId}">${dto.groupId}, ${dto.groupName}</option>
		                	</c:forEach>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td><label for="artist_name">아티스트 이름</label></td>
		            <td><input type="text" name="artist_name" id="artist_name"></td>
		        </tr>
		    </table>
		    <button id="artist_save">저장하기</button>
		</form>
    </div>
	<div class="data_input_from">
		<h2>아티스트</h2>
		<hr>
		<h3>아티스트 수정</h3>
		<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="update_artist_group">그룹</label></td>
		            <td>
		                <select name="update_artist_group" id="update_artist_group">
		                    <c:forEach items="${artistList}" var="dto" varStatus="i">
			                    <option value="${dto.artistNId}">${dto.artistNId}, ${dto.group.groupName}, ${dto.artistName}</option>
		                	</c:forEach>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td><label for="update_artist_name">아티스트 이름</label></td>
		            <td><input type="text" name="update_artist_name" id="update_artist_name"></td>
		        </tr>
		    </table>
		    <button id="update_artist_save">저장하기</button>
		</form>
    </div>
	<div class="data_input_from">
		<h2>아티스트</h2>
		<hr>
		<h3>아티스트 삭제</h3>
		<form action="" method="post">
		    <table>
		        <colgroup>
		            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
		            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
		        </colgroup>
		        <tr>
		            <td><label for="delete_artist_group">그룹</label></td>
		            <td>
		                <select name="delete_artist_group" id="delete_artist_group">
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
</body>
</html>