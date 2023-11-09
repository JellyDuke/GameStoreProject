<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	
	<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>장바구니 페이지</title>
	<style>
		body {
			caret-color: transparent;
		}
		
		.basketDiv {
			border: 1px solid black;
			border-radius: 5px;
			width: 70%;
			min-height: 400px;
			margin-left: auto;
			margin-right: auto;
		}
		
		.gameList_head {
			border: 1px solid black;
			border-radius: 5px;
			width: 98%;
			min-height: 80px;
			margin-left: auto;
			margin-right: auto;
		}
		
		.gameListDiv {
			border: 1px solid black;
			border-radius: 5px;
			width: 70%;
			min-height: 500px;
		}
		
		.gameDiv {
			border-radius: 10px;
			min-height: 250px;
		}
		
		.gameSelectButton {
			width: 5%;
		}
		
		.checkBtnOn {
			border: 1px solid black;
			border-radius: 7px;
			width: 30px;
			height: 30px;
			background-color: bisque;
		}
		
		.checkBtnOff {
			border: 1px solid black;
			border-radius: 7px;
			width: 30px;
			height: 30px;
			background: none;
		}
		
		.gameInfoDiv {
			width: 95%;
		}
		
		.gameInfo {
			font-weight: bold;
			font-size: 20px;
		}
		
		.game_price_small {
			text-decoration: line-through;
			font-size: 17px;
			font-weight: bold;
			color: gray;
		}
		
		.game_price_big {
			font-size: 22px;
			font-weight: bold;
			color: limegreen;
		}
		
		.gameHead {
			min-height: 45%;
		}
		
		.gameImgDiv {
			width: 25%;
		}
		
		.gameImg {
			border-radius: 10px;
			width: 100%;
			height: 100%;
		}
		
		.gameTitle {
			width: 75%;
			padding-left: 15px;
		}
		
		.delButton {
			width: 5%;
		}
		
		.xBtn {
			width: 25px;
			height: 25px;
		}
		
		.gameBody {
			border: 1px solid black;
			border-radius: 5px;
			height: 45%;
		}
		
		.payInfo_Div {
			border: 1px solid black;
			border-radius: 5px;
			width: 25%;
			min-height: 700px;
		}
		
		.gamePrice {
			width: 20%;
			text-align: center;
			padding-top: 30px;
		}
		
		.buyBtnDiv {
			width: 20%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.buyBtn {
			border: none;
			border-radius: 10px;
			width: 80%;
			height: 50px;
			background-color: pink;
			color: white;
		}
		
		.payInfo_head {
			min-height: 50px;
			font-weight: bold;
			font-size: 20px;
		}
		
		.payInfo_body {
			min-height: 300px;
		}
		
		.couponHead {
			text-align: center;
			border: 1px solid black;
			border-radius: 15px;
			background-color: pink;
		}
		
		#couponList {
			border: 1px solid black;
			border-radius: 5px;
			min-height: 60px;
			display: block;
		}
		
		.addedCoupon {
			border-top: 1px solid black;
			min-height: 60px;
			display: block;
		}
		
		.coupon {
			border-radius: 7px;
			cursor: pointer;
			background-color: antiquewhite;
		}
		
		.coupon:hover {
			background-color: ivory;
		}
		
		.pointCharging {
			border: 1px solid black;
			border-radius: 7px;
			width: 50%;
			margin-left: auto;
			margin-right: auto;
			display: flex;
			justify-content: center;
			align-items: center;
			cursor: pointer;
			background-color: ivory;
		}
		
		.pointCharging:hover {
			background-color: antiquewhite;
		}
		
		.payInfo_foot {
			border-top: 1px solid black;
			border-bottom: 1px solid black;
			margin-top: 15px;
			padding-top: 15px;
			padding-bottom: 15px;
		}
		
		.payText {
			font-size: 16px;
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.payValue {
			color: orange;
			font-weight: bold;
			font-size: 20px;
		}
		
		.buyButton {
			border-radius: 10px;
			width: 200px;
			height: 50px;
			font-size: 17px;
			font-weight: bold;
			color: coral;
			background-color: beige;
		}
		
		.buyButton:hover {
			background-color: bisque;
		}
		
		.cantBuy {
			border-radius: 10px;
			background-color: grey;
		}
		
		.deleteButton {
			border: 1px solid black;
			border-radius: 15px;
			min-width: 35%;
			min-height: 40%;
			text-align: center;
			display: flex;
			align-items: center;
			justify-content: center;
			cursor: pointer;
		}
		
		.deleteButton:hover {
			background-color: orange;
		}
		
		.onfocus {
			background-color: antiquewhite;
		}
		
		</style>
	</head>
	
	<body>
		<!-- 메뉴 -->
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	
		<!-- contents start -->
		<div class="basketDiv my-5 p-5">
			<h1 class="d-flex justify-content-center">장바구니</h1>
	
			<div class="gameList_head d-flex my-4 mt-5">
				<div class="d-flex align-items-center w-75">
					<button id="allSelect" class="checkBtnOff ms-4 me-3" onclick="allSelect(this)">v</button>
					전체 선택
					<div class="ms-5" style="text-decoration: underline;">
						구매 불가능해진 게임은 회색으로 표시됩니다.
					</div>
				</div>
	
				<div class="d-flex align-items-center justify-content-center w-25">
					<div class="deleteButton mx-2" onclick="selectDelete()">
						선택 삭제
					</div>
					<div class="deleteButton mx-2" onclick="cantByDelete()">
						주문불가삭제
					</div>
				</div>
			</div>
	
			<div class="d-flex justify-content-center">
				<div class="gameListDiv mx-3 p-4">
					<p id="gameListSize" style="display: none;">${gameListSize }</p>
					<c:choose>
						<c:when test="${basketList.size() == 0 }">
							<p class="text-center m-0">장바구니에 상품이 없습니다.</p>
						</c:when>
						
						<c:otherwise>
							<c:forEach items="${basketList }" var="game">
								<div class="gameDiv d-flex my-4 px-2">
									<p class="gcode" style="display: none;">${game.gcode }</p>
									<p class="gtag" style="display: none;">${game.gtag }</p>
									<p class="gstate" style="display: none;">${game.gstate }</p>
									<p class="gname" style="display: none;">${game.gname }</p>
									<div class="gameSelectButton d-flex justify-content-center p-2">
										<button class="checkBtn checkBtnOff mt-2" onclick="buttonClick(this)">v</button>
									</div>
									<div class="gameInfoDiv p-2">
										<div class="gameHead d-flex mt-1">
											<div class="gameImgDiv d-flex justify-content-center align-items-center" style="cursor: pointer;" onclick="location.href='/gameDetail?gcode=${game.gcode}'">
												<img class="gameImg" alt="게임 이미지" src="${game.gmainimg }">
											</div>
											<div class="gameTitle">
												<p class="gameInfo m-0">게임 이름 : ${game.gname }</p>
												<c:choose>
													<c:when test="${game.gsale != 1 }">
														<div class="d-flex my-2">
															<p class="gameInfo m-0">게임 가격 :&nbsp;</p>
															<p class="game_price_big d-flex justify-content-center align-items-center me-2 mb-0">\ ${game.gprice / 100 * (100 - game.gsale)}</p>
															<p class="game_price_small d-flex justify-content-center align-items-center ms-2 mb-0">\ ${game.gprice }</p>
														</div>
													</c:when>
			
													<c:otherwise>
														<p class="gameInfo my-2">게임 가격 : \ ${game.gprice }</p>
													</c:otherwise>
												</c:choose>
												<p class="gameInfo m-0">할인 기간 : ${game.gdeadline }</p>
											</div>
											<div class="delButton d-flex justify-content-center">
												<button class="xBtn text-dark btn d-flex justify-content-center align-items-center w-25 h-25" onclick="thisDelete(this)">X</button>
											</div>
										</div>
										<div class="gameBody d-flex mt-3">
											<div class="gamePrice">
												<div>상품 금액</div>
												<div class="d-flex align-items-center justify-content-center">
													\
													<p class="gameAllPrice m-0">${game.gprice }</p>
												</div>
											</div>
			
											<div class="gamePrice">
												<div>할인 금액</div>
												<c:choose>
													<c:when test="${game.gsale == 1 }">
														<div class="d-flex align-items-center justify-content-center">
															-\
															<p class="gameAllSale m-0">0</p>
														</div>
													</c:when>
			
													<c:otherwise>
														<div class="d-flex align-items-center justify-content-center">
															-\
															<p class="gameAllSale m-0">${String(game.gprice / 100 * game.gsale).replace(".0", "") }</p>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
			
											<div class="gamePrice">
												<div>쿠폰 할인</div>
												<div
													class="d-flex align-items-center justify-content-center text-center">
													-\
													<p class="couponSalePrice m-0">0</p>
												</div>
											</div>
											<div class="gamePrice pt-3">
												<div>주문 금액</div>
												<div>(할인 포함)</div>
												<c:choose>
													<c:when test="${game.gsale == 1 }">
														<div
															class="d-flex align-items-center justify-content-center text-center">
															\
															<p class="saleTotalPrice m-0">${game.gprice }</p>
														</div>
													</c:when>
			
													<c:otherwise>
														<div
															class="d-flex align-items-center justify-content-center text-center">
															\
															<p class="saleTotalPrice m-0">${game.gprice / 100 * (100 - game.gsale)}</p>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
			
											<div class="buyBtnDiv">
												<button class="buyBtn" onclick="buyButtonClick(this)">구매하기</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
	
				<div class="payInfo_Div mx-3 p-2">
					<div class="payInfo_head d-flex align-items-center">
						<div class="d-flex justify-content-center w-50 p-2">결제 정보</div>
					</div>
	
					<div class="payInfo_body">
						<div class="d-flex justify-content-center p-2">
							<div class="d-flex justify-content-center w-50">상품 금액</div>
							<div class="d-flex justify-content-center w-50">
								<div>\</div>
								<div class="sumGamePrice">0</div>
							</div>
						</div>
	
						<div class="d-flex p-2">
							<div class="d-flex justify-content-center w-50">할인 금액</div>
							<div class="d-flex justify-content-center w-50">
								<div>-\</div>
								<div class="sumSalePrice">0</div>
							</div>
						</div>
	
						<div class="d-flex p-2">
							<div class="d-flex justify-content-center w-50">쿠폰 할인</div>
							<div class="d-flex justify-content-center w-50">-\<p class="sumCouponSalePrice m-0">0</p></div>
						</div>
	
						<div class="d-flex justify-content-center p-2">
							<div class="couponHead w-75">쿠폰</div>
						</div>
	
						<%-- 버튼을 누르면 display를 block으로 변경 (현재 테스트를 위해 block 후에 none으로 변경) --%>
						<div id="couponList" class="mx-2">
							<%-- 사용 가능한 쿠폰 목록이 있을 때 --%>
							<c:choose>
								<%-- 쿠폰 목록 --%>
								<c:when test="${couponList != null }">
									<h5 class="text-center my-2 p-1">내 쿠폰</h5>
									<c:forEach items="${couponList }" var="coupon">
										<div class="coupon m-3">
											<p class="couponCode" style="display: none;">${coupon.CCODE }</p>
											<div class="couponType d-flex justify-content-center">${coupon.CTYPE }</div>
											<div
												class="d-flex text-center align-items-center justify-content-center">
												<p class="couponSale" style="display: none;">${coupon.CPERCENT }</p>
												<div class="d-flex justify-content-center">${String((1-coupon.CPERCENT)*100).replace(".00", "").replace(".0", "") }</div>
												<div class="d-flex justify-content-center">% 할인 쿠폰</div>
											</div>
											<div class="d-flex justify-content-center align-items-center text-center">
												유효기간 : ${coupon.CDEADLINE }
											</div>
										</div>
									</c:forEach>
	
									<div id="canUseCoupon" class="addedCoupon mx-2 mt-3 pt-2">
										<h5 class="text-center">적용 가능 쿠폰</h5>
									</div>
	
									<div id="addedCoupon" class="addedCoupon mx-2 mt-3 pt-2">
										<h5 class="text-center">적용된 쿠폰</h5>
									</div>
								</c:when>
	
								<%-- 사용 가능한 쿠폰 목록이 있을 때 --%>
								<c:otherwise>
									<div class="d-flex justify-content-center mt-3">
										사용 가능한 쿠폰이 없습니다.
									</div>
								</c:otherwise>
							</c:choose>
						</div>
	
	
						<div class="d-flex align-items-center justify-content-center p-3">
							<div class="text-center">가용 포인트 :&nbsp;</div>
							<div class="d-flex text-center"><p id="myPoint" class="m-0">${mpoint }</p>P</div>
						</div>
	
						<div class="pointCharging">
							<div onclick="location.href='/pointrechargepage'">포인트 충전</div>
						</div>
	
					</div>
	
					<div class="payInfo_foot">
						<div class="d-flex p-2">
							<div class="d-flex justify-content-center w-50">총 주문 금액</div>
							<div class="d-flex justify-content-center w-50">\<p id="finalbeforePrice" class="m-0">0</p></div>
						</div>
	
						<div class="d-flex p-2">
							<div class="payText d-flex justify-content-center w-50">결제
								예상 금액
							</div>
							<div class="payValue d-flex justify-content-center w-50">
								\<p id="finalAfterPrice" class="m-0">0</p>
							</div>
						</div>
					</div>
	
					<div class="d-flex justify-content-center my-3">
						<button class="buyButton" onclick="buyBtnClick()">0개 상품 구매하기</button>
					</div>
	
				</div>
			</div>
	
		</div>
		<!-- contents end -->
	
		<!-- Footer-->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	</body>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="resources/users/js/scripts.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<script type="text/javascript">
		let selectList = [];
	</script>

	<script type="text/javascript">
		let msg = '${msg}';
		if(msg.length > 0){
			alert(msg);
		}
	</script>

	<script type="text/javascript">
    	function buttonClick(btnObj){
    		console.log('클릭');
    		if(!selectList.includes(btnObj.parentElement.parentElement)){
	    		selectList.push(btnObj.parentElement.parentElement);
	    		btnObj.classList.add('checkBtnOn');
	    		btnObj.classList.remove('checkBtnOff');
    		}
    		else {
    			selectList.splice(selectList.indexOf(btnObj.parentElement.parentElement), 1);
    			btnObj.classList.add('checkBtnOff');
	    		btnObj.classList.remove('checkBtnOn');
    		}
    		
    		let gameList_size = document.querySelector('#gameListSize').innerText;
    		if(gameList_size == selectList.length){
    			document.querySelector('#allSelect').classList.add('checkBtnOn');
    			document.querySelector('#allSelect').classList.remove('checkBtnOff');
    		}
    		else {
    			document.querySelector('#allSelect').classList.add('checkBtnOff');
    			document.querySelector('#allSelect').classList.remove('checkBtnOn');
    		}
    		modifyTotalPrice();
    		document.querySelector('.buyButton').innerText = selectList.length + '개 상품 구매하기';
    	}
    </script>

	<script type="text/javascript">
    	function allSelect(btnObj){
    		console.log('전체 선택 클릭');
    		
    		let btnList = document.querySelectorAll('.checkBtn');
    		if(selectList.length < btnList.length){
    			btnObj.classList.add('checkBtnOn');
    			btnObj.classList.remove('checkBtnOff');
    			for(btn of btnList){
    				btn.classList.add('checkBtnOn');
    	    		btn.classList.remove('checkBtnOff');
    	    		if(!selectList.includes(btn.parentElement.parentElement)){
    		    		selectList.push(btn.parentElement.parentElement);
    		    		btnObj.classList.add('checkBtnOn');
    		    		btnObj.classList.remove('checkBtnOff');
    	    		}
	    		}
    		}
    		else if(selectList.length == btnList.length) {
    			btnObj.classList.add('checkBtnOff');
    			btnObj.classList.remove('checkBtnOn');
	    		for(btn of btnList){
	    			btn.classList.add('checkBtnOff');
		    		btn.classList.remove('checkBtnOn');
	    		}
	    		selectList = [];
    		}
    		modifyTotalPrice();
    		document.querySelector('.buyButton').innerText = selectList.length + '개 상품 구매하기';
    	}
    </script>

	<script type="text/javascript">
    	function selectDelete(){
    		if(selectList.length <= 0){
    			alert('선택된 게임이 없습니다.');
    		}
    		else {
	    		let check = confirm('선택된 게임을 장바구니에서 삭제하시겠습니까?');    			
	    		if(check == true){
	    			let gcodeArray = [];
	    			for(sel of selectList){
	    				gcodeArray.push(sel.querySelector('.gcode').innerText);
	    			}
	    			location.href = '/deleteBasket?gcodeArray='+gcodeArray;
	    		}
    		}
    	}
    </script>

	<script type="text/javascript">
    	function thisDelete(btnObj){
    		console.log('이 게임 삭제');
    		let check = confirm('해당 게임을 장바구니에서 삭제하시겠습니까?');
    		if(check == true){
	    		let gcodeArray = [];
	    		gcodeArray.push(btnObj.parentElement.parentElement.parentElement.parentElement.querySelector('.gcode').innerText);
	    		location.href = '/deleteBasket?gcodeArray='+gcodeArray;    			
    		}
    	}
    </script>

	<script type="text/javascript">
    	function cantByDelete(){
    		console.log('주문 불가 삭제');
    		let check = confirm('장바구니 게임 중 현재 구매가 불가능한 상품을 삭제하시겠습니까?');
    		if(check == true){
	    		location.href = '/cantByDelete';
    		}
    	}
    </script>

	<script type="text/javascript">
		$(document).ready(function(){
			let gameDivList = document.querySelectorAll('.gameDiv');
			let gameTagList = [];
			let couponList = document.querySelectorAll('.coupon');
			for(let i=0;i<gameDivList.length;i++){
				
				// 구매 불가 게임
				if(gameDivList[i].querySelector('p.gstate').innerText == '0'){
					gameDivList[i].classList.add('cantBuy');
					gameDivList[i].querySelector('.checkBtn').setAttribute('disabled', 'disabled');
					gameDivList[i].querySelector('.checkBtn').classList.remove('checkBtn');
					gameDivList[i].querySelector('.buyBtn').setAttribute('disabled', 'disabled');
					gameDivList[i].querySelector('.buyBtn').classList.remove('buyBtn');
					gameDivList[i].querySelector('.xBtn').setAttribute('disabled', 'disabled');
					gameDivList[i].querySelector('.xBtn').classList.remove('xBtn');
					selectList.splice(selectList.indexOf(gameDivList[i], 1));
				}
				
				// 쿠폰
				if(gameDivList[i].querySelector('p.gstate').innerText != '0'){
					let gtagArray = gameDivList[i].querySelector('.gtag').innerText.split(", ");
					for(let j=0;j<gtagArray.length;j++){
						if(!gameTagList.includes(gtagArray[j])){
							gameTagList.push(gtagArray[j]);
						}
					}
				}
			}
			
			let idx = 0;
			for(let i=0;i<couponList.length;i++){
				
				if(gameTagList.includes(couponList[i].querySelector('div.couponType').innerText)){
					
					let gameTitle = document.createElement('div');
					gameTitle.classList.add('d-flex');
					gameTitle.classList.add('justify-content-center');
					gameTitle.classList.add('align-items-center');
					gameTitle.classList.add('text-center');
					
					let gameTitleString = null;
					for(let j=0;j<gameDivList.length;j++){
						for(let k=0;k<gameDivList[j].querySelector('.gtag').innerText.split(', ').length;k++){
							if(gameDivList[j].querySelector('.gtag').innerText.split(', ')[k] == couponList[i].querySelector('div.couponType').innerText && gameDivList[j].querySelector('.gstate').innerText != '0'){
								if(gameTitleString == null){
									gameTitleString = gameDivList[j].querySelector('.gname').innerText;
								}
								else {
									gameTitleString = gameTitleString + ', ' + gameDivList[j].querySelector('.gname').innerText;
								}
							}
						}
					}
					
					gameTitle.innerText = '적용 게임 : ' + gameTitleString;
					couponList[i].appendChild(gameTitle);
					couponList[i].setAttribute('onmouseover', 'couponOnmouseover(this)');
					couponList[i].setAttribute('onmouseout', 'couponOnmouseout(this)');
					couponList[i].setAttribute('onclick', 'couponOnclick(this)');
					document.querySelector('#canUseCoupon').appendChild(couponList[i]);
					idx += 1;
				}
			}
			
			if(idx == 0){
				document.querySelector('#canUseCoupon').innerHTML = '';
				let noneDiv = document.createElement('div');
				noneDiv.classList.add('d-flex');
				noneDiv.classList.add('justify-content-center');
				noneDiv.classList.add('py-3');
				noneDiv.innerText = '적용 가능한 쿠폰이 없습니다.';
				document.querySelector('#canUseCoupon').appendChild(noneDiv);
				document.querySelector('#addedCoupon').innerHTML = '';
			}
		});
	</script>

	<script type="text/javascript">
		function buyButtonClick(btnObj){
			btnObj.parentElement.parentElement.parentElement.parentElement.querySelector('.checkBtn').click();
		}
	</script>

	<script type="text/javascript">
		function modifyTotalPrice(){
			let sumGamePrice = 0;
			let sumSalePrice = 0;
			let sumCouponSalePrice = 0;
	    	if(selectList.length > 0){
	    		for(let i=0;i<selectList.length;i++){
	    			sumGamePrice = sumGamePrice + Number(selectList[i].querySelector('p.gameAllPrice').innerText);
	    			sumSalePrice = sumSalePrice + Number(selectList[i].querySelector('p.gameAllSale').innerText);
	    			sumCouponSalePrice = sumCouponSalePrice + Number(selectList[i].querySelector('p.couponSalePrice').innerText);
	    		}
	    		document.querySelector('.sumGamePrice').innerText = sumGamePrice;
	    		document.querySelector('.sumSalePrice').innerText = sumSalePrice;
	    		document.querySelector('.sumCouponSalePrice').innerText = sumCouponSalePrice;
	    	}
	    	if(selectList.length == 0){
	    		document.querySelector('.sumGamePrice').innerText = 0;
	    		document.querySelector('.sumSalePrice').innerText = 0;
	    		document.querySelector('.sumCouponSalePrice').innerText = 0;
	    		document.querySelector('#finalbeforePrice').innerText = 0;
	    		document.querySelector('#finalAfterPrice').innerText = 0;
	    	}
	    	
	    	document.querySelector('#finalbeforePrice').innerText = sumGamePrice;
	    	document.querySelector('#finalAfterPrice').innerText = sumGamePrice - sumSalePrice - sumCouponSalePrice;
		}
	</script>

	<script type="text/javascript">
		function couponOnmouseover(obj){
			let gameDivList = document.querySelectorAll('div.gameDiv');
			for(let i=0;i<gameDivList.length;i++){
				for(let j=0;j<gameDivList[i].querySelector('.gtag').innerText.split(", ").length;j++){
					if(gameDivList[i].querySelector('.gtag').innerText.split(", ")[j] == obj.querySelector('.couponType').innerText && gameDivList[i].querySelector('.gstate').innerText != '0'){
						gameDivList[i].classList.add('onfocus');
					}
				}
			}
		}
		
		function couponOnmouseout(obj){
			
			let gameDivList = document.querySelectorAll('div.gameDiv');
			for(let i=0;i<gameDivList.length;i++){
				for(let j=0;j<gameDivList[i].querySelector('.gtag').innerText.split(", ").length;j++){
					if(gameDivList[i].querySelector('.gtag').innerText.split(", ")[j] == obj.querySelector('.couponType').innerText){
						gameDivList[i].classList.remove('onfocus');
					}
				}
			}
		}
		
		let couponCount = 0;
		function couponOnclick(obj){
			if(couponCount == 0){
				let gameDivList = document.querySelectorAll('div.gameDiv');
				for(let i=0;i<gameDivList.length;i++){
					for(let j=0;j<gameDivList[i].querySelector('.gtag').innerText.split(", ").length;j++){
						if(gameDivList[i].querySelector('.gtag').innerText.split(", ")[j] == obj.querySelector('.couponType').innerText && gameDivList[i].querySelector('.gstate').innerText != '0'){
							let salePersent = Number(obj.querySelector('.couponSale').innerText); // 0.89
							let normalPrice = Number(gameDivList[i].querySelector('p.gameAllPrice').innerText);
							let salePrice = Number(gameDivList[i].querySelector('p.gameAllSale').innerText);
							let couponSalePrice = Number(normalPrice - (normalPrice * salePersent));
							let afterPrice = Number(normalPrice - salePrice - couponSalePrice);
							
							gameDivList[i].querySelector('p.couponSalePrice').innerText = couponSalePrice;
							gameDivList[i].querySelector('p.saleTotalPrice').innerText = afterPrice;
							
							obj.removeAttribute('onclick');
							document.querySelector('#addedCoupon').appendChild(obj);
							modifyTotalPrice();
							couponCount += 1;
						}
					}
				}
			}
			else {
				alert('쿠폰은 한 번의 주문당 한 개만 사용 가능합니다.');
			}
		}
	</script>
	
	<script type="text/javascript">
		function buyBtnClick(){
			console.log('구매하기');
			// let couponCode = '';
			// let gameCode = '';// 게임 코드 >> select 게임 이름, 원가, 할인률
			
			// 요청 보내기
			// 요청 횟수 : (1번)
			// MEMBERS 테이블 - UPDATE - 포인트 차감 - (매개변수 : 구매금액)
			// 요청 횟수 : (상품 개수 만큼)
			// ORDERS 테이블 - INSERT - 주문 정보 추가 (매개변수 : 쿠폰코드(NULL 가능), 게임 이름, 아이디, 결제액, 원가, 할인률)
			// 요청 횟수 : (상품 개수 만큼)
			// SHOPBASKET 테이블 - DELETE - 장바구니 상품 제거 (매개 변수 : 아이디, 게임 코드)
			// 요청 횟수 : (1번)
			// COUPONS 테이블 - UPDATE - CUSED => Y로 변경(매개 변수 : 쿠폰코드, 아이디)
			
			let totalPrice = document.querySelector('#finalAfterPrice').innerText.split(".")[0]; // 구매총액
			
			let myPoint = document.querySelector('#myPoint').innerText;
			if(Number(myPoint) < Number(totalPrice)){
				alert('보유중인 포인트가 부족합니다.');
				return;
			}
			
			if(selectList.length <= 0 || selectList == null){
				alert('선택된 상품이 없습니다.');
				return;
			}
			
			let couponCode = null;
			let couponEl = document.querySelector('#addedCoupon p.couponCode');
			
			if(couponEl != null){
				couponCode = couponEl.innerText;				
			}
			
			let gcodeArray = [];
			let gpriceArray = [];
			for(let gameDiv of selectList){
				let gcode = gameDiv.querySelector('p.gcode').innerText;
				gcodeArray.push(gcode);
				let gprice = gameDiv.querySelector('p.saleTotalPrice').innerText;
				gpriceArray.push(gprice);
			}
			
			$.ajax({
				url : 'basketGameBuy',
				type : 'get',
				traditional : true,
				data : {
					"totalPrice" : totalPrice,
					"couponCode" : couponCode,
					"gcodeArray" : gcodeArray,
					"gpriceArray" : gpriceArray
				},
				success : function(result){
					if(result != '0'){
						alert(selectList.length+'개의 게임을 성공적으로 구매하였습니다.');
						location.href="/mygamepage";
					}
					else {
						alert('오류가 발생하였습니다.');
						location.href="/";
					}
				}
			});
			
		}
	</script>

</html>