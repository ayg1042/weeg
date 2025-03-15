<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div id="admin_gnb">
  <div class="gnb_logo">
    <a href="/admin"><img src="../images/mainpage/main_egg.png" alt=""></a>
  </div>
  <div class="gnb_list">
  	<p>${sessionScope.session_admin.nickname}</p>
  	<button type="button" onclick="location.href='/admin/logout'" class="outBtn">로그아웃</button>
    <ul>
      <li class="active"><a href="/admin/main" >회원 정보</a></li>
      <li class="board_toggle">게시판 관리</li>
      <li class="board_sub"><a href="/admin/notice">공지사항</a></li>
      <li class="board_sub"><a href="/admin/board">자유게시판</a></li>
      <li class="board_sub"><a href="/admin/board">하위 메뉴 3</a></li>
      <li><a href="/admin/items" >아이템 관리</a></li>
      <li><a href="/admin/training" >트레이닝 관리</a></li>
      <li><a href="/admin/event" >이벤트 관리</a></li>
      <li><a href="/admin/admin_quest" >퀘스트 관리</a></li>
      <li><a href="/admin/artist" >아이돌 관리</a></li>
    </ul>
  </div>
</div>
<script>
$(document).ready(function(){
    $(".board_toggle").click(function(event){
    	$(".board_sub").toggleClass("open");
    });
});

</script>