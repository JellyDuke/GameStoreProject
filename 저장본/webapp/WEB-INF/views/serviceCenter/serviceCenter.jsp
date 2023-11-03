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
        <title>GameStoreProject</title>
    </head>
    <style>
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
    			padding: 14px 30px 14px 38px;
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
    		table{
    			max-height: 650px;
    		}
    		.table_th{
    			height: 50px;
    			width: 170px;
    			border: 1px solid #e7e7e7;   	
    			font-size: 20px;		
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
    		section{
    			min-height: 1000px;
    		}
    		.a_tag{
    			text-decoration: none;
    		}
    		
    	</style>	
	</style>
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
       	
       	<section class="">
            <div class="main_container">
            	<div class="mt-3 comment_title">
					고객지원          	
            	</div>
            	<div class="mt-3 info_area ">
	            	<div class="comment_tab d-flex">
						<div class="select_div">고객지원 센터</div>	
	            	</div>
	            	<div class="mt-3 comment_info">
						<table class="w-100 h-100">			
							<tr>
								<th class="table_th">계정</th>
								<td class="table_bd">비밀번호를 잊으셨나요?  <a class= "a_tag" href="${pageContext.request.contextPath }/findAccount">FindAccount</a></td>
							</tr>				
							<tr>
								<th class="table_th">충전</th>
								<td class="table_bd">포인트 충전 하고 싶으세요? <a class= "a_tag" href="${pageContext.request.contextPath }/pointrechargepage">pointRecharge</a></td>
							</tr>
							<tr>
								<th class="table_th">결제내역/환불</th>
								<td class="table_bd">환불하고 싶으신가요? <a class= "a_tag" href="${pageContext.request.contextPath }/paymentHistory">Refund</a> </td>
							</tr>
							<tr>
								<th class="table_th">회원탈퇴</th>
								<td class="table_bd">회원 탈퇴 하고 싶으세요? <a class= "a_tag" onclick="removeMember();">Member secession</a></td>
							</tr>
							<tr>
								<th class="table_th">문의</th>
								<td class="table_bd">문의 사항이 있으신가요? <a class= "a_tag" href="${pageContext.request.contextPath }/inquiry">Inquiry</a></td>
							</tr>
							<tr>
								<th class="table_th">문제</th>
								<td class="table_bd">고객센터 연결 010-xxxx-xxxx, 032-xxx-xxxx</td>
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
        
        <script type="text/javascript">
        function removeMember() {
        	if(window.confirm("탈퇴하시겠습니까?")){
        	location.href="/secession";
        	}
        }
        </script>
    </body>
</html>
