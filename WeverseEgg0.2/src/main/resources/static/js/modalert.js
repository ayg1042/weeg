// 결과 확인 모달 열기 (링크 이동 있음)
function openMessageModal(message) {
    document.getElementById("modal-message").innerText = message;
    document.getElementById("message-modal").style.display = "flex";
    document.getElementById("modal-background").style.display = "block";
}

// 결과 확인 모달 닫기 (링크 이동 있음)
function closeMessageModal() {
    document.getElementById("message-modal").style.display = "none";
    document.getElementById("modal-background").style.display = "none";
}

// 확인 버튼 클릭 시 페이지 이동
function closeMessageModalAndRedirect() {
    closeMessageModal();
    location.href = "/modal"; // "/modal" 페이지로 이동
}

// 알림 모달 열기 (링크 이동 X)
function openAlertModal(message) {
    document.getElementById("alert-message").innerText = message;
    document.getElementById("alert-modal").style.display = "flex";
    document.getElementById("modal-background").style.display = "block";
}
// 데뷔 모달 열기 (링크 이동 X)
function openDebutModal(message) {
    document.getElementById("alert-debut-message").innerText = message;
    document.getElementById("alert-debut-modal").style.display = "flex";
    document.getElementById("modal-background").style.display = "block";
}

// 알림 모달 닫기 (링크 이동 X)
function closeAlertModal() {
    document.getElementById("alert-modal").style.display = "none";
    document.getElementById("modal-background").style.display = "none";
}

// 데뷔 모달 닫기 (링크 이동 X)
function closeAlertModal() {
    document.getElementById("alert-debut-modal").style.display = "none";
    document.getElementById("modal-background").style.display = "none";
}

// Confirm 모달 열기 (확인 + 취소)
function openConfirmModal(message, callback) {
    document.getElementById("confirm-message").innerText = message;
    document.getElementById("confirm-modal").style.display = "flex";
    document.getElementById("modal-background").style.display = "block";

    // 확인 버튼을 클릭하면 콜백 함수 실행
    document.getElementById("confirm-button").onclick = function() {
        callback(true);
        closeConfirmModal(); // 모달 닫기
    };

    // 취소 버튼을 클릭하면 콜백 함수 실행
    document.getElementById("cancel-button").onclick = function() {
        callback(false);
        closeConfirmModal(); // 모달 닫기
    };
}

// Confirm 모달 닫기
function closeConfirmModal() {
    document.getElementById("confirm-modal").style.display = "none";
    document.getElementById("modal-background").style.display = "none";
}
