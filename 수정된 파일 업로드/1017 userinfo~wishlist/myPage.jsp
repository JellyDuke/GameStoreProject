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
    			width: 760px;
    			height: 700px;
    			margin:	0 auto;
    			margin-top: 60px;
    			margin-bottom: 60px;
    			background-color: white;
    			border-radius: 50px;
    		}
    		.comment_title{
    			width: 700px;
    			height: 70px;
    			margin: 0 auto;
    			padding: 28px 0 16px 10px;
    			font-weight: bold;
    		}
    		.comment_tab{
    			width: 700px;
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
    			width: 700px;
    			height: 400px;
    			margin: 0 auto;
    		}
    		.info_area{
    			width: 700px;
    			height: 660px;
    			margin: 0 auto;
    		}
    		.table_th{
    			height: 50px;
    			width: 170px;
    			border: 1px solid #e7e7e7;   	
    			font-size: 14px;		
    		}
    		.table_bd{
    			height: 50px;
    			width: 530px;
    			border: 1px solid #e7e7e7;
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
	    		height: 760px;
	    		width: 922px;
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
					  회원정보          	
            	</div>
            	<div class="mt-3 info_area ">
	            	<div class="comment_tab d-flex">
						<div class="select_div">회원정보 조회</div>	
	            	</div>
	            	
	            	<div class="mt-3 comment_info">
	            		<div class="mt-3 comment_title">
					  		회원정보 조회         	
            			</div>
	            		
						<table class="w-100 h-100">			
							<tr>
								<th class="table_th">회원번호</th>
								<td class="table_bd"> <span>MV00001</span></td>
							</tr>				
							<tr>
								<th class="table_th">아이디(이메일)</th>
								<td class="table_bd"> <span>jinseoshin3@naver.com</span></td>
							</tr>
							<tr>
								<th class="table_th">비밀번호</th>
								<td class="table_bd"> <span>********</span> <button style="margin-left: 10px;" onclick="showpw(this)">확인</button> </td>
							</tr>
							<tr>
								<th class="table_th">닉네임</th>
								<td class="table_bd"> <span>markus</span> <button style="margin-left: 10px;" onclick="changenickname(this)">변경</button> </td>
							</tr>
							<tr>
								<th class="table_th">이름</th>
								<td class="table_bd"> <span>신진서</span> </td>
							</tr>
							<tr>
								<th class="table_th">포인트</th>
								<td class="table_bd"> <span>0P</span> <button style="margin-left: 10px;" onclick="chargepoint(this)">충전</button> </td>
							</tr>
							<tr>
								<th class="table_th">가입일</th>
								<td class="table_bd"> <span>2023년09월22일</span> </td>
							</tr>	
							<tr>
								<th class="table_th">탈퇴신청</th>
								<td class="table_bd"> <button onclick="deleteaccount(this)">탈퇴</button> </td>
							</tr>													
						</table>    	       	
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

