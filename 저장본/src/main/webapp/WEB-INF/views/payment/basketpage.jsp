<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>장바구니 페이지</title>
        <style>
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
                min-height: 250px;
             }
             
             .gameSelectButton {
                width: 5%;
             }
             
             .checkBtn {
             	border: 1px solid black;
             	width: 30px;
             	height: 30px;
             }
             
             .gameInfoDiv {
                width: 95%;
             }
             
             .gameHead {
                height: 45%;
             }
             
             .gameImg {
             	border: 1px solid black;
                border-radius: 5px;
                width: 25%;
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
             }
             
             .payInfo_head {
             	min-height: 50px;
             	font-weight: bold;
             	font-size: 20px;
             }
             
             .payInfo_body {
             	min-height: 300px;
             }
             
             #couponList {
             	border: 1px solid black;
             	border-radius: 5px;
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
             
             .poingInput {
             	border-radius: 5px;
             	width: 70%;
   				height: 80%;
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
             
        </style>
    </head>
    
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
        
        <!-- contents start -->
        <div class="basketDiv my-5 p-5">
        	<h1 class="d-flex justify-content-center">장바구니</h1>
        	
        	<div class="gameList_head d-flex my-4 mt-5">
        		<div class="d-flex align-items-center w-75">
        			<button class="checkBtn btn-warning bg-warning text-white ms-4 me-3">v</button>
        			전체 선택
        		</div>
        		
        		<div class="d-flex align-items-center justify-content-center w-25">
        			<div class="mx-2" style="cursor: pointer;">
	        			선택 삭제
        			</div>
        			<div class="mx-2" style="cursor: pointer;">
	        			주문불가삭제        			
        			</div>
        		</div>
        	</div>
        	
        	<div class="d-flex justify-content-center">
	            <div class="gameListDiv mx-3 p-4">
	            	<div class="gameDiv d-flex my-4 px-2">
	            		<div class="gameSelectButton d-flex justify-content-center p-2">
	            			<button class="checkBtn btn-warning bg-warning text-white mt-2">v</button>
	            		</div>
	            		<div class="gameInfoDiv p-2">
	            			<div class="gameHead d-flex mt-1">
	            				<div class="gameImg d-flex justify-content-center align-items-center">
	            					게임 사진
	            				</div>
	            				<div class="gameTitle">
	            					<p class="m-0" style="min-height: 30px;">게임 이름</p>
	            					<p class="mt-2">게임 가격</p>
	            					<p class="mt-3">할인 기간</p>
	            				</div>
	            				<div class="delButton d-flex justify-content-center">
	            					<button class="xBtn text-dark btn d-flex justify-content-center align-items-center">X</button>
	            				</div>
	            			</div>
	            			<div class="gameBody d-flex mt-3">
	            				<div class="gamePrice">
	            					<div>상품 금액</div>
	            					<div>\19,500</div>
	            				</div>
	            				
	            				<div class="gamePrice">
	            					<div>할인 금액</div>
	            					<div>\13,650</div>
	            				</div>
	            				
	            				<div class="gamePrice">
	            					<div>쿠폰 할인</div>
	            					<div>\0</div>
	            				</div>
	            				<div class="gamePrice pt-3">
	            					<div>주문 금액</div>
	            					<div>(할인 포함)</div>
	            					<div>\5,850</div>
	            				</div>
	            				
	            				<div class="buyBtnDiv">
	            					<button class="buyBtn btn-warning bg-warning text-white">구매하기</button>
	            				</div>
	            			</div>
	            		</div>
	            	</div>
	            	<div class="gameDiv d-flex my-4 px-2">
	            		<div class="gameSelectButton d-flex justify-content-center p-2">
	            			<button class="checkBtn btn-white bg-white mt-2">v</button>
	            		</div>
	            		<div class="gameInfoDiv p-2">
	            			<div class="gameHead d-flex mt-1">
	            				<div class="gameImg d-flex justify-content-center align-items-center">
	            					게임 사진
	            				</div>
	            				<div class="gameTitle">
	            					<p class="m-0" style="min-height: 30px;">게임 이름</p>
	            					<p class="mt-2">게임 가격</p>
	            					<p class="mt-3">할인 기간</p>
	            				</div>
	            				<div class="delButton d-flex justify-content-center">
	            					<button class="xBtn text-dark btn d-flex justify-content-center align-items-center">X</button>
	            				</div>
	            			</div>
	            			<div class="gameBody d-flex mt-3">
	            				<div class="gamePrice">
	            					<div>상품 금액</div>
	            					<div>\19,500</div>
	            				</div>
	            				
	            				<div class="gamePrice">
	            					<div>할인 금액</div>
	            					<div>\13,650</div>
	            				</div>
	            				
	            				<div class="gamePrice">
	            					<div>쿠폰 할인</div>
	            					<div>\0</div>
	            				</div>
	            				<div class="gamePrice pt-3">
	            					<div>주문 금액</div>
	            					<div>(할인 포함)</div>
	            					<div>\5,850</div>
	            				</div>
	            				
	            				<div class="buyBtnDiv">
	            					<button class="buyBtn btn-warning bg-warning text-white">구매하기</button>
	            				</div>
	            			</div>
	            		</div>
	            	</div>
	            	<div class="gameDiv d-flex my-4 px-2">
	            		<div class="gameSelectButton d-flex justify-content-center p-2">
	            			<button class="checkBtn btn-warning bg-warning text-white mt-2">v</button>
	            		</div>
	            		<div class="gameInfoDiv p-2">
	            			<div class="gameHead d-flex mt-1">
	            				<div class="gameImg d-flex justify-content-center align-items-center">
	            					게임 사진
	            				</div>
	            				<div class="gameTitle">
	            					<p class="m-0" style="min-height: 30px;">게임 이름</p>
	            					<p class="mt-2">게임 가격</p>
	            					<p class="mt-3">할인 기간</p>
	            				</div>
	            				<div class="delButton d-flex justify-content-center">
	            					<button class="xBtn text-dark btn d-flex justify-content-center align-items-center">X</button>
	            				</div>
	            			</div>
	            			<div class="gameBody d-flex mt-3">
	            				<div class="gamePrice">
	            					<div>상품 금액</div>
	            					<div>\19,500</div>
	            				</div>
	            				
	            				<div class="gamePrice">
	            					<div>할인 금액</div>
	            					<div>\13,650</div>
	            				</div>
	            				
	            				<div class="gamePrice">
	            					<div>쿠폰 할인</div>
	            					<div>\0</div>
	            				</div>
	            				<div class="gamePrice pt-3">
	            					<div>주문 금액</div>
	            					<div>(할인 포함)</div>
	            					<div>\5,850</div>
	            				</div>
	            				
	            				<div class="buyBtnDiv">
	            					<button class="buyBtn btn-warning bg-warning text-white">구매하기</button>
	            				</div>
	            			</div>
	            		</div>
	            	</div>
	            	
	            </div>
	            
	            <div class="payInfo_Div mx-3 p-2">
	            	<div class="payInfo_head d-flex align-items-center">
	            		<div class="d-flex justify-content-center w-50 p-2">
			            	결제 정보
	            		</div>
	            	</div>
	            	
	            	<div class="payInfo_body">
	            		<div class="d-flex justify-content-center p-2">
	            			<div class="d-flex justify-content-center w-50">
	            				상품 금액
	            			</div>
	            			<div class="d-flex justify-content-center w-50">
	            			 	\50,500
	            			</div>
	            		</div>
	            		
	            		<div class="d-flex p-2">
		            		<div class="d-flex justify-content-center w-50">
	            				할인 금액
	            			</div>
	            			<div class="d-flex justify-content-center w-50">
	            			 	-\18,300
	            			</div>
	            		</div>
	            		
	            		<div class="d-flex p-2">
		            		<div class="d-flex justify-content-center w-50">
	            				쿠폰 할인
	            			</div>
	            			<div class="d-flex justify-content-center w-50">
	            			 	-\0
	            			</div>
	            		</div>
	            		
	            		<div class="d-flex justify-content-center p-2">
		            		<button class="w-75">쿠폰 사용</button>
	            		</div>
	            		
	            		<%-- 버튼을 누르면 display를 block으로 변경 (현재 테스트를 위해 block 후에 none으로 변경) --%>
	            		<div id="couponList" class="mx-2">
		            		<%-- 사용 가능한 쿠폰 목록이 있을 때 --%>
		            		<c:choose>
			            		<%-- 쿠폰 목록 --%>
		            			<c:when test="true">
				            		<div class="coupon m-3">
				            			<div class="d-flex justify-content-center">10% 할인 쿠폰</div>
				            			<div class="d-flex justify-content-center">유효기간 : 2023-11-12</div>
				            		</div>
				            			
				            		<div class="coupon m-3">
				            			<div class="d-flex justify-content-center">15% 할인 쿠폰</div>
				            			<div class="d-flex justify-content-center">유효기간 : 2023-10-19</div>
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
	            		
	            		<div class="d-flex p-3">
		            		<div class="d-flex justify-content-center w-50">
	            				가용 포인트
	            			</div>
	            			<div class="d-flex justify-content-center w-50">
	            			 	3,000P
	            			</div>
	            		</div>
	            		
	            		<div class="pointCharging">
	            			<div onclick="location.href='/'">
			            		포인트 충전	            			
	            			</div>
	            		</div>
	            		
	            		<div class="d-flex p-3">
		            		<div class="d-flex justify-content-center w-50">
	            				포인트 사용
	            			</div>
	            			<div class="d-flex justify-content-center align-items-center w-50">
	            			 	<input class="poingInput text-center" type="text">&nbsp;P
	            			</div>
	            		</div>
	            		
	            	</div>
	            	
	            	<div class="payInfo_foot">
	            		<div class="d-flex p-2">
		            		<div class="d-flex justify-content-center w-50">
	            				총 주문 금액
	            			</div>
	            			<div class="d-flex justify-content-center w-50">
	            			 	\32,200
	            			</div>
	            		</div>
	            		
	            		<div class="d-flex p-2">
		            		<div class="payText d-flex justify-content-center w-50">
	            				결제 예상 금액
	            			</div>
	            			<div class="payValue d-flex justify-content-center w-50">
	            			 	\32,200
	            			</div>
	            		</div>
	            	</div>
	            	
	            	<div class="d-flex justify-content-center my-3">
	            		<button class="buyButton">3개 상품 구매하기</button>
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
    
</html>