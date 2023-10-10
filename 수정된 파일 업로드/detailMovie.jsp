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
        <title>영화 예매 프로젝트 - MovieProject</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/users/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/users/css/styles.css" rel="stylesheet" />
        <style type="text/css">
        	.movie_poster {
        		max-width: 70%;
        		height: auto;
        		border-radius: 10px;
        	}
        	.img-profile {
        		width: 50px;
			    height: 50px;
			    margin: 5px;
			    border-radius: 50%;
			    object-fit: cover;
        	}
        	
        	.commentDiv {
        		border: 1px solid black;
        		border-radius: 7px;
        		min-height: 150px;
        	}
        	
        </style>
        
    </head>
    
    <body>
    	<!-- 메뉴 시작 -->
        <!-- Responsive navbar-->
        <%@ include file="/WEB-INF/views/includes/Menu.jsp" %>
        <!-- 메뉴 끝 -->
        
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">영화 정보 페이지</h1>
                    <p class="lead mb-0">영화 상세 정보 출력</p>
                </div>
            </div>
        </header>
        
        <!-- Page content-->
        <div class="container">
            
            <!-- 컨텐츠 시작 -->
            
            <!-- 영화 정보 출력 - row 시작 -->
            <div class="row my-4">
            
            	<div class="col-lg-5" style="text-align: center;">
            		<img class="movie_poster" src="${movie.mvposter }" alt="">
            	</div>
            	
            	<div class="col-lg-7 pt-2">
	            	<div class="card-body pt-5">
		                <div class="small text-muted mb-1">예매율</div>
		                <h2 class="card-title h4 mb-2" title="">${movie.mvtitle }</h2>
		                <p class="card-text mb-1">감독 : ${movie.mvdirector } / 배우 : ${movie.mvactors }</p>
		                <p class="card-text mb-1">장르 : ${movie.mvgerne } / 기본정보 : ${movie.mvinfo }</p>
		                <p class="card-text mb-4">개봉일 : ${movie.mvopen }</p>
		                <a class="btn btn-danger" href="/reserveMovie?mvcode=${movie.mvcode }">예매하기</a>
	                </div>
            	</div>
            	
            </div>
            <!-- 영화 정보 출력 - row 끝 -->
            
            <!-- 관람평 출력 - row 시작 -->
            <div class="row my-3 p-2 justify-content-center bg-light" style="min-height: 200px; border: 1px solid black;">
            	<div>
		            <h2 class="text-center my-3">관람평</h2>            	
            	</div>
            	<c:forEach items="${rvList }" var="rv">
            		<div class="col-lg-5 m-4 commentDiv bg-white">
	            		<div>
	            			<c:choose>
		            			<%-- 등록된 프로필이 없는 경우 --%>
		            			<c:when test="${rv.mprofile == null }">
		            				<img alt="프로필 이미지" src="resources/memberProfile/기본프로필.jpg">
		            			</c:when>
		            			
		            			<%-- 등록된 프로필이 있는 경우 --%>
		            			<c:otherwise>
		            				<c:choose>
				            			<%-- 카카오 회원 --%>
			            				<c:when test="${sessionScope.loginState == 'YC' }">
						            		<img class="img-profile" alt="프로필 이미지" src="resources/memberProfile/${rv.mprofile }">
			            				</c:when>
			            				
			            				<%-- 일반 회원 --%>
			            				<c:otherwise>
			            					<img class="img-profile" alt="프로필 이미지" src="${rv.mprofile }">
			            				</c:otherwise>	            				
		            				</c:choose>
		            			</c:otherwise>
	            			</c:choose>
	            			
	            			<p class="fw-bold" style="display: inline-block;">${rv.mid }</p>
	            			${rv.rvdate }
		            		<c:if test="${sessionScope.loginId == rv.mid }">
			            		<button class="btn btn-danger mx-2" onclick="location.href='/deleteReview?rvcode=${rv.rvcode }&mvcode=${param.mvcode }'">관람평 삭제</button>
		            		</c:if>
	            		</div>
	            		<div class="p-2">
	            			${rv.rvcomment }
	            		</div>
	            		
            		</div>
            	</c:forEach>
            </div>
            <!-- 관람평 출력 - row 끝 -->
            
            <!-- 컨텐츠 끝 -->
            
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
    </body>
    
</html>