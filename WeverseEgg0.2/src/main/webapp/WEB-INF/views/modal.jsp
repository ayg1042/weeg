<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<td class="open-modal" data-modal="modal4"><img src="/images/egg_menu_btn/myBagBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/eventBtn.png"></td>
						<td class="open-modal" data-modal="modal1"><img src="/images/egg_menu_btn/questBtn.png"></td>
						<td class="open-modal" data-modal="modal3"><img src="/images/egg_menu_btn/shopBtn.png"></td>
					</tr>
				</table>
		
			</div>
		</div>
		<!-- 끝 ===== MainRoom ===== -->
		
		<!-- 모달 열기 버튼 -->
		<button class="open-modal" data-modal="modal1">트레이닝 선택</button>
		<button class="open-modal" data-modal="modal2">활동 선택</button>
		<button class="open-modal" data-modal="modal3">상점</button>
		<button class="open-modal" data-modal="modal4">내 가방</button>
		
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
		        <div class="modal-content shop">
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
	        				<c:set var="count" value="1"/>
		        			<c:forEach items="${shopList}" var="dto" varStatus="outfit">
		        				<c:if test="${dto.itemInfo.itemType.itemType == 2}">
				        			<div id="shop-item-show-outfit_${count}" class="shop-item-show">
				        			<c:set var="count" value="${count+1}"/>
				        				<div class="item-info">
				        					<img src="/images/items/outfit/${dto.image}">
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
		        	<section id="shop-hare" class="tab-content">
		        		<div class="shop-items">
		        			<c:set var="count" value="1"/>
		        			<c:forEach items="${shopList}" var="dto" varStatus="hat">
		        				<c:if test="${dto.itemInfo.itemType.itemType == 1}">
				        			<div id="shop-item-show-hat_${count}" class="shop-item-show">
				        			<c:set var="count" value="${count+1}"/>
				        				<div class="item-info">
				        					<img src="/images/items/hat/${dto.image}">
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
		        	
		        	<section id="shop-accessories" class="tab-content">
				        <div class="shop-items">
				        	<c:set var="count" value="1"/>
				            <c:forEach items="${shopList}" var="dto" varStatus="pet">
		        				<c:if test="${dto.itemInfo.itemType.itemType == 3}">
				        			<div id="shop-item-show-pet_${count}" class="shop-item-show">
				        			<c:set var="count" value="${count+1}"/>
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
				        	<c:set var="count" value="1"/>
				            <c:forEach items="${shopList}" var="dto" varStatus="interior">
		        				<c:if test="${dto.itemInfo.itemType.itemType >= 6 and dto.itemInfo.itemType.itemType <= 10}">
				        			<div id="shop-item-show-interior_${count}" class="shop-item-show">
				        				<c:set var="count" value="${count+1}"/>
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
				        	<c:set var="count" value="1"/>
				            <c:forEach items="${shopList}" var="dto" varStatus="consumalbe">
		        				<c:if test="${dto.itemInfo.itemType.itemType == 4}">
				        			<div id="shop-item-show-consumalbe_${count}" class="shop-item-show">
				        			<c:set var="count" value="${count+1}"/>
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
		        		</div>
		        		<div class="show-item-info">
						    <p id="item_danse"><span class="label">댄스</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						    <p id="item_enter"><span class="label">예능</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						    <p id="item_rqp"><span class="label">랩</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						    <p id="item_vocal"><span class="label">보컬</span> <span class="value">999<span class="positive">(+50)</span></span></p>
						    <p id="item_char"><span class="label">매력도</span> <span class="value">999<span class="positive">(+50)</span></span></p>
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
		        			<li data-tab="bag-hare">헤어</li>
		        			<li data-tab="bag-accessories">악세서리</li>
		        			<li data-tab="bag-interior">인테리어</li>
		        			<li data-tab="bag-snacks">간식</li>
		        		</ul>
		        	</div>
		        	<section id="bag-outfit" class="tab-content">
		        		<div class="shop-items">
		        			<div id="bag-outfit-1" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<button class="equipped">장착</button>
		        				</div>
		        			</div>
		        			<div id="bag-outfit-2" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<button class="equipped">장착</button>
		        				</div>
		        			</div>
		        			<div id="bag-outfit-3" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<button class="equipped">장착</button>
		        				</div>
		        			</div>
		        			<div id="bag-outfit-4" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<button class="equipped">장착</button>
		        				</div>
		        			</div>
		        			<div id="bag-outfit-5" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="bag-outfit-6" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="bag-outfit-7" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="bag-outfit-8" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="bag-outfit-9" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        		</div>
		        	</section>
		        	<section id="bag-hare" class="tab-content">
				        <div class="shop-items">
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/snack1.png">
				                    <p class="item-name">초콜릿 바</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>5000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/snack2.png">
				                    <p class="item-name">과일 바구니</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>12000</p>
				                </div>
				            </div>
				        </div>
				    </section>
		        	<section id="bag-accessories" class="tab-content">
				        <div class="shop-items">
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory1.png">
				                    <p class="item-name">진주 목걸이</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>15000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/accessory2.png">
				                    <p class="item-name">금반지</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>18000</p>
				                </div>
				            </div>
				        </div>
				    </section>
				
				    <section id="bag-interior" class="tab-content">
				        <div class="shop-items">
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/interior1.png">
				                    <p class="item-name">럭셔리 소파</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>50000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/interior2.png">
				                    <p class="item-name">모던 테이블</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>40000</p>
				                </div>
				            </div>
				        </div>
				    </section>
				
				    <section id="bag-snacks" class="tab-content">
				        <div class="shop-items">
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/snack1.png">
				                    <p class="item-name">초콜릿 바</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>5000</p>
				                </div>
				            </div>
				            <div class="shop-item-show">
				                <div class="item-info">
				                    <img src="/images/snack2.png">
				                    <p class="item-name">과일 바구니</p>
				                </div>
				                <div class="item-price">
				                    <img src="/images/coinIcon.png">
				                    <p>12000</p>
				                </div>
				            </div>
				        </div>
				    </section>
		        	<div class="show-character-info">
		        		<div class="show-character">
			        		<img src="/images/test_character.png">
		        		</div>
		        		<div class="show-item-info">
						    <p id="item_danse"><span class="label">댄스</span> <span class="value">+50</span></p>
						    <p id="item_enter"><span class="label">예능</span> <span class="value">+50</span></p>
						    <p id="item_rqp"><span class="label">랩</span> <span class="value">+50</span></p>
						    <p id="item_vocal"><span class="label">보컬</span> <span class="value">+50</span></p>
						    <p id="item_char"><span class="label">매력도</span> <span class="value">+50</span></p>
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
		
	</body>
</html>