<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
<link rel="stylesheet" type="text/css" href="../css/admin/admin_board.css"/>
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
	<div id="admin_container">
    <%@ include file="gnb.jsp" %>
    
    <div id="admin_content">
    	<h2>이벤트 관리</h2>
    	<div class="noticeTableArea">
	    	<button class="writeBtn" onclick="location.href='/admin/eventWrite'">글쓰기</button>
    		<table class="noticeTable">
    			<colgroup>
		        <col style="width: 10%;">
		        <col style="width: *;">
		        <col style="width: 25%;">
		        <col style="width: 10%;">
		        <col style="width: 10%;">
		        <col style="width: 10%;">
		        <col style="width: 20%;">
	    		</colgroup>
    			<tr>
    				<th>NO.</th>
    				<th>제목</th>
    				<th>작성일</th>
    				<th>이미지<br/>(notice)</th>
    				<th>이미지<br/>(banner)</th>
    				<th>이미지<br/>(modal)</th>
    				<th>게시상태</th>
    			</tr>
    			<c:forEach items="${notilist }" var="fdto" varStatus="no">
	    			<tr>
	    				<td>${no.index + 1}</td>
	    				<td><a href="/admin/eventView?bno=${fdto.bno }">${fdto.btitle }</a></td>
	    				<td><fmt:formatDate value="${fdto.bdate}" pattern="yyyy-MM-dd"/></td>
	    				<td>
	    					<c:if test="${fdto.bfile != null }">O</c:if>
	    					<c:if test="${fdto.bfile == null }">X</c:if>
	    				</td>
	    				<td>
	    					<c:if test="${fdto.bfile_banner != null }">O</c:if>
	    					<c:if test="${fdto.bfile_banner == null }">X</c:if>
	    				</td>
	    				<td>
	    					<c:if test="${fdto.bfile_modal != null }">O</c:if>
	    					<c:if test="${fdto.bfile_modal == null }">X</c:if>
	    				</td>
	    				<td>
	    					<label class="switch">
								<input type="checkbox" class="toggleStatus"
								<c:if test="${fdto.status == '게시중'}">checked</c:if>
								data-bno="${fdto.bno}"
                    			data-status="${fdto.status}">
								<span class="slider"></span>
							</label>
							<span class="status-text">${fdto.status }</span>
	    				</td>
	    			</tr>
    			</c:forEach>
    		</table>
    	</div>
    </div>
  </div>
  <script>
    document.querySelectorAll('.toggleStatus').forEach(function (checkbox) {
        checkbox.addEventListener('change', function () {
            const bno = this.getAttribute('data-bno');
            let status = this.getAttribute('data-status');
            const newStatus = this.checked ? 1 : 0;
            
            // 상태를 숫자로 변환
            if (newStatus === 1) {
                status = '게시중';  // 상태를 '게시중'으로
            } else {
                status = '게시안함';  // 상태를 '게시안함'으로
            }

            // 상태 텍스트를 화면에 즉시 반영
            const statusTextElement = this.closest('td').querySelector('.status-text');
            if (statusTextElement) {
                statusTextElement.textContent = status;  // 상태 텍스트 업데이트
            }

            // AJAX로 상태 업데이트
            fetch(`/admin/updateStatus?bno=`+bno+`&status=`+newStatus, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ bno: bno, status: status })
            })
            .then(response => {
                if (!response.ok) {
                    console.log(response)
                    alert('상태 업데이트 실패');
                    // 상태를 원래대로 복구
                    this.checked = !this.checked;
                    if (statusTextElement) {
                        statusTextElement.textContent = this.checked ? '게시중' : '게시안함';
                    }
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('에러 발생');
                // 상태를 원래대로 복구
                this.checked = !this.checked;
                if (statusTextElement) {
                    statusTextElement.textContent = this.checked ? '게시중' : '게시안함';
                }
            });
        });
    });
  </script>

</body>
</html>