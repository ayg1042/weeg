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


 $(document).on('click', '.apply-button', function(){
 	const test = document.querySelector('.shop-item-show.active').id;
	const list = test.split('_');
	const itemId = list.pop();
	const name = $('.shop-item-show.active .item-name').text();
 	// alert("아이템 아이디 : "+ itemId + ' 구매');
	if(confirm(name + "(을/를) 구매하시나요?")){
		$.ajax({
				  url:"/buyItem",
				  type:"post",
				  data:{"itemId":itemId},
				  success:function(data){
					if(data == 1){						
					  alert("구매 완료되었습니다.");
					  location.href="/modal"
					}else if(data == 0){
						alert("코인이 부족합니다!")
					}
				  },
				  error:function(){
					  alert("실패");
				  }
				  
		})
	}
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
 
