<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin_memView.css"/>
  <title>admin</title>
  <script>
  $(function(){
		$("#memDeleteBtn").click(()=>{
			if(confirm("회원번호 "+${member.user_id}+" 번 회원을 삭제하시겠습니까?")){
				$.ajax({
					url:"/admin/memDelete",
					type:"POST",
					data:{"userId": ${member.user_id}},
					success: function(data){
						alert(data);
						location.href = "/admin/main"
					},
					error: function(){
						alert("회원삭제에 실패했습니다. 회원이 생성한 캐릭터가 있으면 캐릭터 삭제 후에 다시 시도하세요.");
					}
				})// ajax
			}
		})//회원삭제버튼 
  });// jquery
  </script>
</head>

<body>
	<div id="admin_container">
  	<%@ include file="gnb.jsp" %>
  	<div id="admin_content">
   		<h2>회원정보 상세보기</h2>
   		<div class="memViewTableArea">
   			<h3>회원정보</h3>
   			<form action="#" name="memUpdateFrm" method="post">
	   			<table class="viewMem">
	   				<colgroup>
	   					<col style="width:15%;">
	   					<col style="width:*;">
	   				</colgroup>
	   				<tr>
	   					<th>회원번호</th>
	   					<td><input value="${member.user_id}" readonly></td>
	   				</tr>
	   				<tr>
	   					<th>이메일</th>
	   					<td><input value="${member.email}" readonly></td>
	   				</tr>
	   				<tr>
	   					<th>닉네임</th>
	   					<td><input value="${member.nickname}" readonly></td>
	   				</tr>
	   				<tr>
	   					<th>보유 젤리</th>
	   					<td><input value="${member.jelly}" readonly></td>
	   				</tr>
	   			</table>
   			</form>
				<button type="button" id="memDeleteBtn" >회원 삭제</button>
   			<h3>회원 캐릭터 정보  (${chListSize}개 캐릭터 보유 중)</h3>
			  <div class="charaViewArea">
			  <!-- 반복 -->
			  <c:if test="${chListSize != 0}">
				  <c:forEach items="${chList}" var="chDto">
				  	<div class="chara_view">
			   			<form action="#" name="characterUpdateFrm" method="post">
				   			<table class="viewCharacter">
				   				<colgroup>
				   					<col style="width:40%;">
				   					<col style="width:*;">
				   				</colgroup>
				   				<tr>
				   					<th>캐릭터 고유번호</th>
				   					<td><input value="${chDto.character_id}" readonly></td>
				   				</tr>
				   				<tr>
				   					<th>캐릭터 닉네임</th>
				   					<td><input value="${chDto.nickName}" readonly></td>
				   				</tr>
				   				<tr>
				   					<th>아티스트</th>
				   					<td><input value="${chDto.artist.artistName.artistName}" readonly></td>
				   				</tr>
				   				<tr>
				   					<th>보유코인</th>
				   					<td><input value="${chDto.coin}" readonly></td>
				   				</tr>
				   			</table>
			   			</form>
							<button type="button">캐릭터 삭제</button>	   					
				  	</div>
				  </c:forEach>
			  </c:if>
			  <!-- 반복 -->
			  <c:if test="${chListSize == 0}">
			  	<div class="chara_view">
			   			<form action="#" name="characterUpdateFrm" method="post">
				   			<table class="viewCharacter">
				   				<tr>
				   					<th>사용자가 생성한 캐릭터가 없습니다.</th>
				   				</tr>
				   			</table>
			   			</form>
				  	</div>
			  </c:if>
			  	</div>
			  </div>				
  		</div>
 		</div>
	</div>
</body>

</html>