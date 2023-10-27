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
    			max-height: 500px;
    			min-height: 500px;
    		}
    		.table_th{
    			height: 100px;
    			width: 225px;
    			border: 1px solid #e7e7e7;   	
    			font-size: 14px;
    			max-width: 225px;		
    		}
    		.table_bd{
    			height: 100px;
    			width: 100px;
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
    		}
    		tbody>tr>td{
    			text-align: center;
    			max-height: 50px;
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
					내 쿠폰 목록          	
            	</div>    
            	       	
            	<div class="mt-3 info_area ">
	            	
	            	<div class="mt-3 comment_info">
	            		<div class="mt-3 comment_title d-flex justify-content-between">
					  		<div class="comment_tab d-flex">
					  			<form class="comment_tab d-flex" action="${pageContext.request.contextPath }/registCoupon" onsubmit="return registcoupon()">
						  			<img class="coupon_img" alt="" src="https://cdn-icons-png.flaticon.com/512/287/287585.png"> 
						  			<input id="codeinput" name="code" class="w-50 coupon_code" type="text" placeholder="쿠폰 코드를 입력해주세요"> <input type="submit" value="등록">							  			
					  			</form>
	            			</div>
					  		<div class="dropdown" style="margin-right: 30px;">
							  <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
							    사용가능
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							    <li><a class="dropdown-item" href="#">전체</a></li>
							    <li><a class="dropdown-item" href="#">사용가능</a></li>
							    <li><a class="dropdown-item" href="#">사용불가(완료)</a></li>	
							    <c:choose>
			                  		<c:when test = "${sessionScope.loginId == 'jinseoshin3@naver.com' }">   
			                       		<li><a class="dropdown-item" href="${pageContext.request.contextPath }/makecouponpage">쿠폰발행</a></li>	
			                       		<li><a class="dropdown-item" href="${pageContext.request.contextPath }/portoneTestPage">결제화면</a></li>									
			                   		</c:when>     	
							    </c:choose>			  	
							  </ul>
							</div> 	
            			</div>
            			
	            		<div class="table_div w-100">
							<table class="w-100">		
								<thead style="height: 100px;">
									<tr>
										<td class="table_th">적용 게임(태그)</td>
										<td class="table_bd">혜택</td>
										<td class="table_bd">등록(사용)일</td>
										<td class="table_bd">만료일</td>
										<td class="table_ft">상태</td>
									</tr>
								</thead>								
								<tbody>									
									<c:forEach items="${cList}" var="cL">
										<tr>		
										<td>${cL.ctype }</td>
										<td>${cL.cpercent }%</td>
										<td>${cL.cdate }</td>
										<td>${cL.cdeadline }</td>
										<c:choose>											
											<c:when test = "${sessionScope.loginId == 'jinseoshin3@naver.com' }">   
			                       				<c:choose>
			                       					<c:when test = "${cL.cstack == '0' }">   
			                       						<td>등록완료</td>			
			                   						</c:when> 
			                   						<c:otherwise>
			                   							<td>${cL.cstack }</td>
			                   						</c:otherwise>
			                       				</c:choose>	
			                   				</c:when> 
											<c:when test="${cL.datecheck == 'N' }">
												<td>기간만료</td>
											</c:when>
											<c:when test="${cL.cused == 'N'}">
												<td> <button class="btn btn-success">사용하기</button> </td>
											</c:when>
											<c:otherwise>
												<td>사용완료</td>
											</c:otherwise>
										</c:choose>
										
									</tr>	
									</c:forEach>
								</tbody>
							</table> 
	            		</div>
							<div class="w-100 h-100" style="font-size: 13px; max-height: 200px; margin-left: 70px;">
							<div class="mb-2" style="font-weight: bold;">이용안내</div>
							▪️ 등록하신 쿠폰은 쿠폰함에 보관됩니다.
							<br>	
							▪️ 혜택을 받으시려면 꼭 쿠폰함에서 혜택받기 버튼을 눌러 주세요.
							<br>	
							▪️ 쿠폰은 쿠폰함에 등록하기만 가능합니다.
							<br>	
							▪️ 혜택 받기는 결제 시 쿠폰 적용 기능을 사용해 주세요.
							<br>	
							▪️ 쿠폰에 따라 게임 이용동의가 되어 있어야 혜택을 받으실 수 있습니다.
							<br>	
							▪️ 쿠폰 속성에 따라 횟수, 사용기간이 다를 수 있습니다.
							<br>	
							▪️ 입력하시려는 쿠폰이 특정월드 전용일 경우, 사용이 제한될 수 있습니다.
							<br>	
							▪️ 쿠폰을 통해 이미 지급받은 혜택은 환불이 불가능합니다.
							<br>	
							▪️ 게임에 따라 혜택을 지급받기까지 시간이 소요될 수 있습니다.							
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
       	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/users/js/scripts.js"></script>
        <script type="text/javascript">
        	function registcoupon(){
        		let ccode = document.getElementById("codeinput").value;
        		let uid = '<%=(String)session.getAttribute("loginId")%>';        
        		let check = "Y";
        		if(uid == "null"){
        			alert("로그인해주세요");
        			location.replace("loginpage");
        			return false;
        		}
        		if(ccode.length == 0){
        			alert("코드를 입력해주세요");
	        		return false;       			
        		}
        		if(ccode.length != 12){
        			alert("쿠폰은 12자리 숫자입니다");
	        		return false;       	
        		}           		        			
		        $.ajax({
			    	type : 'get',
			    	url : 'checkcode',
			    	data : {'code' : ccode},
			    	async : false,
			    	success : function(checknum){
			    		console.log(checknum);
			    		if(checknum > 0){
			    			alert("이미 등록되었거나 만료된 쿠폰입니다.");	
			    			check = "N";
			    		}
			    				
			    	}
			    })
			    console.log(check);
			    if(check != "Y"){
			    	return false;
			    }	
        		
        	}
        </script>
        <script type="text/javascript">
		let msg = '${msg}';
		if(msg.length > 0){
			alert(msg);
		}
		</script>
    </body>
</html>
