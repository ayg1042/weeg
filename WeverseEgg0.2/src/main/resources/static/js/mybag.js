document.addEventListener("DOMContentLoaded", function() {
	// 탭 항목과 내용 요소들
	const tabs = document.querySelectorAll('.shop-list li');
	const contentSections = document.querySelectorAll('.tab-content');

	// 기본적으로 bag-outfit 탭을 활성화
	const defaultTab = document.querySelector('[data-tab="bag-outfit"]');
	if (defaultTab) {
		defaultTab.classList.add('active');
	}

	// 모든 탭 콘텐츠를 숨기기
	contentSections.forEach(section => section.style.display = 'none');

	// bag-outfit 탭만 표시
	const defaultContent = document.getElementById('bag-outfit');
	console.log('test');
	if (defaultContent) {
		defaultContent.style.display = 'block';
		defaultContent.classList.add('active');
	}

	// 탭 클릭 시 내용 변경
	tabs.forEach(tab => {
		tab.addEventListener('click', function() {
			// 모든 탭과 내용을 숨기기
			contentSections.forEach(section => section.style.display = 'none');
			tabs.forEach(t => t.classList.remove('active'));

			// 클릭한 탭에 해당하는 내용을 표시
			const targetTab = this.getAttribute('data-tab');
			const targetContent = document.getElementById(targetTab);

			if (targetContent) {
				targetContent.style.display = 'block';
				this.classList.add('active');
				bag_updateItem();
			}
		});
	});
	bag_updateItem();

	// "모두 해제" 클릭 시 모든 아이템 표시
	const allCancel = document.querySelector('.all-cancel');
	if (allCancel) {
		allCancel.addEventListener('click', function() {
			if (confirm('모두 해제 하시겠씁니까?')) {
				for (let item of selectedHats) {
					item.itemId = '';
				}
			}
		});
	}
});

// test
let bag_currentPage = 1;
let bag_itemsPerPage = 8;
let bag_totalPages = 0;
// test
function bag_updateItem() {
	const bag_startIndex = (bag_currentPage - 1) * bag_itemsPerPage;
	const bag_endIndex = bag_startIndex + bag_itemsPerPage;
	const bag_items = document.querySelectorAll('.tab-content.active .shop-item-show');
	const bag_total_item = bag_items.length;
	// console.log("currentPage = " + currentPage + " itemsPerPage = " + itemsPerPage + " totalPages = " + totalPages);

	if (bag_total_item > 8) {
		bag_items.forEach(item => item.style.display = 'none');
		for (let i = bag_startIndex; i < bag_endIndex && i < bag_total_item; i++) {
			bag_items[i].style.display = 'block';
		}
		bag_totalPages = Math.ceil(bag_total_item / bag_itemsPerPage);
	}

	document.querySelector('.my-next').addEventListener('click', () => {
		if (bag_currentPage < bag_totalPages) {
			bag_currentPage++;
			bag_updateItem();
		}
	});

	// "이전" 버튼 클릭 시 처리
	document.querySelector('.my-previous').addEventListener('click', () => {
		if (bag_currentPage > 1) {
			bag_currentPage--;
			bag_updateItem();
		}
	});
}

//let selectedHats = [];
/*selectedHats.push({ typeName: 'hat', itemId: `${hat_id}` });
selectedHats.push({ typeName: 'outfit', itemId: `${outfit_id}` });
selectedHats.push({ typeName: 'pet', itemId: `${pet_id}` });
selectedHats.push({ typeName: 'pot', itemId: `${pot_id}` });
selectedHats.push({ typeName: 'sofa', itemId: `${sofa_id}` });
selectedHats.push({ typeName: 'carpet', itemId: `${carpet_id}` });
selectedHats.push({ typeName: 'drawer', itemId: `${drawer_id}` });
selectedHats.push({ typeName: 'frame', itemId: `${frame_id}` });
 */
