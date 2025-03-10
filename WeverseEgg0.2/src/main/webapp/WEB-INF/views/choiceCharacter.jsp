<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="kor">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/header.css"/>
  <link rel="stylesheet" type="text/css" href="../css/choiceCharacter.css"/>
  <title>캐릭터 선택</title>
  
  <script>
    function choiceBtn(isListNull){
    	if(isListNull){
          // list가 null이 아닌 경우
          if(confirm("해당 캐릭터로 게임을 시작하시겠습니까?")) {
        	  location.href="/modal";
          }
      } else {
          // list가 null일 경우
          if(confirm("캐릭터를 생성하시겠습니까?")) {
              location.href="/startStory";
          }
      }
    }
    
    function lockBtn(isListNull){
			if(confirm("캐릭터 슬롯창이 잠겨있습니다.\n30젤리를 사용하여 슬롯을 구매하시겠습니까?\n(* 확인을 누르면 바로 결제가 진행되니 신중히 눌러주세요!)")){
				if(${jelly>=30})
				alert("구매가 완료되었습니다.");
				var div = document.querySelector('.Idollock');
	            div.className = 'Idolmake';
			}else{
				alert("젤리 부족\n젤리샵으로 이동합니다.")
				location.href="/jellyshop";
			}
    }
    </script>
  </head>
  
<body>
<%@ include file="header.jsp" %>

  <div id="mainBack">
    <h2 id="ChoiceIdol">아이돌 선택</h2>
    <div id="IdolSelectArea">
    <c:if test="${list != null}">
	    <c:forEach items="${list}" var="cdto">
		    <div class="Idolopen" onclick="choiceBtn(true)">${cdto.nickName }</div>
	  	  <div class="Idollock" onclick="lockBtn()"></div>
	    	<div class="Idollock" onclick="lockBtn()"></div>
	    </c:forEach>
    </c:if>
    <c:if test="${list == null}">
		    <div class="Idolmake" onclick="choiceBtn(false)"></div>
	  	  <div class="Idollock" onclick="lockBtn()"></div>
	    	<div class="Idollock" onclick="lockBtn()"></div>
    </c:if>
    </div>
  </div>  <!-- mainBack -->
  
</body>
</html>