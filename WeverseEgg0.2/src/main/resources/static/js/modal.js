/**
 * 
 */
// 모달 1 번
document.addEventListener("DOMContentLoaded", () => {
  const openButton = document.querySelector('[data-modal="modal1"]');
  const modal = document.getElementById("modal1");
  const closeButton = modal.querySelector(".close");

  // 모달 열기 이벤트
  openButton.addEventListener("click", () => {
      modal.style.display = "block";
  });

  // 모달 닫기 이벤트
  closeButton.addEventListener("click", () => {
      modal.style.display = "none";
  });

  // 모달 외부 킬릭시 닫기
  window.addEventListener("click", (e) => {
      if (e.target === modal) {
          modal.style.display = "none";
      }
  });
});

// 모달 2번
document.addEventListener("DOMContentLoaded", () => {
  const openButton = document.querySelector('[data-modal="modal2"]');
  const modal = document.getElementById("modal2");
  const closeButton = modal.querySelector(".close");

  // 모달 열기
  openButton.addEventListener("click", () => {
      modal.style.display = "block";
  });

  // 모달 닫기
  closeButton.addEventListener("click", () => {
      modal.style.display = "none";
  });

  // 외부 클릭시 모달 닫기
  window.addEventListener("click", (e) => {
      if (e.target === modal) {
          modal.style.display = "none";
      }
  });
});

// 모달 3번
document.addEventListener("DOMContentLoaded", () => {
  const openButton = document.querySelector('[data-modal="modal3"]');
  const modal = document.getElementById("modal3");
  const closeButton = modal.querySelector(".close");
  
  const tabs = document.querySelectorAll('.shop-list li');
  const contentSections = document.querySelectorAll('.tab-content');
  const defaultTab_bag = document.querySelector('[data-tab="shop-outfit"]');


  // 모달 열기
  openButton.addEventListener("click", () => {
	const shopListItems = document.querySelector('.shop-list').children;
	for (let item of shopListItems) {
	  item.classList.remove('active');
	}
	
      modal.style.display = "block";
      const contentSections = document.querySelectorAll('.tab-content');

      // 기본적으로 shop-outfit 탭을 활성화
      const defaultTab = document.querySelector('[data-tab="shop-outfit"]');
      defaultTab.classList.add('active');

      // 모든 탭 콘텐츠를 숨기기
      contentSections.forEach(section => section.style.display = 'none');

      // shop-outfit 탭만 표시
      document.getElementById('shop-outfit').style.display = 'block';
	  
	  document.querySelector('[data-tab="bag-outfit"]').classList.remove('active');
  	  document.getElementById('bag-outfit').classList.remove('active');
  	  defaultTab_bag.classList.add('active');
  	  contentSections.forEach(section => section.style.display = 'none');
  	    
  	  document.getElementById('shop-outfit').style.display = 'block';
  	  document.getElementById('shop-outfit').classList.add('active');
  	    
  	  shop_updateItem();
	  
  });

  // 모달 닫기
  closeButton.addEventListener("click", () => {
      modal.style.display = "none";
  });

  // 외부 클릭시 모달 닫기
  window.addEventListener("click", (e) => {
      if (e.target === modal) {
          modal.style.display = "none";
      }
  });
  
});

// 모달 4번
document.addEventListener("DOMContentLoaded", () => {
  const openButton = document.querySelector('[data-modal="modal4"]');
  const modal = document.getElementById("modal4");
  const closeButton = modal.querySelector(".close");
  
  // test
  const tabs = document.querySelectorAll('.shop-list li');
  const contentSections = document.querySelectorAll('.tab-content');
  const defaultTab_bag = document.querySelector('[data-tab="bag-outfit"]');
  
  // 모달 열기
  openButton.addEventListener("click", () => {
		const shopListItems = document.querySelector('.shop-list').children;
		for (let item of shopListItems) {
		  item.classList.remove('active');
		}
		
      modal.style.display = "block";
	  const contentSections = document.querySelectorAll('.tab-content');

      // 기본적으로 shop-outfit 탭을 활성화
      const defaultTab = document.querySelector('[data-tab="bag-outfit"]');
      defaultTab.classList.add('active');

      // 모든 탭 콘텐츠를 숨기기
      contentSections.forEach(section => section.style.display = 'none');

      // shop-outfit 탭만 표시
      document.getElementById('bag-outfit').style.display = 'block';
	  
	  // test
	  document.querySelector('[data-tab="shop-outfit"]').classList.remove('active');
	  document.getElementById('shop-outfit').classList.remove('active');
	  defaultTab_bag.classList.add('active');
	  contentSections.forEach(section => section.style.display = 'none');
	    
	  document.getElementById('bag-outfit').style.display = 'block';
	  document.getElementById('bag-outfit').classList.add('active');
	    
	  bag_updateItem();

  });

  // 모달 닫기
  closeButton.addEventListener("click", () => {
      modal.style.display = "none";
  });

  // 외부 클릭시 모달 닫기
  window.addEventListener("click", (e) => {
      if (e.target === modal) {
          modal.style.display = "none";
      }
  });
  
  
});

const tabs = document.querySelectorAll('.shop-list li');
const tabContents = document.querySelectorAll('.tab-content');
    
tabs.forEach(tab => {
    tab.addEventListener('click', () => {
        const targetTab = tab.getAttribute('data-tab');
        
        tabContents.forEach(content => {
            content.classList.remove('active');
            if(content.id === targetTab) {
                content.classList.add('active');
            }
        });
    });
});