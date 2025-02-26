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

// 모달 4번
document.addEventListener("DOMContentLoaded", () => {
  const openButton = document.querySelector('[data-modal="modal4"]');
  const modal = document.getElementById("modal4");
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