// 아이템 선택 버튼 (장착 버튼) 클릭 시 처리
$(document).on('click', '.equipped', function() {
	// 버튼이 포함된 .shop-item-show 요소 찾기
	var itemDiv = $(this).closest('.shop-item-show');

	// 해당 요소 안의 <img> 태그에서 src 값 가져오기
	var imgSrc = itemDiv.find('img').attr('src');
	var test = itemDiv.attr('id');
	const list = test.split('-');
	const type = list.pop();
	const typeParts = type.split('_');  // ["outfit", "1"]
	console.log('typeParts : ' + typeParts.length);
	console.log(typeParts);
	//const typeName = typeParts[0];  // "outfit"
	let typeName = typeParts[typeParts.length - 2];  // "outfit"
	const itemId = typeParts[typeParts.length - 1];  // "1"

	if (!selectedHats.some(item => item.itemId === itemId)) {
		// typeName이 같은 항목을 찾아서 제거
		if (typeParts.length == 3) {
			if (typeParts[0] == 6) typeName = 'pot';
			if (typeParts[0] == 7) typeName = 'sofa';
			if (typeParts[0] == 8) typeName = 'carpet';
			if (typeParts[0] == 9) typeName = 'drawer';
			if (typeParts[0] == 10) typeName = 'frame';
		}
		const index = selectedHats.findIndex(item => item.typeName === typeName);

		if (index !== -1) {
			// 같은 typeName이 이미 있다면 기존 항목 제거
			selectedHats.splice(index, 1);
		}

		// 새 항목 추가
		selectedHats.push({ typeName: typeName, itemId: itemId });
	}

	console.log(selectedHats);
	// 원하는 곳에 적용 (예: 특정 캐릭터 이미지 변경)
	if (imgSrc.includes('outfit')) {
		$('.my_bag_outfit').attr('src', imgSrc);  // Outfit 이미지 업데이트
		$('.my_bag_outfit').attr('id', "outfit-item-id_" + itemId);
	} else if (imgSrc.includes('hat')) {
		$('.my_bag_hat').attr('src', imgSrc);  // Hat 이미지 업데이트
		$('.my_bag_hat').attr('id', "hat-item-id_" + itemId);
	}
	var danse = $('.shop-item-show.active .option_danse').text();
	var enter = $('.shop-item-show.active .option_enter').text();
	var rap = $('.shop-item-show.active .option_rap').text();
	var vocal = $('.shop-item-show.active .option_vocal').text();
	var char = $('.shop-item-show.active .option_char').text();

	$(".my_bag_statuse .item_danse .value").text(`+${danse}`);
	$(".my_bag_statuse .item_enter .value").text(`+${enter}`);
	$(".my_bag_statuse .item_rap .value").text(`+${rap}`);
	$(".my_bag_statuse .item_vocal .value").text(`+${vocal}`);
	$(".my_bag_statuse .item_char .value").text(`+${char}`);

	if (typeParts.length != 3) {
		$('.tab-content.active .item-clear').each(function() {
			$(this).text('장착').removeClass('item-clear').addClass('equipped').data('action', 'equipped');
		});
	}

	$(this).text('해제').removeClass('equipped').addClass('item-clear');
});


