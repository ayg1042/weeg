$(function() {
    // 보컬 연습
    $("#vocal_training").click(function() {
        if (userCoin < vocalPrice) {
            openAlertModal("보유 코인이 부족해요.");
            return;
        } else if (userHealth < vocalHealth) {
            openAlertModal("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
            return;
        } else if (userFatigue + vocalFatigue > 100) {
            openAlertModal("너무 피로해서 간식이 필요해요...ㅜㅜ");
            return;
        }

        // Confirm 모달을 호출하여 확인/취소 받기
        openConfirmModal("보컬 트레이닝을 진행할까요?", function(confirm) {
            if (confirm) {
                // 로딩 화면 표시
                showLoadingScreen().then(function() {
                    // AJAX 요청 실행
                    $.ajax({
                        url: "/trainSave/vocal",
                        type: "POST",
                        data: { 
                            "vocalScore": vocalScore,
                            "health": vocalHealth,
                            "fatigue": vocalFatigue,
                            "price": vocalPrice
                        },
                        success: function(data) {
                            hideLoadingScreen(); // 로딩 화면 숨기기
                            openMessageModal(data); // 메시지 모달 표시
                        },
                        error: function() {
                            hideLoadingScreen(); // 로딩 화면 숨기기
                            openAlertModal("서버 오류가 발생했습니다.");
                        }
                    });
                });
            } // Confirmed: 진행할 경우에만 AJAX 요청
        });
    });

    // 댄스 연습
    $("#dance_training").click(function() {
        if (userCoin < dancePrice) {
            openAlertModal("보유 코인이 부족해요.");
            return;
        } else if (userHealth < danceHealth) {
            openAlertModal("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
            return;
        } else if (userFatigue + danceFatigue > 100) {
            openAlertModal("너무 피로해서 간식이 필요해요...ㅜㅜ");
            return;
        }

        // Confirm 모달을 호출하여 확인/취소 받기
        openConfirmModal("댄스 트레이닝을 진행할까요?", function(confirm) {
            if (confirm) {
                // 로딩 화면 표시
                showLoadingScreen().then(function() {
                    // AJAX 요청 실행
                    $.ajax({
                        url: "/trainSave/dance",
                        type: "POST",
                        data: { 
                            "danceScore": danceScore,
                            "health": danceHealth,
                            "fatigue": danceFatigue,
                            "price": dancePrice
                        },
                        success: function(data) {
                            hideLoadingScreen(); // 로딩 화면 숨기기
                            openMessageModal(data); // 메시지 모달 표시
                        },
                        error: function() {
                            hideLoadingScreen(); // 로딩 화면 숨기기
                            openAlertModal("서버 오류가 발생했습니다.");
                        }
                    });
                });
            } // Confirmed: 진행할 경우에만 AJAX 요청
        });
    });

    // 랩 연습
    $("#rap_training").click(function() {
        if (userCoin < rapPrice) {
            openAlertModal("보유 코인이 부족해요.");
            return;
        } else if (userHealth < rapHealth) {
            openAlertModal("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
            return;
        } else if (userFatigue + rapFatigue > 100) {
            openAlertModal("너무 피로해서 간식이 필요해요...ㅜㅜ");
            return;
        }

        // Confirm 모달을 호출하여 확인/취소 받기
        openConfirmModal("랩 트레이닝을 진행할까요?", function(confirm) {
            if (confirm) {
                // 로딩 화면 표시
                showLoadingScreen().then(function() {
                    // AJAX 요청 실행
                    $.ajax({
                        url: "/trainSave/rap",
                        type: "POST",
                        data: { 
                            "rapScore": rapScore,
                            "health": rapHealth,
                            "fatigue": rapFatigue,
                            "price": rapPrice
                        },
                        success: function(data) {
                            hideLoadingScreen(); // 로딩 화면 숨기기
                            openMessageModal(data); // 메시지 모달 표시
                        },
                        error: function() {
                            hideLoadingScreen(); // 로딩 화면 숨기기
                            openAlertModal("서버 오류가 발생했습니다.");
                        }
                    });
                });
            } // Confirmed: 진행할 경우에만 AJAX 요청
        });
    });

    // 예능 연습
    $("#enter_training").click(function() {
        if (userCoin < entPrice) {
            openAlertModal("보유 코인이 부족해요.");
            return;
        } else if (userHealth < entHealth) {
            openAlertModal("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
            return;
        } else if (userFatigue + entFatigue > 100) {
            openAlertModal("너무 피로해서 간식이 필요해요...ㅜㅜ");
            return;
        }

        // Confirm 모달을 호출하여 확인/취소 받기
        openConfirmModal("예능 트레이닝을 진행할까요?", function(confirm) {
            if (confirm) {
                // 로딩 화면 표시
                showLoadingScreen().then(function() {
                    // AJAX 요청 실행
                    $.ajax({
                        url: "/trainSave/ent",
                        type: "POST",
                        data: { 
                            "entScore": entScore,
                            "health": entHealth,
                            "fatigue": entFatigue,
                            "price": entPrice
                        },
                        success: function(data) {
                            hideLoadingScreen(); // 로딩 화면 숨기기
                            openMessageModal(data); // 메시지 모달 표시
                        },
                        error: function() {
                            hideLoadingScreen(); // 로딩 화면 숨기기
                            openAlertModal("서버 오류가 발생했습니다.");
                        }
                    });
                });
            } // Confirmed: 진행할 경우에만 AJAX 요청
        });
    });
});
