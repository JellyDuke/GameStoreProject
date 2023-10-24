<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
    			font-size: 20px;
    			font-weight: bold;
    		}
    		.comment_tab{
    			width: 850px;
    			height: 50px;
    			margin: 0 auto;
    		}
    		.comment_tab>div{
    			height: 50px;
    			width: 170px;
    			font-size: 16px;	
    			padding: 14px 30px 14px 28px;
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
    			max-height: 600px;
    			max-height: 600px;
    		}
    		.table_th{
    			height: 100px;
    			width: 100px;
    			border: 1px solid #e7e7e7;   	
    			font-size: 20px;
    		}
    		.table_bd{
    			height: 100px;
    			width: 110px;
    			border: 1px solid #e7e7e7;
    		}
    		.table_ft{
    			height: 100px;
    			border: 1px solid #e7e7e7;   
    			width: 145px;
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
    			font-size: 20px;		
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
    		.sale_box{
    			width: 40px;
    			height: 26px;
    			text-align: center;
    			
    		}
    		.table_percent{
    			width: 50px;
    			font-weight: bold;
    			float: right;
    			margin-top: 25px;
    		}
    		.table_pr{
    			width: 100px;
    			
    		}
    		.table_pr>div{
    			font-size: 14px;
    			text-align: center;
    		}
    		td{
    			text-align: center;
    		}
    		.game{
    			overflow: hidden;
    			max-width: 130px;
    			max-height: 100px;		
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
					내 결제(환불) 내역       	
            	</div>
            	<div class="mt-3 info_area ">
	            	<div class="comment_tab d-flex">
						<div class="select_div">결제(환불) 내역</div>	
						
	            	</div>
	            	
	            	<div class="mt-3 comment_info">
	            		<div class="mt-3 comment_title d-flex justify-content-between">
					  		내 결제(환불) 목록  
	            			<div class="dropdown" style="margin-right: 45px;">
								  <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
								    결제 목록
								  </button>
								  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								    <li><a class="dropdown-item" href="#">결제 목록</a></li>
									<li><a class="dropdown-item" href="#">환불 목록</a></li>
								  </ul>
							</div> 	
            			</div>
	            		<div class="table_div w-100 h-100">
							<table class="w-100 h-100">			
								<thead>
									<tr>
										<td class="table_th">게임</td>
										<td class="table_bd">주문코드</td>
										<td class="table_bd">원가</td>
										<td class="table_bd">할인금액</td>
										<td class="table_bd">결제금액</td>
										<td class="table_ft">결제(취소)일</td>
										<td class="table_ft">상태</td>
									</tr>
								</thead>								
								<tbody>
									<tr>
										<td class="game" title="gmaezzzzzzzzzzzzzzz"> <img class="w-75 h-75 mb-2" alt="" src="https://cdn.epnc.co.kr/news/photo/201911/92733_83711_2650.jpg"> <br> 게임이름zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz  </td>
										<td>OD77777</td>
										<td>₩ 700000</td>
										<td>₩ 300000</td>
										<td>₩ 400000</td>
										<td>2023-10-19</td>
										<td> 구매완료 <br> <button class="btn mt-2 btn-secondary">구매취소</button> </td>
									</tr>	
									<tr>
										<td class="game" title="gmaezzzzzzzzzzzzzzz"> <img class="w-75 h-75 mb-2" alt="" src="https://cdn.epnc.co.kr/news/photo/201911/92733_83711_2650.jpg"> <br> 게임이름zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz  </td>
										<td>OD77777</td>
										<td>₩ 700000</td>
										<td>₩ 300000</td>
										<td>₩ 400000</td>
										<td>2023-10-19</td>
										<td> 구매완료 <br> <button class="btn mt-2 btn-secondary">구매취소</button> </td>
									</tr>
									<tr>
										<td class="game" title="gmaezzzzzzzzzzzzzzz"> <img class="w-75 h-75 mb-2" alt="" src="https://cdn.epnc.co.kr/news/photo/201911/92733_83711_2650.jpg"> <br> 게임이름zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz  </td>
										<td>OD77777</td>
										<td>₩ 700000</td>
										<td>₩ 300000</td>
										<td>₩ 400000</td>
										<td>2023-10-19</td>
										<td> 구매완료 <br> <button class="btn mt-2 btn-secondary">구매취소</button> </td>
									</tr>	
									<tr>
										<td class="game" title="gmaezzzzzzzzzzzzzzz"> <img class="w-75 h-75 mb-2" alt="" src="https://cdn.epnc.co.kr/news/photo/201911/92733_83711_2650.jpg"> <br> 게임이름zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz  </td>
										<td>OD77777</td>
										<td>₩ 700000</td>
										<td>₩ 300000</td>
										<td>₩ 400000</td>
										<td>2023-10-19</td>
										<td> 구매완료 <br> <button class="btn mt-2 btn-secondary">구매취소</button> </td>
									</tr>	
									<tr>
										<td class="game" title="gmaezzzzzzzzzzzzzzz"> <img class="w-75 h-75 mb-2" alt="" src="https://cdn.epnc.co.kr/news/photo/201911/92733_83711_2650.jpg"> <br> 게임이름zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz  </td>
										<td>OD77777</td>
										<td>₩ 700000</td>
										<td>₩ 300000</td>
										<td>₩ 400000</td>
										<td>2023-10-19</td>
										<td> 구매완료 <br> <button class="btn mt-2 btn-secondary">구매취소</button> </td>
									</tr>	
									<tr>
										<td class="game" title="gmaezzzzzzzzzzzzzzz"> <img class="w-75 h-75 mb-2" alt="" src="https://cdn.epnc.co.kr/news/photo/201911/92733_83711_2650.jpg"> <br> 게임이름zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz  </td>
										<td>OD77777</td>
										<td>₩ 700000</td>
										<td>₩ 300000</td>
										<td>₩ 400000</td>
										<td>2023-10-19</td>
										<td> 구매완료 <br> <button class="btn mt-2 btn-secondary">구매취소</button> </td>
									</tr>	
									<tr>
										<td class="game" title="gmaezzzzzzzzzzzzzzz"> <img class="w-75 h-75 mb-2" alt="" src="https://cdn.epnc.co.kr/news/photo/201911/92733_83711_2650.jpg"> <br> 게임이름zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz  </td>
										<td>OD77777</td>
										<td>₩ 700000</td>
										<td>₩ 300000</td>
										<td>₩ 400000</td>
										<td>2023-10-19</td>
										<td> 구매완료 <br> <button class="btn mt-2 btn-secondary">구매취소</button> </td>
									</tr>	
								</tbody>
								
							</table> 				       	
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
        
    </body>
</html>

