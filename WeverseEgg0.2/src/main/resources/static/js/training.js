$(function() {
	// 보컬 연습
	$("#vocal_training").click(function() {
		if (userCoin < vocalPrice){
			alert("보유 코인이 부족해요.");
			return;
		}else if(userHealth < vocalHealth){
			alert("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
			return;
		}else if(userFatigue+vocalFatigue>100){
			alert("너무 피로해서 간식이 필요해요...ㅜㅜ");
			return;
		}
		
		if (confirm("보컬 트레이닝을 진행할까요?")) {
			$.ajax({
				url: "/trainSave/vocal",
				type: "POST",
				data: { "vocalScore": vocalScore,
									"health": vocalHealth,
									"fatigue": vocalFatigue,
									"price": vocalPrice},
				success: function (data) {
					console.log("data 확인 : " + data);
					alert(data);
					location.href="/modal"
				},
				error: function () {
					alert("fail..");
				}
			});
		}//confirm if
	});//vocal_training
	
	
	// dance 연습
	$("#dance_training").click(function() {
		if (userCoin < dancePrice){
			alert("보유 코인이 부족해요.");
			return;
		}else if(userHealth < danceHealth){
			alert("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
			return;
		}else if(userFatigue+danceFatigue>100){
			alert("너무 피로해서 간식이 필요해요...ㅜㅜ");
			return;
		}
		
		if (confirm("댄스 트레이닝을 진행할까요?")) {
			$.ajax({
				url: "/trainSave/dance",
				type: "POST",
				data: { "danceScore": danceScore,
									"health": danceHealth,
									"fatigue": danceFatigue,
									"price": dancePrice},
				success: function (data) {
					console.log("data 확인 : " + data);
					alert(data);
					location.href="/modal"
				},
				error: function () {
					alert("fail..");
				}
			});
		}//confirm if
	});//dance_training
	
	
	// rap 연습
	$("#rap_training").click(function() {
		if (userCoin < rapPrice){
			alert("보유 코인이 부족해요.");
			return;
		}else if(userHealth < rapHealth){
			alert("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
			return;
		}else if(userFatigue+rapFatigue>100){
			alert("너무 피로해서 간식이 필요해요...ㅜㅜ");
			return;
		}
		
		if (confirm("랩 트레이닝을 진행할까요?")) {
			$.ajax({
				url: "/trainSave/rap",
				type: "POST",
				data: { "rapScore": rapScore,
									"health": rapHealth,
									"fatigue": rapFatigue,
									"price": rapPrice},
				success: function (data) {
					console.log("data 확인 : " + data);
					alert(data);
					location.href="/modal"
				},
				error: function () {
					alert("fail..");
				}
			});
		}//confirm if
	});//dance_training
	
	
	// entertain 연습
	$("#enter_training").click(function() {
		if (userCoin < entPrice){
			alert("보유 코인이 부족해요.");
			return;
		}else if(userHealth < entHealth){
			alert("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
			return;
		}else if(userFatigue+entFatigue>100){
			alert("너무 피로해서 간식이 필요해요...ㅜㅜ");
			return;
		}
		
		if (confirm("예능 트레이닝을 진행할까요?")) {
			$.ajax({
				url: "/trainSave/ent",
				type: "POST",
				data: { "entScore": entScore,
									"health": entHealth,
									"fatigue": entFatigue,
									"price": entPrice},
				success: function (data) {
					console.log("data 확인 : " + data);
					alert(data);
					location.href="/modal"
				},
				error: function () {
					alert("fail..");
				}
			});
		}//confirm if
	});//dance_training
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});//jquery
