/**
 * 
 */
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
                url: '/admin/itemAdd',  // 서버의 업로드 엔드포인트
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
                url: '/admin/itemInfoAdd',  // 서버의 업로드 엔드포인트
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
		
		// 아이템 정보 수정
		$("#update_item-info").change(function () {
		        let selectedText = $(this).find("option:selected").text();

		        // 정규식을 이용하여 값 추출
		        let regex = /회복 : (\d+), 매력도 : (\d+), 댄스 : (\d+), 보컬 : (\d+), 랩 : (\d+), 예능 : (\d+)/;
		        let match = selectedText.match(regex);
				
				console.log(match)

		        if (match) {
		            $("#update_fatigue_recovery").val(match[1]); // 피로 회복량
		            $("#update_charm").val(match[2]); // 매력도
		            $("#update_dance").val(match[3]); // 댄스
		            $("#update_vocal").val(match[4]); // 보컬
		            $("#update_rap").val(match[5]); // 랩
		            $("#update_entertainment").val(match[6]); // 예능
		        }
		 });
		 
		 $('#update_item_info_save').on('click', function(event){
		 			event.preventDefault();
		 			var charm = $('#update_charm').val();
		 			var dance = $('#update_dance').val();
		 			var rap = $('#update_rap').val();
		 			var vocal = $('#update_vocal').val();
		 			var entertainment = $('#update_entertainment').val();
		 			var fatigue_recovery = $('#update_fatigue_recovery').val();
		 			var list = $('#update_item-info').val().split('_');
					var itemInfoId = list[1];
					console.log(itemInfoId);
		 			
		 			$.ajax({
		                 url: '/admin/itemInfoUpdate',  // 서버의 업로드 엔드포인트
		                 type: 'POST',
		                 data: {
							'itemInfoId': itemInfoId,
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
			
			// 아이템 삭제
			$(".delete_item_info_save").click(function(event) {
			        event.preventDefault(); // 기본 폼 제출 방지

					var itemId = $(this).closest("tr").find("#item_id").text().trim();

			        if (!itemId) {
			            alert("삭제할 아이템을 선택해주세요.");
			            return;
			        }

			        if (!confirm("정말 삭제하시겠습니까?")) {
			            return;
			        }

					console.log(itemId);
			        $.ajax({
			            url: "/admin/itemDelete", // 서버에서 처리할 URL
			            type: "POST",
			            data: { itemId: itemId },
			            success: function(response) {
			                alert("아이템이 삭제되었습니다.");
			                //location.reload(); // 페이지 새로고침
			            },
			            error: function(xhr) {
			                alert("삭제 실패: " + xhr.responseText);
			            }
			        });
			    });
			
			// 그룹 추가
			$('#add_group').click(function(event){
				event.preventDefault();
				var group_name = $('#group_name').val();
				var group_member_count = $('#group_member_count').val();
				var group_gender = $('#group_gender').val();
				
				console.log(group_name);
				console.log(group_member_count);
				console.log(group_gender);
				
				$.ajax({
		            url: "/admin/addGroup", // 서버에서 처리할 URL
		            type: "POST",
		            data: {
						group_name: group_name,
						member_count:group_member_count,
						group_gender:group_gender
					},
		            success: function(response) {
		                alert("추가되었습니다.");
		                //location.reload(); // 페이지 새로고침
		            },
		            error: function(xhr) {
		                alert("추가 실패: " + xhr.responseText);
		            }
		        });
				
			})
			
			// 그룹 수정
			$("#group_update").change(function () {
			    let selectedText = $(this).find("option:selected").text();
				
			    // 정규식을 이용하여 값 추출 (ID, 그룹명, 성별, 멤버 수)
			    let regex = /^(\d+),\s(.+?),\s(남자|여자|혼성),\s(\d+)\s*명$/;
			    let match = selectedText.match(regex);
				
			    if (match) {
			        $("#update_group_name").val(match[2].trim()); // 그룹 이름 (공백 제거)
			        $("#update_group_gender").val(match[3]); // 성별
			        $("#update_group_member_count").val(match[4]); // 멤버 수
			    }
			});
			
			$("#update_group").click(function(event){
				event.preventDefault();
				
				var groupId = $('#group_update').val();
				var group_name = $('#update_group_name').val();
				var group_member_count = $('#update_group_member_count').val();
				var group_gender = $('#update_group_gender').val();
				
				console.log(groupId);
				console.log(group_name);
				console.log(group_member_count);
				console.log(group_gender);
				
				$.ajax({
		            url: "/admin/updateGroup", // 서버에서 처리할 URL
		            type: "POST",
		            data: {
						groupId: groupId,
						group_name: group_name,
						member_count:group_member_count,
						group_gender:group_gender
					},
		            success: function(response) {
		                alert("수정되었습니다.");
		                //location.reload(); // 페이지 새로고침
		            },
		            error: function(xhr) {
		                alert("추가 실패: " + xhr.responseText);
		            }
		        });
				
			})
			
			// 그룹 삭제
			$("#delete_group").click(function(evnet){
				event.preventDefault();
				
				var groupId = $('#group_delete').val();
				
				console.log(groupId);
				
				$.ajax({
		            url: "/admin/deleteGroup", // 서버에서 처리할 URL
		            type: "POST",
		            data: {
						groupId: groupId,
					},
		            success: function(response) {
		                alert("삭제되었습니다.");
		                //location.reload(); // 페이지 새로고침
		            },
		            error: function(xhr) {
		                alert("삭제 실패: " + xhr.responseText);
		            }
		        });
				
			})
			
			// 아티스트 추가
			$('#artist_save').click(function(event){
				event.preventDefault();
				
				var artistName = $('#artist_name').val();
				var groupId = $('#artist_group').val();
				
				$.ajax({
		            url: "/admin/addArtistName", // 서버에서 처리할 URL
		            type: "POST",
		            data: {
						groupId: groupId,
						artistName:artistName
					},
		            success: function(response) {
		                alert("추가되었습니다.");
		                //location.reload(); // 페이지 새로고침
		            },
		            error: function(xhr) {
		                alert("삭제 실패: " + xhr.responseText);
		            }
		        });
				
			})
			
			// 아티스트 수정
			$("#update_artist_group").change(function () {
			    let selectedText = $(this).find("option:selected").text();

			    // 정규식을 이용하여 값 추출 (ID, 그룹명, 아티스트명)
			    let regex = /^(\d+),\s(.+?),\s(.+)$/;
			    let match = selectedText.match(regex);

			    if (match) {
			        $("#update_artist_name").val(match[3].trim()); // 아티스트 이름 (공백 제거)
			    }
			});
			
			$("#update_artist_save").click(function(event){
				event.preventDefault();
				
				var artistNId = $('#update_artist_group').val();
				var artistName = $('#update_artist_name').val();
				
				console.log(artistNId);
				console.log(artistName);
				
				$.ajax({
		            url: "/admin/updateArtistName", // 서버에서 처리할 URL
		            type: "POST",
		            data: {
						artistNId: artistNId,
						artistName:artistName
					},
		            success: function(response) {
		                alert("수정되었습니다.");
		                //location.reload(); // 페이지 새로고침
		            },
		            error: function(xhr) {
		                alert("삭제 실패: " + xhr.responseText);
		            }
		        });
				
			})
			
			// 아티스트 삭제
			$("#delete_artist_save").click(function(event){
				event.preventDefault();
				
				var artistNId = $('#delete_artist_group').val();
				
				console.log(artistNId);
				
				$.ajax({
		            url: "/admin/deleteArtistName", // 서버에서 처리할 URL
		            type: "POST",
		            data: {
						artistNId: artistNId
					},
		            success: function(response) {
		                alert("삭제되었습니다.");
		                //location.reload(); // 페이지 새로고침
		            },
		            error: function(xhr) {
		                alert("삭제 실패: " + xhr.responseText);
		            }
		        });
				
			 })
			 
			 // 연습 타입 추가
			 $("#practiceType_save").click(function(event){
				event.preventDefault();
				
				var practiceType = $("#practiceType").val();
				
				console.log(practiceType);
				
				$.ajax({
		            url: "/admin/addpracticeType", // 서버에서 처리할 URL
		            type: "POST",
		            data: {
						practiceType: practiceType
					},
		            success: function(response) {
		                alert("추가되었습니다.");
		                //location.reload(); // 페이지 새로고침
		            },
		            error: function(xhr) {
		                alert("삭제 실패: " + xhr.responseText);
		            }
		        });
				
			 })
			 
			 // 연습 타입 삭제
			 $("#delete_practiceType_save").click(function(event){
 				event.preventDefault();
 				
 				var practiceType = $("#delete_practiceType").val();
 				
 				console.log(practiceType);
 				
 				$.ajax({
 		            url: "/admin/deletepracticeType", // 서버에서 처리할 URL
 		            type: "POST",
 		            data: {
 						practiceType: practiceType
 					},
 		            success: function(response) {
 		                alert("삭제되었습니다.");
 		                //location.reload(); // 페이지 새로고침
 		            },
 		            error: function(xhr) {
 		                alert("삭제 실패: " + xhr.responseText);
 		            }
 		        });
 				
 			 })
			 
			 // 연습 추가
			 $("#add_practice_save").click(function(event){
 				event.preventDefault();
 				
 				var practiceTypeId = $("#add_practice").val();
				var price = $("#add_price").val();
				var health = $("#add_health").val();
				var fatigue = $("#add_fatigue").val();
 				
 				console.log(practiceTypeId + ", " + price + ", " + health + ", " + fatigue);
				
				$.ajax({
 		            url: "/admin/addPractice", // 서버에서 처리할 URL
 		            type: "POST",
 		            data: {
 						practiceTypeId: practiceTypeId,
						price: price,
						health: health,
						fatigue: fatigue
 					},
 		            success: function(response) {
 		                alert("추가되었습니다.");
 		                //location.reload(); // 페이지 새로고침
 		            },
 		            error: function(xhr) {
 		                alert("삭제 실패: " + xhr.responseText);
 		            }
 		        });
 				
 				
 			 })
			 
			 // 연습 수정
			 $("#update_practice").change(function () {
			     let selectedText = $(this).find("option:selected").text();

			     // 정규식을 이용하여 값 추출 (ID, 가격, 체력, 피로도)
			     let regex = /^(\d+),\s([\d.]+),\s([\d.]+),\s([\d.]+)$/;
			     let match = selectedText.match(regex);

			     if (match) {
			         $("#update_price").val(match[2].trim());   // 비용
			         $("#update_health").val(match[3].trim());  // 체력
			         $("#update_fatigue").val(match[4].trim()); // 피로도
			     }
			 });
			 
			 
			$("#update_practice_save").click(function(event){
	  				event.preventDefault();
	  				
	  				var update_practice = $("#update_practice").val();
	 				var price = $("#update_price").val();
	 				var health = $("#update_health").val();
	 				var fatigue = $("#update_fatigue").val();
	  				
	  				console.log(update_practice + ", " + price + ", " + health + ", " + fatigue);
	 				
	 				$.ajax({
	  		            url: "/admin/updatePractice", // 서버에서 처리할 URL
	  		            type: "POST",
	  		            data: {
	  						updatePracticeId: update_practice,
	 						price: price,
	 						health: health,
	 						fatigue: fatigue
	  					},
	  		            success: function(response) {
	  		                alert("수정되었습니다.");
	  		                //location.reload(); // 페이지 새로고침
	  		            },
	  		            error: function(xhr) {
	  		                alert("삭제 실패: " + xhr.responseText);
	  		            }
	  		        });
	  				
	  				
	  			 })
			
			// 삭제하기
			$("#delete_practice_save").click(function(event){
	  				event.preventDefault();
	  				
	  				var practiceId = $("#delete_practice").val();
	  				
	 				
	 				$.ajax({
	  		            url: "/admin/deletePractice", // 서버에서 처리할 URL
	  		            type: "POST",
	  		            data: {
	  						practiceId: practiceId
	  					},
	  		            success: function(response) {
	  		                alert("삭제되었습니다.");
	  		                //location.reload(); // 페이지 새로고침
	  		            },
	  		            error: function(xhr) {
	  		                alert("삭제 실패: " + xhr.responseText);
	  		            }
	  		        });
	  				
	  				
	  			 })
				 
			// 춤 추가
			$("#add_dance_save").click(function(event){
	  				event.preventDefault();
	  				
	  				var practiceId = $("#add_dance").val();
					var name = $("#add_dance_name").val();
					var point = $("#add_dance_point").val();
	  				
	 				
	 				$.ajax({
	  		            url: "/admin/addDance", // 서버에서 처리할 URL
	  		            type: "POST",
	  		            data: {
	  						practiceId: practiceId,
							name: name,
							point: point
	  					},
	  		            success: function(response) {
	  		                alert("추가되었습니다.");
	  		                //location.reload(); // 페이지 새로고침
	  		            },
	  		            error: function(xhr) {
	  		                alert("삭제 실패: " + xhr.responseText);
	  		            }
	  		        });
	  				
	  				
	  			 })
				 
			// 춤 삭제
			$("#delete_dance_save").click(function(event){
	  				event.preventDefault();
	  				
	  				var danceId = $("#delete_dance").val();
	  				
	 				
	 				$.ajax({
	  		            url: "/admin/deleteDance", // 서버에서 처리할 URL
	  		            type: "POST",
	  		            data: {
	  						danceId: danceId
	  					},
	  		            success: function(response) {
	  		                alert("삭제되었습니다.");
	  		                //location.reload(); // 페이지 새로고침
	  		            },
	  		            error: function(xhr) {
	  		                alert("삭제 실패: " + xhr.responseText);
	  		            }
	  		        });
	  				
	  				
	  			 })
				 
				 // 보컬 추가
	 			$("#add_vocal_save").click(function(event){
	 	  				event.preventDefault();
	 	  				
	 	  				var practiceId = $("#add_vocal").val();
	 					var name = $("#add_vocal_name").val();
	 					var point = $("#add_vocal_point").val();
	 	  				
	 	 				
	 	 				$.ajax({
	 	  		            url: "/admin/addVocal", // 서버에서 처리할 URL
	 	  		            type: "POST",
	 	  		            data: {
	 	  						practiceId: practiceId,
	 							name: name,
	 							point: point
	 	  					},
	 	  		            success: function(response) {
	 	  		                alert("추가되었습니다.");
	 	  		                //location.reload(); // 페이지 새로고침
	 	  		            },
	 	  		            error: function(xhr) {
	 	  		                alert("삭제 실패: " + xhr.responseText);
	 	  		            }
	 	  		        });
	 	  				
	 	  				
	 	  			 })
					 
				// 보컬 삭제
				$("#delete_vocal_save").click(function(event){
		  				event.preventDefault();
		  				
		  				var vocalId = $("#delete_vocal").val();
		  				
		 				
		 				$.ajax({
		  		            url: "/admin/deleteVocal", // 서버에서 처리할 URL
		  		            type: "POST",
		  		            data: {
		  						vocalId: vocalId
		  					},
		  		            success: function(response) {
		  		                alert("삭제되었습니다.");
		  		                //location.reload(); // 페이지 새로고침
		  		            },
		  		            error: function(xhr) {
		  		                alert("삭제 실패: " + xhr.responseText);
		  		            }
		  		        });
		  				
		  				
		  			 })
					 
				 // 랩 추가
	 			$("#add_rap_save").click(function(event){
	 	  				event.preventDefault();
	 	  				
	 	  				var practiceId = $("#add_rap").val();
	 					var name = $("#add_rap_name").val();
	 					var point = $("#add_rap_point").val();
	 	  				
	 	 				
	 	 				$.ajax({
	 	  		            url: "/admin/addRap", // 서버에서 처리할 URL
	 	  		            type: "POST",
	 	  		            data: {
	 	  						practiceId: practiceId,
	 							name: name,
	 							point: point
	 	  					},
	 	  		            success: function(response) {
	 	  		                alert("추가되었습니다.");
	 	  		                //location.reload(); // 페이지 새로고침
	 	  		            },
	 	  		            error: function(xhr) {
	 	  		                alert("삭제 실패: " + xhr.responseText);
	 	  		            }
	 	  		        });
	 	  				
	 	  				
	 	  			 })
					 
				// 랩 삭제
				$("#delete_rap_save").click(function(event){
		  				event.preventDefault();
		  				
		  				var rapId = $("#delete_rap").val();
		  				
		 				
		 				$.ajax({
		  		            url: "/admin/deleteRap", // 서버에서 처리할 URL
		  		            type: "POST",
		  		            data: {
		  						rapId: rapId
		  					},
		  		            success: function(response) {
		  		                alert("삭제되었습니다.");
		  		                //location.reload(); // 페이지 새로고침
		  		            },
		  		            error: function(xhr) {
		  		                alert("삭제 실패: " + xhr.responseText);
		  		            }
		  		        });
		  				
		  				
		  			 })
					 
				 // 랩 추가
	 			$("#add_enter_save").click(function(event){
	 	  				event.preventDefault();
	 	  				
	 	  				var practiceId = $("#add_enter").val();
	 					var name = $("#add_enter_name").val();
	 					var point = $("#add_enter_point").val();
	 	  				
	 	 				
	 	 				$.ajax({
	 	  		            url: "/admin/addEnter", // 서버에서 처리할 URL
	 	  		            type: "POST",
	 	  		            data: {
	 	  						practiceId: practiceId,
	 							name: name,
	 							point: point
	 	  					},
	 	  		            success: function(response) {
	 	  		                alert("추가되었습니다.");
	 	  		                //location.reload(); // 페이지 새로고침
	 	  		            },
	 	  		            error: function(xhr) {
	 	  		                alert("삭제 실패: " + xhr.responseText);
	 	  		            }
	 	  		        });
	 	  				
	 	  				
	 	  			 })
					 
				// 랩 삭제
				$("#delete_enter_save").click(function(event){
		  				event.preventDefault();
		  				
		  				var enterId = $("#delete_enter").val();
		  				
		 				
		 				$.ajax({
		  		            url: "/admin/deleteEtner", // 서버에서 처리할 URL
		  		            type: "POST",
		  		            data: {
		  						enterId: enterId
		  					},
		  		            success: function(response) {
		  		                alert("삭제되었습니다.");
		  		                //location.reload(); // 페이지 새로고침
		  		            },
		  		            error: function(xhr) {
		  		                alert("삭제 실패: " + xhr.responseText);
		  		            }
		  		        });
		  				
		  				
		  			 })
		
		
		
});