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
		        			<li data-tab="shop-hare">헤어</li>
		        			<li data-tab="shop-accessories">악세서리</li>
		        			<li data-tab="shop-interior">인테리어</li>
		        			<li data-tab="shop-snacks">간식</li>
		        		</ul>
		        	</div>
		        	<section id="shop-outfit" class="tab-content">
		        		<div class="shop-items">
		        			<div id="shop-item-show-outfit_1" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-outfit_2" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-outfit_3" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-outfit_4" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-outfit_5" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-outfit_6" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-outfit_7" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-outfit_8" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-outfit_9" class="shop-item-show">
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
		        	<section id="shop-hare" class="tab-content">
		        		<div class="shop-items">
		        			<div id="shop-item-show-hare_1" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">머리</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div id="shop-item-show-hare_2" class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">머리</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">머리</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">머리</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div class="shop-item-show">
		        				<div class="item-info">
		        					<img src="/images/item_ex.png">
		        					<p class="item-name">아이템 이름</p>
		        				</div>
		        				<div class="item-price">
		        					<img src="/images/coinIcon.png">
		        					<p>50000</p>
		        				</div>
		        			</div>
		        			<div class="shop-item-show">
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
		        	
		        	<section id="shop-accessories" class="tab-content">
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
				
				    <section id="shop-interior" class="tab-content">
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
				
				    <section id="shop-snacks" class="tab-content">
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
		
		<h2>
			머지 확인용
		</h2>
		
		<script src="/js/modal.js" defer></script>
		<script src="/js/shop.js" defer></script>
		<script src="/js/mybag.js" defer></script>
		
	</body>
</html>