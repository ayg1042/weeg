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
<link rel="stylesheet" type="text/css" href="../css/admin/admin_memView.css"/>
<script src="/js/admin0.2.js" defer></script>
<title>Insert title here</title>

</head>
<body>
	<div id="admin_container">
	    <%@ include file="gnb.jsp" %>
	       
	    <div id="admin_content">
	   	<h2>트레이닝 관리</h2></br>
	    <div class="data_input_from">
			<h2>연습 타입</h2>
			<hr>
			<h3>연습 타입 추가</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="practiceType">연습 타입 추가</label></td>
			            <td><input type="text" name="practiceType" id="practiceType"></td>
			        </tr>
			    </table>
			    <button id="practiceType_save">저장하기</button>
			</form>
	    </div>
		<div class="data_input_from">
			<h2>연습 타입</h2>
			<hr>
			<h3>연습 타입 삭제</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="delete_practiceType">연습 타입</label></td>
			            <td>
			                <select name="delete_practiceType" id="delete_practiceType">
			                    <option>선택</option>
			                    <c:forEach items="${practiceTypeList}" var="dto" varStatus="i">
				                    <option value="${dto.practiceTypeId}">${dto.practiceType}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			    </table>
			    <button id="delete_practiceType_save">삭제하기</button>
			</form>
	    </div>
		<div class="data_input_from">
			<h2>연습</h2>
			<hr>
			<h3>연습 추가</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="add_practice">연습 타입</label></td>
			            <td>
			                <select name="add_practice" id="add_practice">
			                    <option>선택</option>
			                    <c:forEach items="${practiceTypeList}" var="dto" varStatus="i">
				                    <option value="${dto.practiceTypeId}">${dto.practiceType}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <td><label for=add_price>비용</label></td>
			            <td><input type="text" name="add_price" id="add_price"></td>
			        </tr>
			        <tr>
			            <td><label for="add_health">체력</label></td>
			            <td><input type="text" name="add_health" id="add_health"></td>
			        </tr>
			        <tr>
			            <td><label for="add_fatigue">피로도</label></td>
			            <td><input type="text" name="add_fatigue" id="add_fatigue"></td>
			        </tr>
			    </table>
			    <button id="add_practice_save">저장하기</button>
			</form>
	    </div>
		<div class="data_input_from">
			<h2>연습</h2>
			<hr>
			<h3>연습 수정</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="update_practice">연습</label></td>
			            <td>
			                <select name="update_practice" id="update_practice">
			                    <option>선택</option>
			                    <c:forEach items="${practiceList}" var="dto" varStatus="i">
				                    <option value="${dto.practiceId}">${dto.practiceId}, ${dto.price}, ${dto.health}, ${dto.fatigue}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <td><label for=update_price>비용</label></td>
			            <td><input type="text" name="update_price" id="update_price"></td>
			        </tr>
			        <tr>
			            <td><label for="update_health">체력</label></td>
			            <td><input type="text" name="update_health" id="update_health"></td>
			        </tr>
			        <tr>
			            <td><label for="update_fatigue">피로도</label></td>
			            <td><input type="text" name="update_fatigue" id="update_fatigue"></td>
			        </tr>
			    </table>
			    <button id="update_practice_save">저장하기</button>
			</form>
	    </div>
		<div class="data_input_from">
			<h2>연습</h2>
			<hr>
			<h3>연습 삭제</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="delete_practice">연습</label></td>
			            <td>
			                <select name="delete_practice" id="delete_practice">
			                    <option>선택</option>
			                    <c:forEach items="${practiceList}" var="dto" varStatus="i">
				                    <option value="${dto.practiceId}">${dto.practiceId}, ${dto.price}, ${dto.health}, ${dto.fatigue}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			    </table>
			    <button id="delete_practice_save">삭제하기</button>
			</form>
	    </div>
	    
		<div class="data_input_from">
			<h2>춤</h2>
			<hr>
			<h3>춤 추가</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="add_dance">연습</label></td>
			            <td>
			                <select name="add_dance" id="add_dance">
			                    <option>선택</option>
			                    <c:forEach items="${practiceList}" var="dto" varStatus="i">
				                    <option value="${dto.practiceId}">${dto.practiceId}, ${dto.price}, ${dto.health}, ${dto.fatigue}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <td><label for=add_dance_name>연습 이름</label></td>
			            <td><input type="text" name="add_dance_name" id="add_dance_name"></td>
			        </tr>
			        <tr>
			            <td><label for="add_dance_point">점수</label></td>
			            <td><input type="text" name="add_dance_point" id="add_dance_point"></td>
			        </tr>
			    </table>
			    <button id="add_dance_save">추가하기</button>
			</form>
	    </div>
		<div class="data_input_from">
			<h2>춤</h2>
			<hr>
			<h3>춤 삭제</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="delete_dance">연습</label></td>
			            <td>
			                <select name="delete_dance" id="delete_dance">
			                    <option>선택</option>
			                    <c:forEach items="${DanceList}" var="dto" varStatus="i">
				                    <option value="${dto.danceId}">${dto.danceId}, ${dto.danceName}, ${dto.danceScore}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			    </table>
			    <button id="delete_dance_save">삭제하기</button>
			</form>
	    </div>
	    
	    <div class="data_input_from">
			<h2>보컬</h2>
			<hr>
			<h3>보컬 추가</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="add_vocal">연습</label></td>
			            <td>
			                <select name="add_vocal" id="add_vocal">
			                    <option>선택</option>
			                    <c:forEach items="${practiceList}" var="dto" varStatus="i">
				                    <option value="${dto.practiceId}">${dto.practiceId}, ${dto.price}, ${dto.health}, ${dto.fatigue}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <td><label for=add_vocal_name>연습 이름</label></td>
			            <td><input type="text" name="add_vocal_name" id="add_vocal_name"></td>
			        </tr>
			        <tr>
			            <td><label for="add_vocal_point">점수</label></td>
			            <td><input type="text" name="add_vocal_point" id="add_vocal_point"></td>
			        </tr>
			    </table>
			    <button id="add_vocal_save">추가하기</button>
			</form>
	    </div>
	    <div class="data_input_from">
			<h2>보컬</h2>
			<hr>
			<h3>보컬 삭제</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="delete_vocal">연습</label></td>
			            <td>
			                <select name="delete_vocal" id="delete_vocal">
			                    <option>선택</option>
			                    <c:forEach items="${VocalList}" var="dto" varStatus="i">
				                    <option value="${dto.vocalId}">${dto.vocalId}, ${dto.vocalName}, ${dto.vocalScore}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			    </table>
			    <button id="delete_vocal_save">삭제하기</button>
			</form>
	    </div>
	    
	    <div class="data_input_from">
			<h2>랩</h2>
			<hr>
			<h3>랩 추가</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="add_rap">연습</label></td>
			            <td>
			                <select name="add_rap" id="add_rap">
			                    <option>선택</option>
			                    <c:forEach items="${practiceList}" var="dto" varStatus="i">
				                    <option value="${dto.practiceId}">${dto.practiceId}, ${dto.price}, ${dto.health}, ${dto.fatigue}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <td><label for=add_rap_name>연습 이름</label></td>
			            <td><input type="text" name="add_rap_name" id="add_rap_name"></td>
			        </tr>
			        <tr>
			            <td><label for="add_rap_point">점수</label></td>
			            <td><input type="text" name="add_rap_point" id="add_rap_point"></td>
			        </tr>
			    </table>
			    <button id="add_rap_save">추가하기</button>
			</form>
	    </div>
	    <div class="data_input_from">
			<h2>랩</h2>
			<hr>
			<h3>랩 삭제</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="delete_rap">연습</label></td>
			            <td>
			                <select name="delete_rap" id="delete_rap">
			                    <option>선택</option>
			                    <c:forEach items="${RapList}" var="dto" varStatus="i">
				                    <option value="${dto.rapId}">${dto.rapId}, ${dto.rapName}, ${dto.rapScore}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			    </table>
			    <button id="delete_rap_save">삭제하기</button>
			</form>
	    </div>
	    
	    <div class="data_input_from">
			<h2>예능</h2>
			<hr>
			<h3>예능 추가</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="add_enter">연습</label></td>
			            <td>
			                <select name="add_enter" id="add_enter">
			                    <option>선택</option>
			                    <c:forEach items="${practiceList}" var="dto" varStatus="i">
				                    <option value="${dto.practiceId}">${dto.practiceId}, ${dto.price}, ${dto.health}, ${dto.fatigue}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <td><label for=add_enter_name>연습 이름</label></td>
			            <td><input type="text" name="add_enter_name" id="add_enter_name"></td>
			        </tr>
			        <tr>
			            <td><label for="add_enter_point">점수</label></td>
			            <td><input type="text" name="add_enter_point" id="add_enter_point"></td>
			        </tr>
			    </table>
			    <button id="add_enter_save">추가하기</button>
			</form>
	    </div>
	    <div class="data_input_from">
			<h2>예능</h2>
			<hr>
			<h3>예능 삭제</h3>
			<form action="" method="post">
			    <table>
			        <colgroup>
			            <col style="width: 30%;"> <!-- 첫 번째 열 (라벨) -->
			            <col style="width: 70%;"> <!-- 두 번째 열 (입력 필드) -->
			        </colgroup>
			        <tr>
			            <td><label for="delete_enter">연습</label></td>
			            <td>
			                <select name="delete_enter" id="delete_enter">
			                    <option>선택</option>
			                    <c:forEach items="${EnterList}" var="dto" varStatus="i">
				                    <option value="${dto.entertainmentId}">${dto.entertainmentId}, ${dto.entertainmentName}, ${dto.entertainmentScore}</option>
			                	</c:forEach>
			                </select>
			            </td>
			        </tr>
			    </table>
			    <button id="delete_enter_save">삭제하기</button>
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