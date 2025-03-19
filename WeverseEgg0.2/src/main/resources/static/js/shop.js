document.addEventListener("DOMContentLoaded", function () {
	// 탭 항목과 내용 요소들
	const tabs = document.querySelectorAll('.shop-list li');
	const contentSections = document.querySelectorAll('.tab-content');

	// 기본적으로 shop-outfit 탭을 활성화
	const defaultTab_shop = document.querySelector('[data-tab="shop-outfit"]');
	if (defaultTab_shop) {
		defaultTab_shop.classList.add('active');
	}

	// 모든 탭 콘텐츠를 숨기기
	contentSections.forEach(section => section.style.display = 'none');

	// shop-outfit 탭만 표시
	const defaultContent = document.getElementById('shop-outfit');
	if (defaultContent) {
		defaultContent.style.display = 'block';
		defaultContent.classList.add('active');
	}

	// 탭 클릭 시 내용 변경
	tabs.forEach(tab => {
		tab.addEventListener('click', function () {
			// 모든 탭과 내용을 숨기기
			contentSections.forEach(section => section.style.display = 'none');
			tabs.forEach(t => t.classList.remove('active'));

			// 클릭한 탭에 해당하는 내용을 표시
			const targetTab = this.getAttribute('data-tab');
			const targetContent = document.getElementById(targetTab);

			if (targetContent) {
				targetContent.style.display = 'block';
				this.classList.add('active');
				shop_updateItem(); // 탭 변경 시 페이지네이션 다시 계산
			}
		});
	});

	// 아이템 클릭 시 활성화
	document.body.addEventListener("click", function (event) {
		const clickedItem = event.target.closest('.shop-item-show');
		if (clickedItem) {
			// 이전 활성화 제거
			document.querySelectorAll('.shop-item-show').forEach(item => {
				item.classList.remove('active');
			});

			// 클릭한 아이템 활성화
			clickedItem.classList.add('active');
		}
	});

	// "다음" 및 "이전" 버튼 이벤트 한 번만 등록
	const nextButton = document.querySelector('.next');
	const prevButton = document.querySelector('.previous');

	if (nextButton) {
		nextButton.addEventListener('click', function () {
			if (shop_currentPage < shop_totalPages) {
				shop_currentPage++;
				shop_updateItem();
			}
		});
	}

	if (prevButton) {
		prevButton.addEventListener('click', function () {
			if (shop_currentPage > 1) {
				shop_currentPage--;
				shop_updateItem();
			}
		});
	}

	shop_updateItem();
});

// 페이지네이션 관련 변수
let shop_currentPage = 1;
let shop_itemsPerPage = 8;
let shop_totalPages = 0;

// 페이지 업데이트 함수
function shop_updateItem() {
	const shop_startIndex = (shop_currentPage - 1) * shop_itemsPerPage;
	const shop_endIndex = shop_startIndex + shop_itemsPerPage;
	const shop_items = document.querySelectorAll('.tab-content.active .shop-item-show');

	if (!shop_items.length) return; // 아이템이 없으면 실행하지 않음

	const shop_total_item = shop_items.length;
	shop_totalPages = Math.ceil(shop_total_item / shop_itemsPerPage);

	// 모든 아이템 숨기고, 해당하는 아이템만 보이게 함
	shop_items.forEach((item, index) => {
		item.style.display = (index >= shop_startIndex && index < shop_endIndex) ? 'block' : 'none';
	});
}



$(document).on('click', '.apply-button', function() {
	const test = document.querySelector('.shop-item-show.active').id;
	const list = test.split('_');
	const itemId = list.pop();
	const name = $('.shop-item-show.active .item-name').text();
	// alert("아이템 아이디 : "+ itemId + ' 구매');
	openConfirmModal(name + "(을/를) 구매하시나요?", function(confirm) {
		if (confirm) {
			$.ajax({
				url: "/buyItem",
				type: "post",
				data: { "itemId": itemId },
				success: function(data) {
					if (data == 1) {
						openMessageModal("구매 완료되었습니다.");
						//location.href = "/modal"
					} else if (data == 0) {
						openAlertModal("코인이 부족합니다!")
					} else {
						openAlertModal("이미 구매한 아이템입니다.")
					}
				},
				error: function() {
					openAlertModal("실패");
				}
		   });
		}
	});
});


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

	$(".show-item-info .item_danse .positive").text(`(+${danse})`);
	$(".show-item-info .item_enter .positive").text(`(+${enter})`);
	$(".show-item-info .item_rap .positive").text(`(+${rap})`);
	$(".show-item-info .item_vocal .positive").text(`(+${vocal})`);
	$(".show-item-info .item_char .positive").text(`(+${char})`);

});

