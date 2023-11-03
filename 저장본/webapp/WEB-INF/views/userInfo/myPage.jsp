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
        
        <!-- eyes icon -->
        <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        	
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
								<c:choose>
									<c:when test="${sessionScope.loginState == 'YP' }">
										<th class="table_th"><img style="margin-left:20px; width: 150px; height: 150px;" src="resources/memberprofile/${sessionScope.loginProfile }"></th>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${sessionScope.loginState == 'Y ' }">
												<th class="table_th"><img style="margin-left:20px; width: 150px; height: 150px;" src="${pageContext.request.contextPath }/resources/users/assets/img/basic.png"></th>
											</c:when>
											<c:otherwise>
												<th class="table_th"><img style="margin-left:20px; width: 150px; height: 150px;" src="${sessionScope.loginProfile }"></th>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								
								<td class="table_bd"> 프로필 변경 <br> 
									<form action="${pageContext.request.contextPath }/mproFile" method="post" enctype="multipart/form-data"	>
										<input type="file" name="bfile"> 
										<div>
											<input type="submit" value="등록">
										</div>
									</form>
								</td>
							</tr>			
							<tr>	
								<th class="table_th">아이디</th>
								<td class="table_bd"> <span>${sessionScope.loginId }</span></td>
							</tr>
							<tr>
							<c:choose>
								<c:when test="${sessionScope.loginMpw == 'KAKAOLOGIN' }">
									<th class="table_th">비밀번호</th>
									<td class="table_bd"> <span>KAKAO USER</span> </td>
								</c:when>
								<c:when test="${sessionScope.loginMpw == 'naverAccount' }">
									<th class="table_th">비밀번호</th>
									<td class="table_bd"> <span>NAVER USER</span> </td>
								</c:when>	
								<c:otherwise>
									<th class="table_th">비밀번호</th>
									<td class="table_bd"> <span>비밀번호 변경 하시겠습니까?</span> <button style="margin-left: 10px;" onclick="reMpw()">변경</button> </td>
								</c:otherwise>						
							</c:choose>	
							</tr>
							<tr>
								<th class="table_th">닉네임</th>
								<td class="table_bd"> <span>${sessionScope.loginMnickname}</span> </td>
							</tr>
							<tr>
								<th class="table_th">이름</th>
								<td class="table_bd"> <span>${sessionScope.loginMname }</span> </td>
							</tr>
							<tr>
								<th class="table_th">포인트</th>
								<td class="table_bd"> <span>${sessionScope.loginPoint }</span> <button style="margin-left: 10px;" onclick="location.href='${pageContext.request.contextPath }/pointrechargepage'">충전</button> </td>
							</tr>
							<tr>
								<th class="table_th">가입일</th>
								<td class="table_bd"> <span>${sessionScope.loginMdate}</span> </td>
							</tr>	
							<tr>
								<th class="table_th">탈퇴신청</th>
								<td class="table_bd"> <button onclick="removeMember();">탈퇴</button> </td>
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
        	function reMpw() {
        		if(window.confirm("비밀번호를 변경 하시겠습니까?")){
    	        	location.href="/rePassword";
    	        }
			}
        </script>
    </body>
</html>