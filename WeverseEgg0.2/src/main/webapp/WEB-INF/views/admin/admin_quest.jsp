<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../css/admin/admin_quest.css" />
<link rel="stylesheet" type="text/css"
	href="../css/admin/admin_main.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/admin.css" />
<title>퀘스트관리</title>
</head>
<body>
	<div id="admin_quest_main">

		<%@ include file="gnb.jsp"%>

		<div id="quest_container">
			<h2>퀘스트 관리</h2>
			<div class="questTableArea">
			  📢 각 칸을 클릭하여 내용을 수정하세요. 변경 사항을 저장하려면 "저장" 버튼을 눌러주세요.<br/>
			  ✅  퀘스트 ID 1~4번은 일일 퀘스트, 5~8번은 이벤트 퀘스트로 구성됩니다.
				<table class="questTable">
					<thead>
						<tr>
							<th>퀘스트 ID</th>
							<th>퀘스트 제목</th>
							<th>퀘스트 내용</th>
							<th>보상 유닛</th>
							<th>저장</th>
						</tr>
					</thead>
					<tbody>
						<!-- JavaScript로 동적으로 추가될 부분 -->
					</tbody>
				</table>
			</div>
			<button class="addqbtn" onclick="addQuest()">퀘스트 추가</button>
		</div>
	</div>

	<script src="/js/admin_quest.js"></script>
</body>
</html>