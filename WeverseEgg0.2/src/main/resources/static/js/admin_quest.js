// 퀘스트 데이터를 담을 배열
let quests = [];

document.addEventListener('DOMContentLoaded', loadQuests);

function loadQuests() {
	console.log('loadQuests 함수 시작');  // 로드가 잘 되는지 확인

	// 백엔드에서 퀘스트 데이터를 가져옴
	fetch('/admin/admin_quest/list')
		.then(response => response.json()) // JSON으로 변환
		.then(data => {
			const tableBody = document.querySelector('.questTable tbody');
			tableBody.innerHTML = ''; // 기존 테이블 내용 지우기

			if (data.length === 0) {
				// 퀘스트가 없을 경우 안내 메시지 추가
				const row = document.createElement('tr');
				row.innerHTML = `
					<td colspan="5" style="text-align: center; font-weight: bold; color: gray;">
						퀘스트가 없습니다. 퀘스트 추가를 눌러서 퀘스트를 추가하세요.
					</td>
				`;
				tableBody.appendChild(row);
			} else {
				// 퀘스트가 있을 경우 테이블에 추가
				quests = data.sort((a, b) => a.questId - b.questId); // ID 기준 내림차순 정렬

				quests.forEach(quest => {
					const row = document.createElement('tr');
					row.setAttribute('data-id', quest.questId);
					row.innerHTML = `
						<td>${quest.questId}</td>
						<td contenteditable="true">${quest.title}</td>
						<td contenteditable="true">${quest.content}</td>
						<td contenteditable="true">${quest.coin}</td>
						<td><button class="savebtn" onclick="updateQuest(${quest.questId})">저장</button></td>
					`;
					tableBody.appendChild(row);
				});
			}
		})
		.catch(error => {
			console.error('퀘스트 목록을 가져오는 데 오류가 발생했습니다:', error);
		});
}

function addQuest() {
	if (quests.length >= 8) {
		alert('퀘스트는 최대 8개까지 추가할 수 있습니다.');
		return;
	}

	const tableBody = document.querySelector('.questTable tbody');

	// 안내 메시지가 있으면 삭제
	const noQuestMessage = tableBody.querySelector('tr td[colspan="5"]');
	if (noQuestMessage) {
		noQuestMessage.parentElement.remove(); // tr을 제거
	}

	// 새 퀘스트를 기본값으로 추가
	const newId = quests.length > 0 ? Math.max(...quests.map(q => q.questId)) + 1 : 1;
	const newQuest = { questId: newId, title: '', content: '', coin: 0 };

	// 퀘스트 배열에 새 퀘스트 추가
	quests.push(newQuest);
	
	// 테이블에 새로운 행 추가
	const row = document.createElement('tr');
	row.setAttribute('data-id', newQuest.questId);
	row.innerHTML = `
		<td>${newQuest.questId}</td>
		<td contenteditable="true">${newQuest.title}</td>
		<td contenteditable="true">${newQuest.content}</td>
		<td contenteditable="true">${newQuest.coin}</td>
		<td><button class="savebtn" onclick="saveQuest(${newQuest.questId})">저장</button></td>
	`;
	tableBody.appendChild(row);
}

function updateQuest(id) {
	const row = document.querySelector(`.questTable tbody tr[data-id="${id}"]`);
	const cells = row.querySelectorAll('td');
	const title = cells[1].innerText.trim();
	const content = cells[2].innerText.trim();
	const reward = cells[3].innerText.trim();

	const isValidNumber = (value) => /^\d+$/.test(value);

	if (title === '') {
		alert('제목을 입력해주세요.');
		cells[1].focus();
		return;
	}

	if (content === '') {
		alert('내용을 입력해주세요.');
		cells[2].focus();
		return;
	}

	if (!isValidNumber(reward)) {
		alert('보상 유닛은 숫자 형식이어야 합니다.');
		cells[3].focus();
		return;
	}

	const quest = {
		questId: id,
		title: title,
		content: content,
		coin: parseInt(reward),
	};

	$.ajax({
		url: '/admin/admin_quest/save',
		type: 'POST',
		data: quest,
		success: function(data) {
			alert(data);
		},
		error: function(error) {
			alert('퀘스트 저장에 실패했습니다.');
			console.log(error);
		}
	});
}

function saveQuest(id) {
	const row = document.querySelector(`.questTable tbody tr[data-id="${id}"]`);
	const cells = row.querySelectorAll('td');
	const title = cells[1].innerText.trim();
	const content = cells[2].innerText.trim();
	const reward = cells[3].innerText.trim();

	const isValidNumber = (value) => /^\d+$/.test(value);

	if (title === '') {
		alert('제목을 입력해주세요.');
		cells[1].focus();
		return;
	}

	if (content === '') {
		alert('내용을 입력해주세요.');
		cells[2].focus();
		return;
	}

	if (!isValidNumber(reward)) {
		alert('보상 유닛은 숫자 형식이어야 합니다.');
		cells[3].focus();
		return;
	}

	const quest = {
		questId: id,
		title: title,
		content: content,
		coin: parseInt(reward),
	};

	$.ajax({
		url: '/admin/admin_quest/save',
		type: 'POST',
		data: quest,
		success: function(data) {
			alert(data);
		},
		error: function(error) {
			alert('퀘스트 저장에 실패했습니다.');
			console.log(error);
		}
	});
}
