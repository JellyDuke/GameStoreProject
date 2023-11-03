<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>GameStorePorject</title>
        
        <!-- icon -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/users/assets/favicon.ico" />
        
        <!-- bootstrap icon-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
       
        <!-- bootstrap css-->
        <link href="${pageContext.request.contextPath }/resources/users/css/styles.css" rel="stylesheet" />
    	<style type="text/css">
    		.main_container{
    			width: 900px;
    			height: 940px;
    			margin:	0 auto;
    			margin-top: 60px;
    			margin-bottom: 60px;
    			background-color: white;
    			border-radius: 50px;
    		}
    		.comment_title{
    			width: 800px;
    			height: 100px;
    			margin: 0 auto;
    			padding: 28px 0 16px 10px;
    			font-weight: bold;
    			font-size: 20px;
    			max-width: 100%;
    		}
    		.comment_tab{
    			width: 515px;
    			height: 50px;
    			margin: 0 auto;
    		}
    		.comment_tab>div{
    			height: 50px;
    			width: 170px;
    			font-size: 14px;	
    			padding: 14px 39px 14px 39px;
    		}
    		.select_div{
    			border-top: 5px solid bisque; 	
    		}
    		.comment_info{
    			width: 100%;
    			height: 100%;
    			margin: 0 auto;
    		}
    		.info_area{
    			width: 800px;
    			height: 660px;
    			margin: 0 auto;
    		}
    		.table_div{
    			overflow: scroll;  			
    			max-height: 400px;
    			min-height: 400px;
    		}
    		.table_div::-webkit-scrollbar{
    			display: none;
    		}
    		.table_th{   			
    			width: 120px;
    			border: 1px solid #e7e7e7;   	
    			font-size: 14px;
    			max-width: 120px;
    			max-height: 50px;		
    		}
    		.table_bd{
    			max-width: 415px;
    			border: 1px solid #e7e7e7;
    		}
    		.table_ft{
    			height: 100px;
    			width: 130px;
    		}
    		tr{
    			border-collapse: collapse;
    		}
    		tr>th{
    			padding: 7px;
    			font-weight: normal;
    		}
    		tr>td{
    			padding: 15px;
    			font-weight: normal; 		
    		}
    		tr>td>span{
    			font-size: 14px;		
    		}
    		.background{
	    		position: absolute;
	    		height: 1000px;
	    		width: 1000px;
	    		margin: 0 auto;
	    		margin-top: 90px;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				z-index: -3;
				-webkit-clip-path: inset(0 0 0 0);
				clip-path: inset(0 0 0 0);  
				background: linear-gradient(to top, #3e5151, #decba4);
				border-radius: 20px;
    		}
    		.btn{
    			border: 1px solid black !important;
    		}    		
    		section{
    			min-height: 1000px;
    		}
    		.coupon_code{
    			margin-left: 10px;
    			margin-right: 10px;
    		}
    		thead>tr>td{
    			text-align: center;
    			max-height: 50px;
    			border: 1px solid black;
    			font-weight: bold;
    		}
    		tbody>tr>td{
    			text-align: center;
    			max-height: 50px;
    		}
    		#typesearchs{
    			border: 1px solid black;
    			width: 185px;
    			overflow: hidden;
    			text-align: center;
    			white-space: nowrap;
    			height: 265px;
    		}
    		#typesearchs>a{
    			text-decoration: none;
    		}
    		#coupondiv{
    			margin-left: 191px;
    			border: 1px solid black;
    			width: 512px;
    			min-height: 265px;
    			max-height: 265px;
    			position: absolute;
    			z-index: -5;
    		}
    		.onbtn{
    			background-color: bisque !important;
    			z-index: 10 !important;
    		}
    		#tabdiv{
    			width: 100%;
    			height: 235px;
    			border: 1px solid black;
    			margin-top: 29px;
    		}
    		#price{
    			margin-left: 188px;
    			text-align: right;
    		}
    		.pointInfo{
    			min-height: 385px;
    			max-height: 385px;
    		}
    		.pImg{
    			width: 200px;
    			height: 200px;
    			margin: 0 auto;
    		}
    		.pText{
    			width: 270px;
    			height: 50px;
    			margin: 0 auto;
    		}
    		.btnbox{
    			margin: 0 auto;
    			margin-top: 30px;
    			width: 400px;
    		}
    		.chargeBtn{
    			margin-top: 30px;
    			margin-left: 14px;
    		}
    		.d-none{
    			display: none;
    		}
    		tr{
    			max-height: 100px;
    			table-layout: fixed;
    		}
    	</style>
    </head>
    <body>
        <!-- 메뉴 -->
         <%@ include file="/WEB-INF/views/include/menu.jsp" %>
          <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
        <!-- 배너(헤더) -->
        
        <!-- 내용 -->
        <section class="">
            <div class="main_container">
            	<div class="mt-3 comment_title">
					포인트 충전        	
            	</div>    
            	       	
            	<div class="mt-3 info_area ">
	            	
	            	<div class="mt-3 comment_info">	
	            		<div class="h-100 w-100 row">
	            			<div class="pointInfo w-100">
	            				<div class="pImg">
	            					<img class="w-100 h-100" alt="" src="https://previews.123rf.com/images/jaboy/jaboy1703/jaboy170300282/74814530-%ED%8F%AC%EC%9D%B8%ED%8A%B8-%EB%A9%94%EB%8B%AC-%EB%8F%99%EC%A0%84-%EC%95%84%EC%9D%B4%EC%BD%98.jpg">
	            				</div>
	            				<div class="pText">
	            					${mid }님의 포인트	
	            				</div>
	            				<div class="pText">
	            					충전한 포인트 <span>${mtpoint}P</span>	
	            				</div>
	            				<div class="pText">
	            					사용한 포인트 <span>${mupoint}P</span>
	            				</div>
	            				<div class="pText">
	            					포인트 잔액 <span>${mpoint}P</span> 
		            				<button onclick="display()">충전</button><button style="margin-left: 10px;" onclick="displayhistory()">내역</button>	            					
	            				</div>
	            			</div>
	            			<form id="chargeForm" class="h-25 d-none" action="#">		            
	            				<input class="pText" maxlength="6" size="6" type="text" id="price" disabled="disabled" name="cstack" value="0">원
	            				<input class="chargeBtn" type="button" onclick="registRechargeInfo('kakao')" value="충전(KAKAOPAY)">
	            				<input class="chargeBtn" type="button" onclick="registRechargeInfo('inicis')" value="충전(INICIS)">	            					
	            				<br>
	            				<div class="btnbox">
		            				<button type="button" onclick="changePrice(this.value)" value="1000">+1000</button>
		            				<button type="button" onclick="changePrice(this.value)" value="5000">+5000</button>
		            				<button type="button" onclick="changePrice(this.value)" value="10000">+10000</button>
		            				<button type="button" onclick="changePrice(this.value)" value="50000">+50000</button>
		            				<button type="button" onclick="changePrice(this.value)" value="100000">+100000</button>		            			
	            				</div>
	            			</form>	            	
	            	
	            		<div class="d-none table_div w-100">
	            			<div style="font-weight: bold; font-size: 20px;" class="w-100">
	            			포인트 사용/충전 내역 
	            			<button style="float: right;" class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
							  전체
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							    <li><a class="dropdown-item" onclick="sortTable('all')">전체</a></li>
							    <li><a class="dropdown-item" onclick="sortTable('cha')">충전</a></li>
							    <li><a class="dropdown-item" onclick="sortTable('pur')">사용</a></li>
							   </ul>
	            			</div>
							<table class="w-100 h-100">											
								<thead>
									<tr>
										<td>일자</td>
										<td>충전/사용</td>
										<td>내용</td>
										<td>포인트</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${morder}" var="mo">	
										<c:choose>
											<c:when test="${mo.oitem eq 'point' }">											
												<tr class="charge" style="height: 60px;">
													<td class="table_th">${mo.odate}</td>													
													<td class="table_th">충전</td>																										
													<td class="table_bd">${mo.oitem}</td>
													<td class="table_th">${mo.oprice}P</td>
												</tr>	
											</c:when>
											<c:otherwise>
												<tr class="purchase" style="height: 60px;">
													<td class="table_th">${mo.odate}</td>												
													<td class="table_th">사용</td>																												
													<td class="table_bd">${mo.oitem}</td>
													<td class="table_th">${mo.oprice}P</td>
												</tr>	
											</c:otherwise>
										</c:choose>								
									</c:forEach>
									<tr style="height: auto;">								
								</tbody>
							</table> 				       	
	            		</div>
            		</div>
	            		
            	</div>
            	</div>
	            <div class="background">
	            	
	            </div>
            </div>
        </section>
        
        <!-- Footer-->
        <%@ include file="/WEB-INF/views/include/footer.jsp"%>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/users/js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    </body>
    <script type="text/javascript">
    	let dis = document.querySelector('#chargeForm');
    	let dist = document.querySelector('.table_div');    	
    	let chtr = document.querySelectorAll('.charge');
    	let putr = document.querySelectorAll('.purchase');
    	let dropbtn = document.querySelector('#dropdownMenuButton1');
    	//chtr = Array.from(chtr);
    	//putr = Array.from(putr);
    	
    	function sortTable(sor){
    		if(sor == 'cha'){
    			dropbtn.innerText = "충전";
    			for(let i of putr){
    				console.log(i);
    				i.classList.add('d-none');    				
    			}
    			for(let j of chtr){
    				console.log(j);
    				j.classList.remove('d-none');
    			}
    		} else if(sor == 'pur'){
    			dropbtn.innerText = "사용";
    			for(let k of chtr){
	    			k.classList.add('d-none');
    			}
    			for(let z of putr){
    				z.classList.remove('d-none');    				
    			}
    		} else {
    			dropbtn.innerText = "전체";
    			for(let j of chtr){
	    			j.classList.remove('d-none');
    			}
    			for(let z of putr){
    				z.classList.remove('d-none');    				
    			}
    		}
    	}
    	
    	function display(){
    		dist.classList.add('d-none');    		
    		if(dis.classList.contains('d-none')){
	    		dis.classList.remove('d-none');
    		} else {	
    			dis.classList.add('d-none');    			
    		}
    	}
    	function displayhistory(){
    		dis.classList.add('d-none');    		
    		if(dist.classList.contains('d-none')){
	    		dist.classList.remove('d-none');
    		} else {	
    			dist.classList.add('d-none');    			
    		}
    	}
    	function changePrice(plus){
    		console.log(plus);
    		let inputp = document.querySelector('#price');
    		inputp.value = Number(plus)+Number(inputp.value);
    	}
    	function kakaoPay_ready(recode){
    		console.log('카카오페이 결제준비');
    		$.ajax({
    			type : "post",
    			url : "kakaoPay_ready",
    			data : {
    					'ocode':ocode,
						'oprice':myprice
					   },
				async : false,
				success:function(result){
					console.log(result);
					window.open(result,"pay","width=400,height=500");
				}
    		})
    	}
    	let typeCheck = "";
    	function registRechargeInfo(type){
    	myprice = Number(document.getElementById("price").value);
    	if(myprice == 0){
    		alert("금액을 입력하세요");
    		return false;
    	}
    	typeCheck = type;
    		$.ajax({
    			type : "post",
    			url : "registOrderInfo",
    			data : {'oprice':myprice,
						'ooriginprice':'1',
    					'oitem':"point",
    					'odiscount':'1'},
    			async : false,
    			success : function(result){
    				console.log('예매 처리 결과');
    				if(result == 'login'){
    					alert('로그인 후 이용가능');
    					location.href="/loginpage";
    				} else if(result.length > 0){
    					console.log("예매 INSERT 성공");
    					ocode = result;
    					if(typeCheck == "kakao"){
	    					kakaoPay_ready(result);    						
    					}
    					if(typeCheck == "inicis"){
	    					iamport();				
    					}
    				} else {
    					console.log("예매 INSERT 실패");
    					alert('예매 실패');	
    				}
    			}
    		})
    	}
    	function purchase_success(){
    		// 예매 성공 시 호출
    		alert("충전 완료");
    		location.href="/pointrechargepage";
    	}
    	function failpurchase(){
    		myprice = Number(document.getElementById("price").value);
    		// 예매 처리 실패
    		alert('충전 실패');
    		$.ajax({
    			// DELETE FROM RESERVE WHERE RECODE = ???
    			type : "post",
    			url : "reserveFail",
    			data : {'ocode':ocode,
    					'point':myprice},
    			async : false,
    			success : function(result){
    				if(result>0){
    					console.log("취소 완료");
    				} 				
    			}
    		})
    		location.reload();
    	}
    	function generateRandomCode(n) {
    		  let str = ''
    		  for (let i = 0; i < n; i++) {
    		    str += Math.floor(Math.random() * 10)
    		  }
    		  return str
    	}
    	
    	function iamport(){
    		myprice = Number(document.getElementById("price").value);
    		//가맹점 식별코드
    		IMP.init('imp73204184');
    		IMP.request_pay({
    		    pg : 'html5_inicis.INIpayTest',
    		    pay_method : 'card',
    		    merchant_uid : 'merchant_' + new Date().getTime(),
    		    name : '상품1' , //결제창에서 보여질 이름
    		    amount : myprice, //실제 결제되는 가격
    		    buyer_email : 'iamport@siot.do',
    		    buyer_name : '구매자이름',
    		    buyer_tel : '010-1234-5678',
    		    buyer_addr : '서울 강남구 도곡동',
    		    buyer_postcode : '123-456'
    		}, function(rsp) {
    			console.log(rsp);
    			 $.ajax({
    		            type : "POST",
    		            url : "/verifyIamport/" + rsp.imp_uid,
    		        }).done(function(data) {
    		            if(rsp.paid_amount == data.response.amount){
    		            	purchase_success();
    		                //결제 성공 시 비즈니스 로직
    		            } else {
    		            	failpurchase();
    		            }
    		        });
    		    });
    	}
	</script>
</html>

