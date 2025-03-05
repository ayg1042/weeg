document.addEventListener("DOMContentLoaded", function () {
  // 탭 항목과 내용 요소들
  const tabs = document.querySelectorAll('.shop-list li');
  const contentSections = document.querySelectorAll('.tab-content');
  //const applyButton = document.querySelector('.apply-button');

  // 기본적으로 shop-outfit 탭을 활성화
  document.querySelector('.shop-list').children
  const defaultTab_shop = document.querySelector('[data-tab="shop-outfit"]');
  defaultTab_shop.classList.add('active');

  // 모든 탭 콘텐츠를 숨기기
  contentSections.forEach(section => section.style.display = 'none');

  // shop-outfit 탭만 표시
  document.getElementById('shop-outfit').style.display = 'block';
  document.getElementById('shop-outfit').classList.add('active');

  // 탭 클릭 시 내용 변경
  tabs.forEach(tab => {
    tab.addEventListener('click', function () {
      // 모든 탭과 내용을 숨기기
      contentSections.forEach(section => section.style.display = 'none');
      tabs.forEach(t => t.classList.remove('active'));
      
      // 클릭한 탭에 해당하는 내용을 표시
      const targetTab = this.getAttribute('data-tab');
      document.getElementById(targetTab).style.display = 'block';
      this.classList.add('active');
	  shop_updateItem();
    });
  });
  shop_updateItem();

  // 구매 버튼 클릭 시 처리
  //applyButton.addEventListener('click', function () {
  //  alert(test + "구매버튼");
  //});
});

// 아이템 클릭
document.addEventListener("DOMContentLoaded", function () {
  document.body.addEventListener("click", function (event) {
    const clickedItem = event.target.closest('.shop-item-show');
    if (clickedItem) {
		// 이전에 강조된 아이템 초기화
      document.querySelectorAll('.shop-item-show').forEach(item => {
        item.classList.remove('active');
      });

      // 클릭된 아이템 강조 효과 추가
      clickedItem.classList.add('active');

	  // 테스트 코드
      // alert(`클릭된 아이템: ${clickedItem.id}`);
    }
  });
});

$(document).on('click', '.apply-button', function(){
	const test = document.querySelector('.shop-item-show.active').id;
	const test2 = $('.tab-content.active').children().children().length;
	alert(test + '구매' + test2)
})

// 아이템 선택 버튼 (장착 버튼) 클릭 시 처리
document.querySelectorAll('.equipped').forEach(button => {
    button.addEventListener('click', function () {
      // 모든 아이템 숨기기
	  const test = document.querySelector('.shop-item-show.active').id;
      alert(test+"장착");
    });
  });
 
$(document).on('click', '.save-button', function(){
  	alert("적용버튼");
  })
// test
  let shop_currentPage = 1;
  let shop_itemsPerPage = 8;
  let shop_totalPages = 0;
// test
 function shop_updateItem(){
	const shop_startIndex = (shop_currentPage - 1) * shop_itemsPerPage;
	const shop_endIndex = shop_startIndex + shop_itemsPerPage;
  	const shop_items = document.querySelectorAll('.tab-content.active .shop-item-show');
	const shop_total_item = shop_items.length;
	// console.log("currentPage = " + currentPage + " itemsPerPage = " + itemsPerPage + " totalPages = " + totalPages);
	
	if(shop_total_item > 8){		
		shop_items.forEach(item => item.style.display = 'none');
		for(let i = shop_startIndex; i < shop_endIndex && i < shop_total_item; i++){
			shop_items[i].style.display = 'block';
		}
		shop_totalPages = Math.ceil(shop_total_item / shop_itemsPerPage);
	}
	 document.querySelector('.next').addEventListener('click', () => {
	     if (shop_currentPage < shop_totalPages) {
	         shop_currentPage++;
	         shop_updateItem();
	     }
	 });
	
	 // "이전" 버튼 클릭 시 처리
	 document.querySelector('.previous').addEventListener('click', () => {
	     if (shop_currentPage > 1) {
	         shop_currentPage--;
	         shop_updateItem();
	     }
	 });
 }