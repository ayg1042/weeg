<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/css/header.css">
		<link rel="stylesheet" href="/css/modal.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
	<!-- ===== MainRoom ===== -->
		<!-- 헤더 -->
		 <header>
		     <div id="header_wrap">
		       <div class="main_logo">
		         <a href="/">
		           <img src="../images/main/weverse_logo.png" alt="">
		         </a>
		       </div>
		       <div class="header_action">
		         <button type="button" class="header_search">
		           <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
		             <circle cx="17" cy="18" r="9.9" stroke="currentColor" stroke-width="2.2"></circle>
		             <rect x="22.5701" y="25.787" width="2.5" height="10.8772" rx="1.25" transform="rotate(-45 22.5701 25.787)" fill="currentColor"></rect>
		           </svg>
		         </button>
		         <button type="button" class="header_alram">
		           <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
		             <path d="M14.752 27.6113C14.752 28.9004 15.2232 30.1341 16.0688 31.0351C16.9144 31.9361 18.0649 32.4629 19.257 32.4629C20.4491 32.4629 21.5996 31.95 22.4452 31.0351C23.2907 30.1203 23.762 28.8866 23.762 27.6113" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
		             <path d="M29.3898 27.2924C30.1522 27.2924 30.6789 26.5578 30.4433 25.837C29.8749 24.132 29.3066 22.025 29.3066 20.8745V17.4784C29.3066 10.3535 25.1204 6.51386 19.2569 6.5H19.2431C13.3935 6.5 9.1934 10.3535 9.1934 17.4784V20.8745C9.1934 22.025 8.62507 24.132 8.05675 25.837C7.8211 26.5578 8.34784 27.2924 9.11023 27.2924H29.3898V27.2924Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
		           </svg>
		         </button>
		         <button type="button" class="header_mypage">
		           <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
		             <path d="M19.0176 18.5246C22.2001 18.5246 24.78 15.9447 24.78 12.7623C24.78 9.57987 22.2001 7 19.0176 7C15.8352 7 13.2553 9.57987 13.2553 12.7623C13.2553 15.9447 15.8352 18.5246 19.0176 18.5246Z" stroke="currentColor" stroke-width="2" stroke-miterlimit="10"></path>
		             <path d="M19.0175 31.8641C22.104 31.8641 24.9255 31.6919 27.0715 31.0958C28.2637 30.7646 29.4691 30.248 30.1182 29.2545C30.6481 28.4332 30.6349 27.2675 30.0255 26.2343C28.6214 23.8234 24.3559 21.6509 19.0837 21.6509H18.9115C13.6394 21.6509 9.37393 23.8234 7.96978 26.2343C7.37368 27.2675 7.34719 28.4332 7.87706 29.2545C8.52615 30.248 9.73159 30.7779 10.9238 31.0958C13.083 31.6786 15.8913 31.8641 18.9778 31.8641H19.0175Z" stroke="currentColor" stroke-width="2" stroke-miterlimit="10"></path>
		           </svg>
		         </button>
		         <button type="button" class="header_setting">
		           <svg width="38" height="38" viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
		             <path d="M19.0186 25.2673C22.2028 25.2673 24.7731 22.6969 24.7731 19.5128C24.7731 16.3286 22.2028 13.7583 19.0186 13.7583C15.8345 13.7583 13.2642 16.3286 13.2642 19.5128C13.2642 22.6969 15.8345 25.2673 19.0186 25.2673Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
		             <path d="M30.4258 16.2136L28.0729 14.7558C27.9578 14.5384 27.8299 14.3338 27.702 14.1164L27.6253 11.3287C27.5997 10.6893 27.4079 9.92204 26.7174 9.52562L23.6995 7.78649C23.1496 7.4668 22.5102 7.58189 21.8581 7.95273L19.3645 9.29544C19.2494 9.29544 19.1471 9.28266 19.032 9.28266C18.9297 9.28266 18.8402 9.28266 18.7506 9.29544L16.2442 7.93994C15.6816 7.64583 14.9143 7.42844 14.2238 7.82486L11.2059 9.56399C10.656 9.88368 10.4386 10.4975 10.4258 11.2392L10.3491 14.1292C10.2468 14.2827 10.1445 14.4361 10.055 14.6023L7.61253 16.1113C7.07545 16.4566 6.5 17.0064 6.5 17.7993V21.2903C6.5 21.9169 6.92199 22.4156 7.56138 22.7993L9.99105 24.2954C10.0806 24.4617 10.1829 24.6279 10.2852 24.7942L10.3619 27.6714C10.3875 28.3108 10.5793 29.0781 11.2698 29.4745L14.2877 31.2136C14.8376 31.5333 15.477 31.4182 16.1292 31.0474L18.61 29.7047C18.7506 29.7047 18.8785 29.7302 19.0192 29.7302C19.1087 29.7302 19.1854 29.7302 19.2749 29.7302L21.7558 31.0729C22.3184 31.3671 23.0857 31.5844 23.7762 31.188L26.7941 29.4489C27.344 29.1292 27.5614 28.5154 27.5742 27.7737L27.6509 25.0116C27.7916 24.7942 27.9194 24.5768 28.0473 24.3594L30.3875 22.9144C30.9246 22.5691 31.5 22.0192 31.5 21.2264V17.7353C31.5 17.1087 31.078 16.61 30.4386 16.2264L30.4258 16.2136Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		           </path>
		           </svg>
		         </button>
		         <div class="header_content">
		           <button type="button" class="egg"></button>
		           <button type="button" class="jelly"></button>
		           <button type="button" class="shop"></button>
		         </div>
		       </div>
		     </div>
		 </header>
		<div class="main_bg">
			<div class="game_main">
			
				<div class = 'info_area'>
					<div id="bars">
						<img id="hpBar" src="/images/egg_info/hpBar_full.png">
		    		<img id="fatigueBar" src="/images/egg_info/fatigueBar_full.png">
		    		<div id="jellyBar">
		    			<img id="jelly" src="/images/egg_info/jellyIcon.png">
		    			<p id="My_jelly">${character.member.jelly}</p>
		    			<img id="plus" src="/images/egg_info/plusIcon.png">
		    		</div>
		    		<div id="coinBar" class="gap">
		    			<img id="coin" src="/images/egg_info/coinIcon.png">
		    			<p id="My_Coin">${character.coin}</p>
		    			<img id="plus" src="/images/egg_info/plusIcon.png">
		    		</div>
					</div>
	    		<div id="character_info">
	    			<div id="character_nickname">캐릭터닉네임</div>
	    			<div id="character_type">${character.nickName}</div>
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
			    					<div class="stat_hidden_stTitle">${character.vocal}</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">${character.dance }</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">${character.rap }</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">${character.entertainment}</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stats">
			    					<div class="stat_hidden_stTitle">${character.charm }</div>
			    					<div class="stat_hidden_stTitle mg_left fc">(+99)</div>
		    					</div>
		    					<div class="stat_hidden_stTitle">${character.popularity}</div>
		    				</div>
	    				</div>
	    			</div>
	    		</div>
				</div>
				
				<!-- 방꾸미기 -->
				<div id="interior_items">
					<div class="wall_area">
						<div id='photo_frame'  class="${frame}"></div> <!-- 액자 -->
					</div>
					<div class="furniture_area">
						<div id='plant'  class="${pot}"></div> <!-- 식물 -->
						<div id='sofa'  class="${sofa}"></div> <!-- 소파 -->
						<div id='shelf'  class="${drawer}"></div> <!-- 선반 -->
					</div>
					<div class="floor_area">
					<div id='carpet' class="${carpet}"></div> <!-- 카페트 -->
					<div id='pet' class="${pet}"></div> <!-- 펫 -->
					</div>
				</div>
				
				
				<!-- 캐릭터 -->
				<div class="character_container">
				    <div class="clothing hat"  id="${hat}"></div>
				    <div class="clothing dress" id="${outfit}"></div>
				</div>
							
				<!-- 모달 열기 버튼 -->
				<table class="menu">
					<tr>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/practiceBtn.png"></td>
						<td class="open-modal" data-modal="modal2"><img src="/images/egg_menu_btn/activityBtn.png"></td>
						<td class="open-modal" data-modal="modal4"><img src="/images/egg_menu_btn/myBagBtn.png"></td>
						<td class="open-modal" data-modal="modale"><img src="/images/egg_menu_btn/eventBtn.png"></td>
						<td class="open-modal" data-modal="modalq"><img src="/images/egg_menu_btn/questBtn.png"></td>
						<td class="open-modal" data-modal="modal3"><img src="/images/egg_menu_btn/shopBtn.png"></td>
					</tr>
				</table>
		
			</div>
		</div>
		<!-- 끝 ===== MainRoom ===== -->
		
		<!-- 트레이닝 모달 -->
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
		
		<!-- 활동 모달 -->
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
		
		<!-- 상점 모달 -->
		<div id="modal3" class="modal">
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
		    	<div class="modal-title shop-title">
			        <h2>상점</h2>
		    	</div>
		        <div class="modal-content game-shop">
		        	<div>
		        		<ul class="shop-list">
		        			<li data-tab="shop-outfit" class='active'>의상</li>
		        			<li data-tab="shop-hare">모자</li>
		        			<li data-tab="shop-accessories">펫</li>
		        			<li data-tab="shop-interior">인테리어</li>
		        			<li data-tab="shop-snacks">간식</li>
		        		</ul>
		        	</div>
		        	<section id="shop-outfit" class="tab-content">
		        		<div class="shop-items">
		        			<c:forEach items="${shopList}" var="dto" varStatus="outfit">
		        				<c:if test="${dto.itemInfo.itemType.itemType == 2}">
				        			<div id="shop-item-show-outfit_${dto.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/outfit/${dto.image}">
				        					<p class="item-name">${dto.name }</p>
				        				</div>
				        				<div class="item-price">
				        					<img src="/images/coinIcon.png">
				        					<p>${dto.price}</p>
				        				</div>
				        				<div class="item-options">
				        					<p class="option_danse">${dto.itemInfo.dance}</p>
				        					<p class="option_enter">${dto.itemInfo.entertainment}</p>
				        					<p class="option_rap">${dto.itemInfo.rap}</p>
				        					<p class="option_vocal">${dto.itemInfo.vocal}</p>
				        					<p class="option_char">${dto.itemInfo.charm}</p>
				        				</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
		        		</div>
		        	</section>
		        	<section id="shop-hare" class="tab-content">
		        		<div class="shop-items">
		        			<c:forEach items="${shopList}" var="dto" varStatus="hat">
		        				<c:if test="${dto.itemInfo.itemType.itemType == 1}">
				        			<div id="shop-item-show-hat_${dto.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/hat/${dto.image}">
				        					<p class="item-name">${dto.name }</p>
				        				</div>
				        				<div class="item-price">
				        					<img src="/images/coinIcon.png">
				        					<p>${dto.price}</p>
				        				</div>
				        				<div class="item-options">
				        					<p class="option_danse">${dto.itemInfo.dance}</p>
				        					<p class="option_enter">${dto.itemInfo.entertainment}</p>
				        					<p class="option_rap">${dto.itemInfo.rap}</p>
				        					<p class="option_vocal">${dto.itemInfo.vocal}</p>
				        					<p class="option_char">${dto.itemInfo.charm}</p>
				        				</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
		        		</div>
		        	</section>
		        	
		        	<section id="shop-accessories" class="tab-content">
				        <div class="shop-items">
				            <c:forEach items="${shopList}" var="dto" varStatus="pet">
		        				<c:if test="${dto.itemInfo.itemType.itemType == 3}">
				        			<div id="shop-item-show-pet_${dto.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/pet/${dto.image}">
				        					<p class="item-name">${dto.name }</p>
				        				</div>
				        				<div class="item-price">
				        					<img src="/images/coinIcon.png">
				        					<p>${dto.price}</p>
				        				</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
				        </div>
				    </section>
				
				    <section id="shop-interior" class="tab-content">
				        <div class="shop-items">
				            <c:forEach items="${shopList}" var="dto" varStatus="interior">
		        				<c:if test="${dto.itemInfo.itemType.itemType >= 6 and dto.itemInfo.itemType.itemType <= 10}">
				        			<div id="shop-item-show-interior_${dto.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/interior/${dto.image}">
				        					<p class="item-name">${dto.name }</p>
				        				</div>
				        				<div class="item-price">
				        					<img src="/images/coinIcon.png">
				        					<p>${dto.price}</p>
				        				</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
				        </div>
				    </section>
				
				    <section id="shop-snacks" class="tab-content">
				        <div class="shop-items">
				            <c:forEach items="${shopList}" var="dto" varStatus="consumalbe">
		        				<c:if test="${dto.itemInfo.itemType.itemType == 4}">
				        			<div id="shop-item-show-consumalbe_${dto.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/consumable/${dto.image}">
				        					<p class="item-name">${dto.name }</p>
				        				</div>
				        				<div class="item-price">
				        					<img src="/images/coinIcon.png">
				        					<p>${dto.price}</p>
				        				</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
				        </div>
				    </section>
		        	
		        	<div class="show-character-info">
		        		<div class="show-character">
			        		<img src="/images/test_character.png">
			        		<c:if test="${outfit != null }">
				        		<img class="shop_outfit" src="/images/items/outfit/${outfit}">
			        		</c:if>
			        		<c:if test="${outfit == null }">
			        			<img class="shop_outfit" src="">
			        		</c:if>
			        		<c:if test="${hat != null }">
				        		<img class="shop_hat" src="/images/items/hat/${hat}">
			        		</c:if>
			        		<c:if test="${hat == null }">
			        			<img class="shop_hat" src="">
			        		</c:if>
		        		</div>
		        		<div class="show-item-info">
						    <p class="item_danse"><span class="label">댄스</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						    <p class="item_enter"><span class="label">예능</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						    <p class="item_rap"><span class="label">랩</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						    <p class="item_vocal"><span class="label">보컬</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						    <p class="item_char"><span class="label">매력도</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						</div>
						<div>
							<button class="apply-button">구매하기</button>
						</div>
		        	</div>
		        </div>
		        <div class="item-ne-pr">
		        	<span class="previous"><strong class="close_icon">&lt;</strong>이전</span>
		        	<span class="next">다음<strong class="close_icon">&gt;</strong></span>
		        </div>
		    </div>
		</div>
		<script>
			let selectedHats = [];
			selectedHats.push({ typeName: 'hat', itemId: `${hat_id}` });
			selectedHats.push({ typeName: 'outfit', itemId: `${outfit_id}` });
			selectedHats.push({ typeName: 'pet', itemId: `${pet_id}` });
			selectedHats.push({ typeName: 'pot', itemId: `${pot_id}` });
			selectedHats.push({ typeName: 'sofa', itemId: `${sofa_id}` });
			selectedHats.push({ typeName: 'carpet', itemId: `${carpet_id}` });
			selectedHats.push({ typeName: 'drawer', itemId: `${drawer_id}` });
			selectedHats.push({ typeName: 'frame', itemId: `${frame_id}` });
		</script>
		<!-- 내가방 -->
		<div id="modal4" class="modal">
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
		    	<div class="modal-title shop-title">
			        <h2>내 가방</h2>
		    	</div>
		        <div class="modal-content shop">
		        	<div>
		        		<ul class="shop-list">
		        			<li data-tab="bag-outfit">의상</li>
		        			<li data-tab="bag-hare">모자</li>
		        			<li data-tab="bag-accessories">펫</li>
		        			<li data-tab="bag-interior">인테리어</li>
		        			<li data-tab="bag-snacks">간식</li>
		        		</ul>
		        	</div>
		        	<section id="bag-outfit" class="tab-content">
		        		<div class="shop-items">
		        			<c:forEach items="${invenList}" var="dto">
		        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 2}">
				        			<div id="inven-item-show-outfit_${dto.itemId.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/outfit/${dto.itemId.image}">
				        					<p class="item-name">${dto.itemId.name }</p>
				        				</div>
				        				<div class="item-price">
		        							<c:if test="${outfit == '' or outfit != dto.itemId.image}">
			        							<button class="equipped">장착</button>
				        					</c:if>
				        					<c:if test="${outfit == dto.itemId.image }">
				        						<button class="item-clear">해제</button>
				        					</c:if>
		        						</div>
		        						<div class="item-options">
				        					<p class="option_danse">${dto.itemId.itemInfo.dance}</p>
				        					<p class="option_enter">${dto.itemId.itemInfo.entertainment}</p>
				        					<p class="option_rap">${dto.itemId.itemInfo.rap}</p>
				        					<p class="option_vocal">${dto.itemId.itemInfo.vocal}</p>
				        					<p class="option_char">${dto.itemId.itemInfo.charm}</p>
				        				</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
		        		</div>
		        	</section>
		        	<section id="bag-hare" class="tab-content">
				        <div class="shop-items">
		        			<c:forEach items="${invenList}" var="dto">
		        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 1}">
				        			<div id="inven-item-show-hat_${dto.itemId.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/hat/${dto.itemId.image}">
				        					<p class="item-name">${dto.itemId.name }</p>
				        				</div>
				        				<div class="item-price">
		        							<c:if test="${hat == '' or hat != dto.itemId.image}">
			        							<button class="equipped">장착</button>
				        					</c:if>
				        					<c:if test="${hat == dto.itemId.image }">
				        						<button class="item-clear">해제</button>
				        					</c:if>
		        						</div>
		        						<div class="item-options">
				        					<p class="option_danse">${dto.itemId.itemInfo.dance}</p>
				        					<p class="option_enter">${dto.itemId.itemInfo.entertainment}</p>
				        					<p class="option_rap">${dto.itemId.itemInfo.rap}</p>
				        					<p class="option_vocal">${dto.itemId.itemInfo.vocal}</p>
				        					<p class="option_char">${dto.itemId.itemInfo.charm}</p>
				        				</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
				        </div>
				    </section>
		        	<section id="bag-accessories" class="tab-content">
				        <div class="shop-items">
		        			<c:forEach items="${invenList}" var="dto">
		        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 3}">
				        			<div id="inven-item-show-pet_${dto.itemId.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/pet/${dto.itemId.image}">
				        					<p class="item-name">${dto.itemId.name }</p>
				        				</div>
				        				<div class="item-price">
		        							<c:if test="${pet == '' or pet != dto.itemId.image}">
			        							<button class="equipped">장착</button>
				        					</c:if>
				        					<c:if test="${pet == dto.itemId.image }">
				        						<button class="item-clear">해제</button>
				        					</c:if>
		        						</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
				        </div>
				    </section>
				
				    <section id="bag-interior" class="tab-content">
				        <div class="shop-items">
		        			<c:forEach items="${invenList}" var="dto">
		        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId >= 6 and dto.itemId.itemInfo.itemType.itemTypeId <= 10}">
				        			<div id="inven-item-show-${dto.itemId.itemInfo.itemType.itemTypeId}_interior_${dto.itemId.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/interior/${dto.itemId.image}">
				        					<p class="item-name">${dto.itemId.name }</p>
				        				</div>
				        				<div class="item-price">
					        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 6}">
			        							<c:if test="${pot == '' or pot != dto.itemId.image}">
				        							<button class="equipped">장착</button>
					        					</c:if>
					        					<c:if test="${pot == dto.itemId.image }">
					        						<button class="item-clear">해제</button>
					        					</c:if>
					        				</c:if>
					        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 7}">
			        							<c:if test="${sofa == '' or sofa != dto.itemId.image}">
				        							<button class="equipped">장착</button>
					        					</c:if>
					        					<c:if test="${sofa == dto.itemId.image }">
					        						<button class="item-clear">해제</button>
					        					</c:if>
					        				</c:if>
					        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 8}">
			        							<c:if test="${carpet == '' or carpet != dto.itemId.image}">
				        							<button class="equipped">장착</button>
					        					</c:if>
					        					<c:if test="${carpet == dto.itemId.image }">
					        						<button class="item-clear">해제</button>
					        					</c:if>
					        				</c:if>
					        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 9}">
			        							<c:if test="${drawer == '' or drawer != dto.itemId.image}">
				        							<button class="equipped">장착</button>
					        					</c:if>
					        					<c:if test="${drawer == dto.itemId.image }">
					        						<button class="item-clear">해제</button>
					        					</c:if>
					        				</c:if>
					        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 10}">
			        							<c:if test="${frame == '' or frame != dto.itemId.image}">
				        							<button class="equipped">장착</button>
					        					</c:if>
					        					<c:if test="${frame == dto.itemId.image }">
					        						<button class="item-clear">해제</button>
					        					</c:if>
					        				</c:if>
		        						</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
				        </div>
				    </section>
				
				    <section id="bag-snacks" class="tab-content">
				        <div class="shop-items">
		        			<c:forEach items="${invenList}" var="dto">
		        				<c:if test="${dto.itemId.itemInfo.itemType.itemTypeId == 4}">
				        			<div id="inven-item-show-consumable_${dto.invenId}_${dto.itemId.itemId}" class="shop-item-show">
				        				<div class="item-info">
				        					<img src="/images/items/consumable/${dto.itemId.image}">
				        					<p class="item-name">${dto.itemId.name }</p>
				        				</div>
				        				<div class="item-price">
		        							<button class="ues-item">사용</button>
		        						</div>
				        			</div>
		        				</c:if>
		        			</c:forEach>
				        </div>
				    </section>
		        	<div class="show-character-info">
		        		<div class="show-character">
			        		<img class="" src="/images/test_character.png">
			        		<c:if test="${outfit != null }">			        		
				        		<img id="" class="my_bag_outfit" src="/images/items/outfit/${outfit}">
			        		</c:if>
			        		<c:if test="${outfit == null }">
			        			<img id="" class="my_bag_outfit" src="">
			        		</c:if>
			        		<c:if test="${hat != null }">
				        		<img id="" class="my_bag_hat" src="/images/items/hat/${hat}">
			        		</c:if>
			        		<c:if test="${hat == null }">
			        			<img id="" class="my_bag_hat" src="">
			        		</c:if>
		        		</div>
		        		<div class="show-item-info my_bag_statuse">
						    <p class="item_danse"><span class="label">댄스</span> <span class="value">+50</span></p>
						    <p class="item_enter"><span class="label">예능</span> <span class="value">+50</span></p>
						    <p class="item_rap"><span class="label">랩</span> <span class="value">+50</span></p>
						    <p class="item_vocal"><span class="label">보컬</span> <span class="value">+50</span></p>
						    <p class="item_char"><span class="label">매력도</span> <span class="value">+50</span></p>
						</div>
						<div>
							<button class="save-button">적용하기</button>
							<p class="all-cancel">모두 해제</p>
						</div>
		        	</div>
		        </div>
		        <div class="my-bag-ne-pr">
		        	<span class="previous my-previous"><strong class="close_icon">&lt;</strong>이전</span>
		        	<span class="next my-next">다음<strong class="close_icon">&gt;</strong></span>
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
		
		
		<script src="/js/modal.js" defer></script>
		<script src="/js/shop.js" defer></script>
		<script src="/js/mybag.js" defer></script>
		<script src="/js/characterStyle.js" defer></script>
		
	</body>
</html>