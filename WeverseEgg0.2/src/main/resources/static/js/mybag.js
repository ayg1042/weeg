document.addEventListener("DOMContentLoaded", function () {
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
		bag_updateItem();
      }
    });
  });
  bag_updateItem();

  // 아이템 선택 버튼 (장착 버튼) 클릭 시 처리
  document.querySelectorAll('.equipped').forEach(button => {
    button.addEventListener('click', function () {
      // 모든 아이템 숨기기
	  const test = document.querySelector('.shop-item-show.active').id;
      alert(test+"장착");
    });
  });

  // "모두 해제" 클릭 시 모든 아이템 표시
  const allCancel = document.querySelector('.all-cancel');
  if (allCancel) {
    allCancel.addEventListener('click', function () {
      document.querySelectorAll('.shop-item-show').forEach(item => {
        item.style.display = 'block';
      });
    });
  }
});

$(document).on('click', '.save-button', function(){
	alert("적용버튼");
})

// test
  let bag_currentPage = 1;
  let bag_itemsPerPage = 8;
  let bag_totalPages = 0;
// test
 function bag_updateItem(){
	const bag_startIndex = (bag_currentPage - 1) * bag_itemsPerPage;
	const bag_endIndex = bag_startIndex + bag_itemsPerPage;
  	const bag_items = document.querySelectorAll('.tab-content.active .shop-item-show');
	const bag_total_item = bag_items.length;
	// console.log("currentPage = " + currentPage + " itemsPerPage = " + itemsPerPage + " totalPages = " + totalPages);
	
	if(bag_total_item > 8){		
		bag_items.forEach(item => item.style.display = 'none');
		for(let i = bag_startIndex; i < bag_endIndex && i < bag_total_item; i++){
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
