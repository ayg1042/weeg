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
  <title>WEVERSEGG_NOTICE</title>
</head>

<body>

  <div id="admin_container">
  <%@ include file="gnb.jsp" %>
    <div id="admin_content">
	    <h2>공지사항 작성</h2>
	    
        <!-- 글작성 -->
	    <c:if test="${empty notimodi }">
		    <form action="/admin/noticeWrite" method="post" name="noticeFrm" enctype="multipart/form-data" class="noticeWriteFrm">
			    <table class="noticeWriteTable">
			        <tr>
			          <th class="info_txt">제목</th>
			          <td class="td_title">
			           	<input type="text" id="inputTitle" name="notiTitle" placeholder="제목을 입력하세요." >
			          </td>
			        </tr>
			        <tr>
				       	<th class="info_txt">내용</th>
				       	<td>
						   <textarea rows="10" cols="50" name="notiContent"></textarea>
						</td>
			   		</tr>
			   		<tr>
			          <th class="info_txt">파일첨부</th>
			          <td>
			            <input type="file" name="file" id="file">
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
				  location.href="/admin/notice";
			  }
			  
			  function SaveBtn(){
				  if(confirm("게시글을 저장하시겠습니까?")) {
					  noticeFrm.submit();
			  	}
			  }
		  </script>
	    </c:if>
	    
	    <!-- 글수정 -->
	    <c:if test="${not empty notimodi }">
	    	<form action="/admin/noticeModify" method="post" name="noticeModiFrm" enctype="multipart/form-data" class="noticeWriteFrm">
	    		<input type="hidden" name="bno" value="${notimodi.bno}">
			    <table class="noticeWriteTable">
			        <tr>
			          <th class="info_txt">제목</th>
			          <td class="td_title">
			           	<input type="text" id="inputTitle" name="notiTitle" value="${notimodi.btitle }" >
			          </td>
			        </tr>
			        <tr>
				       	<th class="info_txt">내용</th>
				       	<td>
						   <textarea rows="10" cols="50" name="notiContent">${notimodi.bcontent }</textarea>
						</td>
			   		</tr>
			   		<tr>
			          <th class="info_txt">파일첨부</th>
			          <td>
			            <input type="file" name="file" id="file">
			            <c:if test="${notimodi.bfile != null}">
		                    <img src="../images/notice/${notimodi.bfile}">
		                </c:if>
		                <c:if test="${notimodi.bfile == null}">
		                </c:if>
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
				  location.href=`/admin/noticeView?bno=`+${notimodi.bno};
			  }
			  
			  function SaveBtn(){
				  if(confirm("수정 내용을 저장하시겠습니까?")) {
					  noticeModiFrm.submit();
			  	}
			  }
		    </script>
	    </c:if>
	    
	    
    </div>
   </div>

</body>

</html>