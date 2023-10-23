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
        <title>게임 목록 페이지</title>
        <style>
            .gameListDiv{
                border: 1px solid black;
                border-radius: 5px;
                min-height: 400px;
			    width: 50%;
			    padding-right: calc(var(--bs-gutter-x) * 0.5);
			    padding-left: calc(var(--bs-gutter-x) * 0.5);
			    margin-right: auto;
			    margin-left: auto;
                --bs-gutter-x: 1.5rem;
			    --bs-gutter-y: 0;
             }
             
             .gameList_info {
             	border: 1px solid black;
                border-radius: 5px;
                min-height: 150px;
             }
             
             .gameDiv {
             	border: 1px solid black;
                border-radius: 5px;
                height: 100px;
             }
             
             .gameList_tags {
             	border: 1px solid black;
                border-radius: 5px;
                min-height: 200px;
             }
             
        </style>
    </head>
    
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
        
        <!-- contents start -->
        <div class="gameListDiv my-5 p-5">
        	<h2 class="mb-3">전체 게임 목록</h2>
        	
        	<nav class="navbar navbar-expand-lg navbar-light">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-12">
		                <li class="nav-item dropdown">
			                <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">정렬</a>
			                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				                <li><button class="dropdown-item">기본</button></li>
				                <li><hr class="dropdown-divider"/></li>
				                <li><button class="dropdown-item">할인율순</button></li>
				                <li><button class="dropdown-item">가격 높은순</button></li>
								<li><button class="dropdown-item">가격 낮은순</button></li>
								<li><hr class="dropdown-divider"/></li>
								<li><button class="dropdown-item">인기순</button></li>
			                </ul>
		                </li>
                    </ul>
                </div>
       		 </nav>
        	
        	<div class="d-flex mt-1">
				<div id="gameList" class="w-75">
				
					<div class="gameList_info d-flex align-items-center row mx-2 mb-3 p-3">
			        	<div class="gameDiv col-lg-3 mx-auto d-flex align-items-center justify-content-center">
			        		사진
			        	</div>
			        	<div class="gameDiv col-lg-6 mx-auto d-flex align-items-center">
			        		게임 정보
			        	</div>
			        	<div class="gameDiv col-lg-2 mx-auto d-flex align-items-center justify-content-center">
			        		게임 가격
			        	</div>
					</div>
					
					<div class="gameList_info d-flex align-items-center row mx-2 mb-3 p-3">
			        	<div class="gameDiv col-lg-3 mx-auto d-flex align-items-center justify-content-center">
			        		사진
			        	</div>
			        	<div class="gameDiv col-lg-6 mx-auto d-flex align-items-center">
			        		게임 정보
			        	</div>
			        	<div class="gameDiv col-lg-2 mx-auto d-flex align-items-center justify-content-center">
			        		게임 가격
			        	</div>					
					</div>
					
					<div class="gameList_info d-flex align-items-center row mx-2 mb-3 p-3">
			        	<div class="gameDiv col-lg-3 mx-auto d-flex align-items-center justify-content-center">
			        		사진
			        	</div>
			        	<div class="gameDiv col-lg-6 mx-auto d-flex align-items-center">
			        		게임 정보
			        	</div>
			        	<div class="gameDiv col-lg-2 mx-auto d-flex align-items-center justify-content-center">
			        		게임 가격
			        	</div>					
					</div>
		        </div>
		        
		        <div class="gameList_tags w-25 mx-2 p-3">
		        	<div class="bg-light">
		        		<div>적용된 태그</div>
		        		<div class="my-2">액션, 드라마</div>
		        	</div>
		        	
		        	<div class="p-1">
		        		게임 태그
		        	</div>
		        	<div class="p-1">
		        		게임 태그
		        	</div>
		        	<div class="p-1">
		        		게임 태그
		        	</div>
		        	<div class="p-1">
		        		게임 태그
		        	</div>
		        	<div class="p-1">
		        		게임 태그
		        	</div>
		        	<div class="p-1">
		        		게임 태그
		        	</div>
		        	<div class="p-1">
		        		게임 태그
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
    
    <script type="text/javascript">
	    <%-- 대충 이미지 컬럼 구분 하는 코드 --%>
	    <%-- 이미지 컬럼을 나누어 놓고 나누어놓은 배열 사이즈에 맞춰서
	    	 for문을 반복하고 createElement로
	    	 img 태그를 만들고 src에 추가 --%>
    	// let gameUrls = "https://cdn.akamai.steamstatic.com/steam/apps/1169040/ss_a5ed32f738ca984b1a6f656f40d59b5fccccdbd7.1920x1080.jpg?t=1696983938 https://cdn.akamai.steamstatic.com/steam/apps/1169040/ss_a5ed32f738ca984b1a6f656f40d59b5fccccdbd7.1920x1080.jpg?t=1696983938";
    	// document.querySelector('#gameImg').setAttribute('src', gameUrls.split(" ")[1]);
    </script>
    
</html>