$(document).on('click', '.item-clear', function() {
	// 버튼이 포함된 .shop-item-show 요소 찾기
	var itemDiv = $(this).closest('.shop-item-show');

	// 해당 요소 안의 <img> 태그에서 src 값 가져오기
	var imgSrc = itemDiv.find('img').attr('src');
	var test = itemDiv.attr('id');
	const list = test.split('-');
	const type = list.pop();
	const typeParts = type.split('_');
	let typeName = typeParts[typeParts.length - 2];  // "outfit"
	const itemId = typeParts[typeParts.length - 1];  // "1"

	if (typeParts.length == 3) {
		if (typeParts[0] == 6) typeName = 'pot';
		if (typeParts[0] == 7) typeName = 'sofa';
		if (typeParts[0] == 8) typeName = 'carpet';
		if (typeParts[0] == 9) typeName = 'drawer';
		if (typeParts[0] == 10) typeName = 'frame';
	}

	// selectedHats 배열에서 해당 아이템 제거
	const index = selectedHats.findIndex(item => item.typeName === typeName && item.itemId === itemId);
	if (index !== -1) {
		//selectedHats.splice(index, 1);  // 해당 항목을 배열에서 제거
		selectedHats[index].itemId = '';  // itemId 값을 빈 문자열로 변경
	}

	console.log(selectedHats);

	// 이미지 업데이트
	if (imgSrc.includes('outfit')) {
		// Outfit 이미지를 초기화
		$('.my_bag_outfit').attr('src', '');  // 기본 이미지로 초기화
		$('.my_bag_outfit').attr('id', "");
	} else if (imgSrc.includes('hat')) {
		// Hat 이미지를 초기화
		$('.my_bag_hat').attr('src', '');  // 기본 이미지로 초기화
		$('.my_bag_hat').attr('id', "");
	}

	// 상태 정보 초기화
	$(".my_bag_statuse .item_danse .value").text("+0");
	$(".my_bag_statuse .item_enter .value").text("+0");
	$(".my_bag_statuse .item_rap .value").text("+0");
	$(".my_bag_statuse .item_vocal .value").text("+0");
	$(".my_bag_statuse .item_char .value").text("+0");

	// 버튼을 다시 장착 버튼으로 변경
	$(this).text('장착').removeClass('item-clear').addClass('equipped').data('action', 'equipped');
});


$(document).on('click', '.save-button', function() {
	openConfirmModal("아이템을 적용 하시겠습니까?", function(confirm) {
		if (confirm) {
			$.ajax({
				url: "/styleSave",
				type: "post",
				//data:{ "styleList": selectedHats },
				data: JSON.stringify(selectedHats),
				dataType: 'json',
				contentType: 'application/json; charset=utf-8',
				success: function(data) {
					openMessageModal("적용 되었습니다.");
					//location.href="/modal"
				},
				error: function() {
					openAlertModal("실패");
				}

			})
		}
	});
})

$(document).on('click', '.use-item', function() {
	var itemDiv = $(this).closest('.shop-item-show');
	openConfirmModal("아이템을 사용 하시겠습니까?", function(confirm) {
		if (confirm) {

			var test = itemDiv.attr('id');
			console.log(test);
			var testList = test.split('_');
			var invenItem = testList[1];
			var itemId = testList[2];
			console.log('인벤 아이디 : ' + invenItem);
			console.log('사용 아이템 아이디 : ' + itemId);

			$.ajax({
				url: "/itemUse",
				type: "post",
				data: { "invenId": invenItem, "itemId": itemId },
				success: function(data) {
					if (data == 1) {
						openMessageModal("적용 되었습니다.");
						//location.href="/modal"
					} else if (data == 0) {
						openAlertModal("이미 피로도가 0 입니다!")
					}
				},
				error: function() {
					openAlertModal("실패");
				}
			})
		}
	});
})

$(document).on('click', '.shop-item-show', function() {
	// 클릭한 div 안의 첫 번째 img 태그에서 src 값 가져오기
	var imgSrc = $(this).find('.item-info img').attr('src');
	var danse = $('.shop-item-show.active .option_danse').text();
	var enter = $('.shop-item-show.active .option_enter').text();
	var rap = $('.shop-item-show.active .option_rap').text();
	var vocal = $('.shop-item-show.active .option_vocal').text();
	var char = $('.shop-item-show.active .option_char').text();

	// src에 "outfit"이나 "hat"이 포함되어 있으면 해당 항목에 맞게 처리
	if (imgSrc.includes('outfit')) {
		$('.shop_outfit').attr('src', imgSrc);  // Outfit 이미지 업데이트
	} else if (imgSrc.includes('hat')) {
		$('.shop_hat').attr('src', imgSrc);  // Hat 이미지 업데이트
	}

	$(".show-item-info .item_danse .value").text(`+${danse}`);
	$(".show-item-info .item_enter .value").text(`+${enter}`);
	$(".show-item-info .item_rap .value").text(`+${rap}`);
	$(".show-item-info .item_vocal .value").text(`+${vocal}`);
	$(".show-item-info .item_char .value").text(`+${char}`);

});

