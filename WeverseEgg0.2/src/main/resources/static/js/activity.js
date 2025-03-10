$(function(){
	// 음방활동
	$("#music_actvity").click(function(){
			if (userCoin < 50000){
						alert("보유 코인이 부족해요.");
						return;
					}else if(userHealth < 40){
						alert("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
						return;
					}else if(userFatigue+75>100){
						alert("너무 피로해서 간식이 필요해요...ㅜㅜ");
						return;
					}else if(userVocal<50){
						alert("음악방송 출연에 필요한 보컬 능력이 부족해요...ㅜㅜ");
						return;
					}else if(userRap<50){
						alert("음악방송 출연에 필요한 랩 능력이 부족해요...ㅜㅜ");
						return;
					}
			if (confirm("음악방송에 출연할까요?")) {
					$.ajax({
						url: "/actSave/music_actvity",
						type: "POST",
						data: { "health": 40,
											"fatigue": 75,
											"price": 50000},
						success: function (data) {
							console.log("data 확인 : " + data);
							alert(data);
							location.href="/modal"
						},
						error: function () {
							alert("fail..");
						}
					});//ajax
		}//ifconfirm
		
	})// 음방활동
	
	// 예능 출연
	$("#ent_actvity").click(function(){
			if (userCoin < 70000){
						alert("보유 코인이 부족해요.");
						return;
					}else if(userHealth < 40){
						alert("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
						return;
					}else if(userFatigue+75>100){
						alert("너무 피로해서 간식이 필요해요...ㅜㅜ");
						return;
					}else if(userEnt<100){
						alert("예능 출연에 필요한 예능 능력이 부족해요...ㅜㅜ");
						return;
					}
			if (confirm("예능에 출연할까요?")) {
					$.ajax({
						url: "/actSave/ent_actvity",
						type: "POST",
						data: { "health": 40,
											"fatigue": 75,
											"price": 70000},
						success: function (data) {
							console.log("data 확인 : " + data);
							alert(data);
							location.href="/modal"
						},
						error: function () {
							alert("fail..");
						}
					});//ajax
		}//ifconfirm
		
	})// 예능 출연
	
	// 콘서트
	$("#con_actvity").click(function(){
			if (userCoin < 200000){
						alert("보유 코인이 부족해요.");
						return;
					}else if(userHealth < 40){
						alert("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
						return;
					}else if(userFatigue+75>100){
						alert("너무 피로해서 간식이 필요해요...ㅜㅜ");
						return;
					}else if(userVocal<75){
						alert("콘서트 개최에 필요한 보컬 능력이 부족해요...ㅜㅜ");
						return;
					}else if(userDance<75){
						alert("콘서트 개최에 필요한 댄스 능력이 부족해요...ㅜㅜ");
						return;
					}
			if (confirm("콘서트를 할까요?")) {
					$.ajax({
						url: "/actSave/con_actvity",
						type: "POST",
						data: { "health": 40,
											"fatigue": 75,
											"price": 200000},
						success: function (data) {
							console.log("data 확인 : " + data);
							alert(data);
							location.href="/modal"
						},
						error: function () {
							alert("fail..");
						}
					});//ajax
		}//ifconfirm
		
	})// 콘서트
	
	// 콘서트
	$("#sign_actvity").click(function(){
			if (userCoin < 150000){
						alert("보유 코인이 부족해요.");
						return;
					}else if(userHealth < 40){
						alert("체력이 부족해서 휴식이 필요해요...ㅜㅜ");
						return;
					}else if(userFatigue+75>100){
						alert("너무 피로해서 간식이 필요해요...ㅜㅜ");
						return;
					}else if(userPop<500){
						alert("팬사인회에 필요한 인기도가 부족해요...ㅜㅜ");
						return;
					}
			if (confirm("팬사인회를 할까요?")) {
					$.ajax({
						url: "/actSave/sign_actvity",
						type: "POST",
						data: { "health": 40,
											"fatigue": 75,
											"price": 200000},
						success: function (data) {
							console.log("data 확인 : " + data);
							alert(data);
							location.href="/modal"
						},
						error: function () {
							alert("fail..");
						}
					});//ajax
		}//ifconfirm
		
	})// 콘서트
	
});// jquery