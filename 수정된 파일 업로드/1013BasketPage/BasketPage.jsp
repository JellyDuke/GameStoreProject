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
             	border: 1px solid black;
                border-radius: 5px;
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
             
             .payInfoDiv {
             	border: 1px solid black;
                border-radius: 5px;
                width: 25%;
                min-height: 500px;
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
             	width: 100px;
             	height: 50px;
             }
             
        </style>
    </head>
    
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
        
        <!-- contents start -->
        <div class="basketDiv my-5 p-5">
        	<h1 class="d-flex justify-content-center">장바구니</h1>
        	
        	<div class="d-flex justify-content-center my-5">
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
	            
	            <div class="payInfoDiv mx-3">
	            	결제 정보
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