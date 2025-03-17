$(function() {
    // 음방활동
    $("#music_actvity").click(function() {
        if (userCoin < 50000) {
            openAlertModal("보유 코인이 부족해요.");
            return;
        } else if (userHealth < 40) {
            openAlertModal("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
            return;
        } else if (userFatigue + 75 > 100) {
            openAlertModal("너무 피로해서 간식이 필요해요...ㅜㅜ");
            return;
        } else if (userVocal < 75) {
            openAlertModal("음악방송 출연에 필요한 보컬 능력이 부족해요...ㅜㅜ");
            return;
        } else if (userRap < 75) {
            openAlertModal("음악방송 출연에 필요한 랩 능력이 부족해요...ㅜㅜ");
            return;
        }

        // Confirm 모달을 호출하여 확인/취소 받기
        openConfirmModal("음악방송에 출연할까요?", function(confirm) {
            if (confirm) {
                // 확인 클릭 시 AJAX 요청 실행
                $.ajax({
                    url: "/actSave/music_actvity",
                    type: "POST",
                    data: {
                        "health": 40,
                        "fatigue": 75,
                        "price": 50000
                    },
                    success: function(data) {
                        console.log("data 확인 : " + data);
                        openMessageModal(data); // 메시지 모달 표시
                    },
                    error: function() {
                        openAlertModal("서버 오류가 발생했습니다.");
                    }
                });
            } // Confirmed: 진행할 경우에만 AJAX 요청
        });
    });

    // 예능 출연
    $("#ent_actvity").click(function() {
        if (userCoin < 70000) {
            openAlertModal("보유 코인이 부족해요.");
            return;
        } else if (userHealth < 40) {
            openAlertModal("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
            return;
        } else if (userFatigue + 75 > 100) {
            openAlertModal("너무 피로해서 간식이 필요해요...ㅜㅜ");
            return;
        } else if (userEnt < 100) {
            openAlertModal("예능 출연에 필요한 예능 능력이 부족해요...ㅜㅜ");
            return;
        }

        // Confirm 모달을 호출하여 확인/취소 받기
        openConfirmModal("예능에 출연할까요?", function(confirm) {
            if (confirm) {
                // 확인 클릭 시 AJAX 요청 실행
                $.ajax({
                    url: "/actSave/ent_actvity",
                    type: "POST",
                    data: {
                        "health": 40,
                        "fatigue": 75,
                        "price": 70000
                    },
                    success: function(data) {
                        console.log("data 확인 : " + data);
                        openMessageModal(data); // 메시지 모달 표시
                    },
                    error: function() {
                        openAlertModal("서버 오류가 발생했습니다.");
                    }
                });
            } // Confirmed: 진행할 경우에만 AJAX 요청
        });
    });

    // 콘서트
    $("#con_actvity").click(function() {
        if (userCoin < 200000) {
            openAlertModal("보유 코인이 부족해요.");
            return;
        } else if (userHealth < 40) {
            openAlertModal("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
            return;
        } else if (userFatigue + 75 > 100) {
            openAlertModal("너무 피로해서 간식이 필요해요...ㅜㅜ");
            return;
        } else if (userVocal < 75) {
            openAlertModal("콘서트 개최에 필요한 보컬 능력이 부족해요...ㅜㅜ");
            return;
        } else if (userDance < 75) {
            openAlertModal("콘서트 개최에 필요한 댄스 능력이 부족해요...ㅜㅜ");
            return;
        }

        // Confirm 모달을 호출하여 확인/취소 받기
        openConfirmModal("콘서트를 할까요?", function(confirm) {
            if (confirm) {
                // 확인 클릭 시 AJAX 요청 실행
                $.ajax({
                    url: "/actSave/con_actvity",
                    type: "POST",
                    data: {
                        "health": 40,
                        "fatigue": 75,
                        "price": 200000
                    },
                    success: function(data) {
                        console.log("data 확인 : " + data);
                        openMessageModal(data); // 메시지 모달 표시
                    },
                    error: function() {
                        openAlertModal("서버 오류가 발생했습니다.");
                    }
                });
            } // Confirmed: 진행할 경우에만 AJAX 요청
        });
    });

    // 팬사인회
    $("#sign_actvity").click(function() {
        if (userCoin < 150000) {
            openAlertModal("보유 코인이 부족해요.");
            return;
        } else if (userHealth < 40) {
            openAlertModal("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
            return;
        } else if (userFatigue + 75 > 100) {
            openAlertModal("너무 피로해서 간식이 필요해요...ㅜㅜ");
            return;
        } else if (userPop < 500) {
            openAlertModal("팬사인회에 필요한 인기도가 부족해요...ㅜㅜ");
            return;
        }

        // Confirm 모달을 호출하여 확인/취소 받기
        openConfirmModal("팬사인회를 할까요?", function(confirm) {
            if (confirm) {
                // 확인 클릭 시 AJAX 요청 실행
                $.ajax({
                    url: "/actSave/sign_actvity",
                    type: "POST",
                    data: {
                        "health": 40,
                        "fatigue": 75,
                        "price": 150000
                    },
                    success: function(data) {
                        console.log("data 확인 : " + data);
                        openMessageModal(data); // 메시지 모달 표시
                    },
                    error: function() {
                        openAlertModal("서버 오류가 발생했습니다.");
                    }
                });
            } // Confirmed: 진행할 경우에만 AJAX 요청
        });
    });
});
