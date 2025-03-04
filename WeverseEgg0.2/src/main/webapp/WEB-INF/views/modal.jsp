<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/css/modal.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
	<!-- ===== MainRoom ===== -->
		<div id="header">헤더 위치</div>
		<div class="main_bg">
			<div class="game_main">
			
				<div class = 'info_area'>
					<div id="bars">
						<img id="hpBar" src="/images/egg_info/hpBar_full.png">
		    		<img id="fatigueBar" src="/images/egg_info/fatigueBar_full.png">
		    		<div id="jellyBar">
		    			<img id="jelly" src="/images/egg_info/jellyIcon.png">
		    			<p id="My_jelly">99999999</p>
		    			<img id="plus" src="/images/egg_info/plusIcon.png">
		    		</div>
		    		<div id="coinBar" class="gap">
		    			<img id="coin" src="/images/egg_info/coinIcon.png">
		    			<p id="My_Coin">99999999</p>
		    			<img id="plus" src="/images/egg_info/plusIcon.png">
		    		</div>
					</div>
	    		<div id="character_info">
	    			<div id="character_nickname">캐릭터닉네임</div>
	    			<div id="character_type">카리나</div>
	    			<div id="stat_hidden">
	    				<div id="stat_hidden_level">
	    					<p>LV.</p>
	    					<p class="fc">999</p><!-- 캐릭터레벨 -->
	    					<p class="mg_left">(</p>
	    					<p class="fc">99</p><!-- 경험치 -->
	    					<p>/100)</p>
	    				</div>
	    				<hr/>
	    				<div id="stat_hidden_statArea">
		    				<div>
		    					<div class="stat_hidden_stTitle">보컬</div>
		    					<div class="stat_hidden_stTitle">댄스</div>
		    					<div class="stat_hidden_stTitle">랩</div>
		    					<div class="stat_hidden_stTitle">예능</div>
		    					<div class="stat_hidden_stTitle">매력도</div>
		    					<div class="stat_hidden_stTitle">인기도</div>
		    				</div>
		    				<div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">9</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">999</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">999</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">999</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">999</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stTitle">999,999</div>
		    				</div>
	    				</div>
	    			</div>
	    		</div>
				</div>
				
				<!-- 방꾸미기 -->
				<div id="interior_items">
					<div class="wall_area">
						<div id='photo_frame'></div> <!-- 액자 -->
					</div>
					<div class="furniture_area">
						<div id='plant'></div> <!-- 식물 -->
						<div id='sofa'></div> <!-- 소파 -->
						<div id='shelf'></div> <!-- 선반 -->
					</div>
					<div class="floor_area">
					<div id='carpet'></div> <!-- 카페트 -->
					<div id='pet'></div> <!-- 펫 -->
					</div>
				</div>
				
				
				<!-- 캐릭터 -->
				<div class="character_container">
			    <div class="clothing hat"></div>
			    <div class="clothing dress"></div>
				</div>
			
				<!-- 모달 열기 버튼 -->
				<table class="menu">
					<tr>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/practiceBtn.png"></td>
						<td class="open-modal" data-modal="modal2"><img src="/images/egg_menu_btn/activityBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/myBagBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/eventBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/questBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/shopBtn.png"></td>
					</tr>
				</table>
				
						<!-- 모달 창 1 -->
				<div id="modal1" class="modal">
				    <div class="modal-content basic">
				        <span class="close">&times;</span>
				        <h2>기본 모달</h2>
				        <p>이것은 기본 스타일의 모달 창입니다.</p>
				    </div>
				</div>
				<!-- 모달 창 1 -->
				<div id="modal2" class="modal">
				    <div class="modal-content basic">
				        <span class="close">&times;</span>
				        <h2>기본 모달</h2>
				        <p>이것은 기본 스타일의 모달 창입니다.</p>
				    </div>
				</div>
				
				
			</div>
		</div>
		<!-- 끝 ===== MainRoom ===== -->
		
		<!-- 모달 열기 버튼 -->
		<button class="open-modal" data-modal="modal1">트레이닝 선택</button>
		<button class="open-modal" data-modal="modal2">활동 선택</button>
		
		<!-- 모달 창 1 -->
		<div id="modal1" class="modal">
		    <div class="modal-frame dark">
		    	<div class="modal-top">
		    		<img id="hpBar" src="/images/hpBar_full.png">
		    		<img id="fatigueBar" src="/images/fatigueBar_full.png">
		    		<div id="jellyBar">
		    			<img id="jelly" src="/images/jellyIcon.png">
		    			<p id="My_jelly">99999999</p>
		    			<img id="plus" src="/images/plusIcon.png">
		    		</div>
		    		<div id="coinBar">
		    			<img id="coin" src="/images/coinIcon.png">
		    			<p id="My_Coin">99999999</p>
		    			<img id="plus" src="/images/plusIcon.png">
		    		</div>
		        	<span class="close">나가기<strong class="close_icon">&gt;</strong></span>
		    	</div>
		    	<div class="modal-title">
			        <h2>트레이닝 선택</h2>
		    	</div>
		        <div class="modal-content">
		        	<div class="modal-item" id="vocal_training">
						<div class="training_img">
							<img class="background-image" src="/images/vocal_training.png">
		        			<div class="training_img_text">
			        			<p>보컬<span class="positive">+9</span></p>
			        			<p>체력<span class="negative">-20</span></p>
			        			<p>피로<span class="negative">-20</span></p>
			        			<p class="coin"><img class="price_coin_img" src="/images/coinIcon.png">50000</p>
		        			</div>
						</div>
		        		<div class="training_text">
		        			<h2>보컬 트레이닝</h2>
		        			<p>보컬 능력치를<br/>올릴 수 있는 트레이닝</p>
		        		</div>
		        	</div>
		        	<div class="modal-item" id="dance_training">
		        		<div class="training_img">
							<img class="background-image" src="/images/dance_training.png">
		        			<div class="training_img_text">
			        			<p>댄스<span class="positive">+9</span></p>
			        			<p>체력<span class="negative">-20</span></p>
			        			<p>피로<span class="negative">-20</span></p>
			        			<p class="coin"><img class="price_coin_img" src="/images/coinIcon.png">50000</p>
		        			</div>
						</div>
		        		<div class="training_text">
		        			<h2>댄스 트레이닝</h2>
		        			<p>댄스 능력치를<br/>올릴 수 있는 트레이닝</p>
		        		</div>
		        	</div>
		        	<div class="modal-item" id="rap_training">
		        		<div class="training_img">
							<img class="background-image" src="/images/rap_training.png">
		        			<div class="training_img_text">
			        			<p>랩<span class="positive">+9</span></p>
			        			<p>체력<span class="negative">-20</span></p>
			        			<p>피로<span class="negative">-20</span></p>
			        			<p class="coin"><img class="price_coin_img" src="/images/coinIcon.png">50000</p>
		        			</div>
						</div>
		        		<div class="training_text">
		        			<h2>랩 트레이닝</h2>
		        			<p>랩 능력치를<br/>올릴 수 있는 트레이닝</p>
		        		</div>
		        	</div>
		        	<div class="modal-item" id="enter_training">
		        		<div class="training_img">
							<img class="background-image" src="/images/enter_training.png">
		        			<div class="training_img_text">
			        			<p>예능<span class="positive">+9</span></p>
			        			<p>체력<span class="negative">-20</span></p>
			        			<p>피로<span class="negative">-20</span></p>
			        			<p class="coin"><img class="price_coin_img" src="/images/coinIcon.png">50000</p>
		        			</div>
						</div>
		        		<div class="training_text">
		        			<h2>예능 트레이닝</h2>
		        			<p>예능 능력치를<br/>올릴 수 있는 트레이닝</p>
		        		</div>
		        	</div>
		        </div>
		    </div>
		</div>
		
		<!-- 모달 창 2 -->
		<div id="modal2" class="modal">
		    <div class="modal-frame dark">
		    	<div class="modal-top">
		    		<img id="hpBar" src="/images/hpBar_full.png">
		    		<img id="fatigueBar" src="/images/fatigueBar_full.png">
		    		<div id="jellyBar">
		    			<img id="jelly" src="/images/jellyIcon.png">
		    			<p id="My_jelly">99999999</p>
		    			<img id="plus" src="/images/plusIcon.png">
		    		</div>
		    		<div id="coinBar">
		    			<img id="coin" src="/images/coinIcon.png">
		    			<p id="My_Coin">99999999</p>
		    			<img id="plus" src="/images/plusIcon.png">
		    		</div>
		        	<span class="close">나가기<strong class="close_icon">&gt;</strong></span>
		    	</div>
		    	<div class="modal-title">
			        <h2>활동 선택</h2>
		    	</div>
		        <div class="modal-content">
		        	<div class="modal-item" id="vocal_training">
						<div class="training_img">
							<img class="background-image" src="/images/vocal_training.png">
		        			<div class="training_img_text">
			        			<p>랩<span class="positive">50▲</span></p>
			        			<p>보컬<span class="positive">50▲</span></p>
			        			<p>체력<span class="negative">-20</span></p>
			        			<p>피로<span class="negative">-20</span></p>
			        			<p class="coin"><img class="price_coin_img" src="/images/coinIcon.png">50000</p>
		        			</div>
						</div>
		        		<div class="training_text">
		        			<h2>음악방송 출연</h2>
		        			<p>음악방송에 출연하여<br/>인기도를 올려보세요</p>
		        		</div>
		        	</div>
		        	<div class="modal-item" id="dance_training">
		        		<div class="training_img">
							<img class="background-image" src="/images/enter_activity.png">
		        			<div class="training_img_text">
			        			<p>예능<span class="positive">120▲</span></p>
			        			<p>체력<span class="negative">-20</span></p>
			        			<p>피로<span class="negative">-20</span></p>
			        			<p class="coin"><img class="price_coin_img" src="/images/coinIcon.png">50000</p>
		        			</div>
						</div>
		        		<div class="training_text">
		        			<h2>예능활영</h2>
		        			<p>예능을 촬영하여<br/>인기도를 올려보세요</p>
		        		</div>
		        	</div>
		        	<div class="modal-item" id="rap_training">
		        		<div class="training_img">
							<img class="background-image" src="/images/concert_activity.png">
		        			<div class="training_img_text">
			        			<p>보컬<span class="positive">75▲</span></p>
			        			<p>댄스<span class="positive">75▲</span></p>
			        			<p>체력<span class="negative">-20</span></p>
			        			<p>피로<span class="negative">-20</span></p>
			        			<p class="coin"><img class="price_coin_img" src="/images/coinIcon.png">50000</p>
		        			</div>
						</div>
		        		<div class="training_text">
		        			<h2>콘서트</h2>
		        			<p>콘서트를 개최하여<br/>팬들에게 감동을 주세요</p>
		        		</div>
		        	</div>
		        	<div class="modal-item" id="enter_training">
		        		<div class="training_img">
							<img class="background-image" src="/images/enter_training.png">
		        			<div class="training_img_text">
			        			<p>인기도<span class="positive">500▲</span></p>
			        			<p>체력<span class="negative">-20</span></p>
			        			<p>피로<span class="negative">-20</span></p>
			        			<p class="coin"><img class="price_coin_img" src="/images/coinIcon.png">50000</p>
		        			</div>
						</div>
		        		<div class="training_text">
		        			<h2>팬싸인회</h2>
		        			<p>펜싸인회를 통해 팬과<br/>소통하는 시간을 보내세요</p>
		        		</div>
		        	</div>
		        </div>
		    </div>
		</div>
		
		
		
		
		<!-- 퀘스트 모달 -->
		<div id="modalq" class="modal">
		    <div class="modal-frame dark">
		    	<div class="modal-top">
		    		<img id="hpBar" src="images/modal/hpBar_full.png">
		    		<img id="fatigueBar" src="images/modal/fatigueBar_full.png">
		    		<div id="jellyBar">
		    			<img id="jelly" src="images/modal/jellyIcon.png">
		    			<p id="My_jelly">99999999</p>
		    			<img id="plus" src="images/modal/plusIcon.png">
		    		</div>
		    		<div id="coinBar">
		    			<img id="coin" src="images/modal/coinIcon.png">
		    			<p id="My_Coin">99999999</p>
		    			<img id="plus" src="images/modal/plusIcon.png">
		    		</div>
		        	<span class="close">나가기<strong class="close_icon">&gt;</strong></span>
		    	</div>


		    	<div class="modal-quest-title">
			        <div>퀘스트</div>
		    	</div>


		        <div class="modal-quest">
		        	<div id="quest_layout">
		        		<ul class="quest-title">
		        			<li class="today_quest"><a>일일 퀘스트</a></li>
		        			<li><a>주간 퀘스트</a></li>
		        		</ul>	
						<ul class="quest-list">
							<!-- 반복 -->
							<li>
								<div class="quest_content">
									<div class="quest_content_coin">
										<img src="images/modal/coinIcon_big.png" alt="">
										<span>999,999</span>
									</div>
									<div class="quest_content_title">
										<div class="quest_content_titsub">연습만이 살 길</div>
										<div class="quest_content_tit">보컬 트레이닝을 시키자!</div>
									</div>
									<div class="quest_content_rate">
										<span>0/10</span>
									</div>
								</div>
							</li>
							<!-- 반복 끝 -->
							<li>
								<div class="quest_content">
									<div class="quest_content_coin">
										<img src="images/modal/coinIcon_big.png" alt="">
										<span>999,999</span>
									</div>
									<div class="quest_content_title">
										<div class="quest_content_titsub">연습만이 살 길</div>
										<div class="quest_content_tit">보컬 능력치 100 만들기</div>
									</div>
									<div class="quest_content_rate clear">
										<span>보상받기</span>
									</div>
								</div>
							</li>
							<li>
								<div class="quest_content">
									<div class="quest_content_coin">
										<img src="images/modal/coinIcon_big.png" alt="">
										<span>999,999</span>
									</div>
									<div class="quest_content_title">
										<div class="quest_content_titsub">연습만이 살 길</div>
										<div class="quest_content_tit">보컬 트레이닝을 시키자!</div>
									</div>
									<div class="quest_content_rate">
										<span>1/10</span>
									</div>
								</div>
							</li>

							<script>
							  document.querySelectorAll(".quest_content_rate").forEach(function (element) {
								let statusText = element.querySelector("span").innerText.trim();

								// ✅ "0 / 10" 같은 진행 상태를 "보상받기"로 변경
								if (statusText.includes("/")) {
										let [current, total] = statusText.split(" / ").map(Number);
										if (current >= total) {
												element.querySelector("span").innerText = "보상받기";
												element.classList.add("clear"); // "보상받기" 상태 CSS 적용
										}
								}

								// ✅ "보상받기" 클릭 시 "받기완료"로 변경
								element.addEventListener("click", function () {
										if (this.querySelector("span").innerText === "보상받기") {
												this.querySelector("span").innerText = "받기완료";
												this.classList.remove("clear"); // "보상받기" 클래스 제거
												this.classList.add("reward"); // "받기완료" 상태 CSS 적용
										}
									});
								});
							</script>

							<li>
								<div class="quest_content">
									<div class="quest_content_coin">
										<img src="images/modal/coinIcon_big.png" alt="">
										<span>999,999</span>
									</div>
									<div class="quest_content_title">
										<div class="quest_content_titsub">연습만이 살 길</div>
										<div class="quest_content_tit">보컬 트레이닝을 시키자!</div>
									</div>
									<div class="quest_content_rate">
										<span> 0 </span> / 
										<span> 10 </span>
									</div>
								</div>
							</li>
						</ul>
		        	</div>
		        	
		        </div>
		    </div>
		</div>


		<!-- 이벤트 모달 -->
		<div id="modale" class="modal">
		    <div class="modal-frame dark">
		    	<div class="modal-top">
		    		<img id="hpBar" src="images/modal/hpBar_full.png">
		    		<img id="fatigueBar" src="images/modal/fatigueBar_full.png">
		    		<div id="jellyBar">
		    			<img id="jelly" src="images/modal/jellyIcon.png">
		    			<p id="My_jelly">99999999</p>
		    			<img id="plus" src="images/modal/plusIcon.png">
		    		</div>
		    		<div id="coinBar">
		    			<img id="coin" src="images/modal/coinIcon.png">
		    			<p id="My_Coin">99999999</p>
		    			<img id="plus" src="images/modal/plusIcon.png">
		    		</div>
		        	<span class="close">나가기<strong class="close_icon">&gt;</strong></span>
		    	</div>


		    	<div class="modal-event-title">
			        <div>이벤트</div>
		    	</div>
		        <div class="modal-event">
		        	<div id="event_layout">
		        		<ul class="event-title">
		        			<li class="event_item" data-image="images/modal/event1.png"><a onclick="">2월 발렌타인 BIG EVENT</a></li>
		        			<li class="event_item" data-image="images/modal/event2.png"><a onclick="">화이트엔젤 VS 다크히어로</a></li>
		        		</ul>	
						<div class="event_content">
							<img id="eventImage" src="images/modal/event1.png" alt="Event Image">
						</div>
		        </div>
		    </div>
		</div>
		<script>
			document.querySelectorAll('.event-title li').forEach(function (li) {
				li.addEventListener('click', function () {
					// 클릭된 li의 data-image 속성값을 가져와 이미지 변경
					var imageUrl = li.getAttribute('data-image');
					document.getElementById('eventImage').src = imageUrl;

					// 모든 li에서 active 클래스를 제거
					document.querySelectorAll('.event-title li').forEach(function (item) {
							item.classList.remove('active');
					});

					// 클릭된 li에만 active 클래스 추가
					li.classList.add('active');
				});
			});

			// 페이지 로드 시 첫 번째 이벤트 항목을 기본적으로 활성화 상태로 만들기
			document.querySelector('.event-title li').classList.add('active');
			document.querySelector('.quest-title li').classList.add('active');
		</script>
		
		<h2>
			머지 확인용
		</h2>
		
		<script src="/js/modal.js" defer></script>
		
	</body>
</html>