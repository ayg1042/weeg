$(document).ready(function() {
		// 아이템 추가
        $('#item_save').on('click', function(event) {
			event.preventDefault();
			var form_data = new FormData();
			var fileInput = $("#img")[0].files[0];  // 파일 가져오기

			    if (!fileInput) {
			        alert("파일을 선택해주세요.");
			        return;
			    }
			form_data.append("file",fileInput);
			
			alert("test");

            var itemInfoList = $('#item-info').val().split('_');  // 선택된 아이템 정보 ID
			var itemTypeId = itemInfoList[0];
			var itemInfoId = itemInfoList[1];

            // 선택된 item-info에 맞는 카테고리 처리 (아이템 정보에 맞춰 카테고리 지정)
            var category = "";
            if (itemTypeId) {
                // 예시로 아이템 타입에 따라 카테고리 설정
                if (itemTypeId == 1) {
                    category = 'hat';  // 모자
                } else if (itemTypeId == 2) {
                    category = 'outfit';  // 의상
                } else if (itemTypeId == 3) {
                    category = 'pet';  // 펫
                } else if (itemTypeId == 4) {
                    category = 'consumable';  // 소모품
                } else if (itemTypeId == 5) {
                    category = 'consumable';  // 이벤트
                } else if (itemTypeId >= 6) {
                    category = 'interior';  // 인테리어
                }
				// 필요한 카테고리 추가
            }
			form_data.append('itemInfoId', itemInfoId);
			form_data.append('category', category);
			form_data.append('itemName', $("#item_name").val());
			form_data.append('price', $("#price").val());
			console.log(itemInfoList);

            // 카테고리 정보를 추가
            // formData.append('category', category);

            // AJAX 요청 보내기
            $.ajax({
                url: '/itemAdd',  // 서버의 업로드 엔드포인트
                type: 'POST',
                data: form_data,
				enctype:"multipart/form-data",
				cache: false,
                processData: false,  // jQuery가 데이터를 자동으로 변환하지 않도록 설정
                contentType: false,  // Content-Type 헤더를 자동으로 설정하지 않도록 설정
                success: function(response) {
                    alert("성공");
                },
                error: function(xhr, status, error) {
                    alert("실패");
                }
            });
			
        });
		// 아이템 추가
		$('#item_info_save').on('click', function(event){
			event.preventDefault();
			var itemType = $('#item-type').val();
			var charm = $('#charm').val();
			var dance = $('#dance').val();
			var rap = $('#rap').val();
			var vocal = $('#vocal').val();
			var entertainment = $('#entertainment').val();
			var fatigue_recovery = $('#fatigue_recovery').val();
			console.log(itemType);
			
			$.ajax({
                url: '/itemInfoAdd',  // 서버의 업로드 엔드포인트
                type: 'POST',
                data: {
					'itemType':itemType,
					'charm':charm,
					'dance':dance,
					'rap':rap,
					'vocal':vocal,
					'entertainment':entertainment,
					'fatgue_recovery':fatigue_recovery
				},
                success: function(response) {
                    alert("성공");
                },
                error: function(xhr, status, error) {
                    alert("실패");
                }
            });
			
		})
		
		
    });