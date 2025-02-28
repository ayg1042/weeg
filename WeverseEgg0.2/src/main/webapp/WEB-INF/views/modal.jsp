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
		
		<h2>
			머지 확인용
		</h2>
		
		<script src="/js/modal.js" defer></script>
		
	</body>
</html>