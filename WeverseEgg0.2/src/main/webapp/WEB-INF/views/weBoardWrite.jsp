<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/mainpage.css" />
  <link rel="stylesheet" type="text/css" href="css/header.css" />
  <link rel="stylesheet" type="text/css" href="css/weBoardWrite.css" />
  <title>WEVERSEGG_NOTICE</title>
</head>

<body>
  <!-- 메인 -->
  <div id="egg_writepage">
    <%@ include file="egg_gnb.jsp"%>

  <!-- 공지사항 -->
  <div id="notice_banner">
    <img src="../images/weNotice/top_img2.png">
  </div>

  <div id="notice_container">
    <div class="notice_title">
      <div class="title_between" style="justify-content: space-between; display: flex;">
        <div class="title_txt">게시글 작성</div>
      </div>
    </div>

		<form action="/weBoardWrite" name="writeFrm" method="post" enctype="multipart/form-data"> 
    <table>
      <tbody>
        <tr>
        	<th class="info_txt">제목</th>
          <td class="td_title">
            <div class="info_title">
           		<input type="text" id="inputTitle" name="btitle" placeholder="제목을 입력하세요." style="width:800px">
            </div>
          </td>
        </tr>
        <tr>
	       	<th class="info_txt">내용</th>
	       	<td>
			    	<textarea id="txtarea" rows="10" cols="50" placeholder="내용을 입력하세요." name="bcontent"></textarea>
			    </td>
   			</tr>
   			<tr>
          <th class="info_txt">파일첨부</th>
          <td>
            <input type="file" name="files" id="file" onchange="readUrl(this);" style="width:800px">
          </td>
        </tr>
        <tr>
        	<th class="info_txt">미리보기</th>
          <td class="img_preview">
          	<img id="preview" style="width: 100px"/>
          </td>
        </tr>
      </tbody>
    </table>
    </form>
    <div class="btnArea">
    	<button onclick="CancleBtn()" >취소	</button>
    	<button onclick="SaveBtn()" >저장</button>
    </div> <!-- info_area -->
  </div> <!-- notice_container -->
  </div>
  <script>
		//스크롤시 헤더 색상변경
	  window.addEventListener("scroll", function () {
		    let gnb = document.getElementById("main_top_gnb");
		    if (window.scrollY > 50) {  // 스크롤 50px 이상일 때 배경 변경
		        gnb.classList.add("scrolled");
		    } else {
		        gnb.classList.remove("scrolled");
		    }
		});
	  
	  function CancleBtn(){
		  location.href="/weBoard";
	  }
	  
	  /* function SaveBtn(){
		  if(confirm("게시글을 저장하시겠습니까?")) {
	    	location.href="/weBoard";
	  	}
	  } */
	  
	  function SaveBtn() {
		    if (!confirm("게시글을 저장하시겠습니까?")) {
		        return;
		    }

		    let formData = new FormData(document.writeFrm); // 폼 데이터 수집

		    $.ajax({
		        url: "/weBoardWrite",
		        type: "POST",
		        data: formData,
		        processData: false,  // 필수: 파일 업로드 시 false로 설정
		        contentType: false,  // 필수: multipart/form-data 설정
		        success: function (response) {
		            alert("게시글이 저장되었습니다.");
		            window.location.href = "/weBoard"; // 성공 후 페이지 이동
		        },
		        error: function (xhr, status, error) {
		            console.error(xhr.responseText);
		            alert("게시글 저장에 실패했습니다.");
		        }
		    });
		}
	  
	  const readUrl = (input) =>{
			if(input.files && input.files[0]){ // 파일이름이 있으면..
					var reader = new FileReader(); // 파일 읽기 객체
					reader.onload = function(e){
						document.getElementById("preview").src = e.target.result;
						/* $("#preview").src = e.target.result; */
					}
					reader.readAsDataURL(input.files[0]);
				}else{
					document.getElementById("preview").src = "";
				}
		}
  </script>

</body>

</html>