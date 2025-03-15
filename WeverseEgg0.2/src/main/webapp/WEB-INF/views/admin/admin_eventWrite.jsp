<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin.css"/>
  <link rel="stylesheet" type="text/css" href="../css/admin/admin_notiWrite.css" />
  <title>WEVERSEGG_EVENT</title>
</head>

<body>

  <div id="admin_container">
  <%@ include file="gnb.jsp" %>
    <div id="admin_content">
	    <h2>이벤트 작성</h2>
	    
        <!-- 글작성 -->
	    <c:if test="${empty eventmodi }">
		    <form action="/admin/eventWrite" method="post" name="eventFrm" enctype="multipart/form-data" class="noticeWriteFrm">
			    <table class="noticeWriteTable">
			        <tr>
			          <th class="info_txt">제목</th>
			          <td class="td_title">
			           	<input type="text" id="inputTitle" name="eventTitle" placeholder="제목을 입력하세요." >
			          </td>
			        </tr>
			        <tr>
				       	<th class="info_txt">내용</th>
				       	<td>
						   <textarea rows="10" cols="50" name="eventContent"></textarea>
						</td>
			   		</tr>
			   		<tr>
			          <th class="info_txt">파일첨부 (notice)</th>
			          <td>
			            <input type="file" name="file" id="file" class="file">
			          </td>
			        </tr>
			   		<tr>
			          <th class="info_txt">파일첨부 (banner)</th>
			          <td>
			            <input type="file" name="file_banner" id="file_banner" class="file">
			          </td>
			        </tr>
			   		<tr>
			          <th class="info_txt">파일첨부 (modal)</th>
			          <td>
			            <input type="file" name="file_modal" id="file_modal" class="file">
			          </td>
			        </tr>
			    </table>
			    <div class="btnArea">
			    	<button type="button" onclick="CancleBtn()" >취소</button>
			    	<button type="button" onclick="SaveBtn()" >저장</button>
			    </div> <!-- info_area -->
		     </form>
		     <script>
			  function CancleBtn(){
				  location.href="/admin/event";
			  }
			  
			  function SaveBtn(){
				  if(confirm("게시글을 저장하시겠습니까?")) {
					  eventFrm.submit();
			  	}
			  }
		  </script>
	    </c:if>
	    
		<!-- 글수정 -->
	    <c:if test="${not empty eventmodi }">
	    	<form action="/admin/eventModify" method="post" name="eventModiFrm" enctype="multipart/form-data" class="noticeWriteFrm">
	    	<input type="hidden" name="bno" value="${eventmodi.bno}">
			    <table class="noticeWriteTable">
			        <tr>
			          <th class="info_txt">제목</th>
			          <td class="td_title">
			           	<input type="text" id="inputTitle" name="eventTitle"  value="${eventmodi.btitle }" >
			          </td>
			        </tr>
			        <tr>
				       	<th class="info_txt">내용</th>
				       	<td>
						   <textarea rows="10" cols="50" name="eventContent">${eventmodi.btitle }</textarea>
						</td>
			   		</tr>
			   		
			   		<!-- 파일첨부 (notice) -->
				    <tr>
				      <th class="info_txt">파일첨부 (notice)</th>
				      <td>
				        <c:choose>
				          <c:when test="${not empty eventmodi.bfile}">
				            <!-- 기존 이미지 미리보기 -->
				            <div id="preview_notice">
				              <p>기존 파일: ${eventmodi.bfile}</p>
				              <img src="/images/event/${eventmodi.bfile}" style="max-width: 200px;" />
				              <button type="button" onclick="removeFile('notice')">파일 삭제</button>
				              <input type="hidden" name="deleteFile_notice" id="deleteFile_notice" value="false">
				            </div>
				            <!-- 새 파일 업로드 영역 (숨겨져 있다가 삭제 버튼 누르면 나타남) -->
				            <div id="upload_notice" style="display: none;">
				              <input type="file" name="file" class="file">
				            </div>
				          </c:when>
				          <c:otherwise>
				            <input type="file" name="file" class="file">
				          </c:otherwise>
				        </c:choose>
				      </td>
				    </tr>
				    
			   		<!-- 파일첨부 (banner) -->
				    <tr>
				      <th class="info_txt">파일첨부 (banner)</th>
				      <td>
				        <c:choose>
				          <c:when test="${not empty eventmodi.bfile_banner}">
				            <!-- 기존 이미지 미리보기 -->
				            <div id="preview_banner">
				              <p>기존 파일: ${eventmodi.bfile_banner}</p>
				              <img src="/images/event/${eventmodi.bfile_banner}" style="max-width: 200px;" />
				              <button type="button" onclick="removeFile('banner')">파일 삭제</button>
				              <input type="hidden" name="deleteFile_banner" id="deleteFile_banner" value="false">
				            </div>
				            <!-- 새 파일 업로드 영역 (숨겨져 있다가 삭제 버튼 누르면 나타남) -->
				            <div id="upload_banner" style="display: none;">
				              <input type="file" name="file_banner" class="file">
				            </div>
				          </c:when>
				          <c:otherwise>
				            <input type="file" name="file_banner" class="file">
				          </c:otherwise>
				        </c:choose>
				      </td>
				    </tr>
				    
			   		<!-- 파일첨부 (modal) -->
				    <tr>
				      <th class="info_txt">파일첨부 (modal)</th>
				      <td>
				        <c:choose>
				          <c:when test="${not empty eventmodi.bfile_modal}">
				            <!-- 기존 이미지 미리보기 -->
				            <div id="preview_modal">
				              <p>기존 파일: ${eventmodi.bfile_modal}</p>
				              <img src="/images/event/${eventmodi.bfile_modal}" style="max-width: 200px;" />
				              <button type="button" onclick="removeFile('modal')">파일 삭제</button>
				              <input type="hidden" name="deleteFile_modal" id="deleteFile_modal" value="false">
				            </div>
				            <!-- 새 파일 업로드 영역 (숨겨져 있다가 삭제 버튼 누르면 나타남) -->
				            <div id="upload_modal" style="display: none;">
				              <input type="file" name="file_modal" class="file">
				            </div>
				          </c:when>
				          <c:otherwise>
				            <input type="file" name="file_modal" class="file">
				          </c:otherwise>
				        </c:choose>
				      </td>
				    </tr>
				    
				    
			    </table>
			    <div class="btnArea">
			    	<button type="button" onclick="CancleBtn()" >취소</button>
			    	<button type="button" onclick="SaveBtn()" >저장</button>
			    </div> <!-- info_area -->
		     </form>
		     <script>
		      function removeFile(type) {
				   document.getElementById('preview_' + type).style.display = 'none';
				   document.getElementById('upload_' + type).style.display = 'block';
				   
				   // 삭제 여부 전달
				   document.getElementById('deleteFile_' + type).value = 'true'; // 삭제 요청
		 	  }
			  function CancleBtn(){
				  location.href=`/admin/eventView?bno=`+${eventmodi.bno};
			  }
			  
			  function SaveBtn(){
				  if(confirm("수정 내용을 저장하시겠습니까?")) {
					  eventModiFrm.submit();
			  	}
			  }
		    </script> 
	    </c:if>
    </div>
   </div>
   <script>
	   
   </script>

</body>

</html>