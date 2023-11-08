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
			    width: 65%;
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
                cursor: pointer;
             }
             
             .gameList_info:hover {
             	background-color: antiquewhite;
             }
             
             .gameDiv {
                border-radius: 5px;
                min-height: 100px;
             }
             
             .gameImg {
             	border-radius: 10px;
             	width: 100%;
             	height: 100%;
             }
             
             .gameTitle {
             	font-weight: bold;
    			font-size: 23px;
             }
             
             .gamePrice_small {
             	font-size: 15px;
    			text-decoration: line-through;
    			text-align: center;
             }
             
             .gamePrice_big {
             	font-weight: bold;
			    font-size: 18px;
			    color: tomato;
			    text-align: center;
             }
             
             .otherFont {
             	font-size: 13px;
             }
             
             .gameList_tags {
             	border: 1px solid black;
                border-radius: 5px;
                min-height: 200px;
             }
             
             .ganreDiv {
             	border-radius: 7px;
             	cursor: pointer;
             }
             
             .ganreDivClick {
             	background-color: antiquewhite;
             }

             .ganreDiv:hover {
             	background-color: antiquewhite;
             }
             
             #ganreList {
             	min-height: 100px;
             }
             
             .gameHide {
             	display: none !important;
             }
             
             .moreButton {
             	width: 60%;
             	border-radius: 7px;
             	background-color: pink;
             }
             
        </style>
    </head>
    
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
        
        <!-- contents start -->
        <div class="gameListDiv my-5 p-5 pb-3">
        	<h2 class="mb-3">전체 게임 목록</h2>
        	
        	<nav class="navbar navbar-expand-lg navbar-light">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-12">
		                <li class="nav-item dropdown">
			                <a class="nav-link dropdown-toggle active" id="navbarDropdowns" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">정렬</a>
			                <ul class="dropdown-menu" aria-labelledby="navbarDropdowns">
								<li><button class="dropdown-item" onclick="prdSort(this)" value="release_desc">출시일순</button></li>
								<li><hr class="dropdown-divider"/></li>
				                <li><button class="dropdown-item" onclick="prdSort(this)" value="sale_desc">할인율순</button></li>
				                <li><hr class="dropdown-divider"/></li>
				                <li><button class="dropdown-item" onclick="prdSort(this)" value="price_desc">가격 높은순</button></li>
								<li><button class="dropdown-item" onclick="prdSort(this)" value="price_asc">가격 낮은순</button></li>
			                </ul>
		                </li>
                    </ul>
                </div>
       		 </nav>
        	
        	<div class="d-flex mt-1">
				<p id="gameCount" style="display: none;">${gameCount }</p>
				<div id="gameList" class="w-75">
					<c:forEach items="${gameList }" var="game" varStatus="status">
						<div class="gameList_info row align-items-center mx-2 mb-3 p-3" onclick="location.href='/gameDetail?gcode=${game.gcode}'" tabindex="0">
				        	<div class="gameDiv col-lg-3 mx-auto p-0 d-flex align-items-center justify-content-center">
				        		<img class="gameImg" alt="게임 이미지" src="${game.gmainimg }">
				        	</div>
				        	<div class="gameDiv col-lg-6 mx-auto">
				        		<div>
					        		<p class="gameTitle m-0">${game.gname }</p>				        		
				        		</div>
				        		<div class="mt-3">
				        			<div class="d-flex h-50">
					        			<p class="otherFont m-0">장르 :&nbsp;</p>
						        		<p class="otherFont m-0">${game.gtag }</p>				        			
				        			</div>
				        			
				        			<div class="d-flex h-50">
						        		<p class="otherFont m-0">출시일 :&nbsp;</p>
						        		<p class="otherFont m-0">${game.grelease }</p>				        						        			
				        			</div>
				        		</div>
				        	</div>
				        	<div class="gameDiv col-lg-2 p-0 mx-auto d-flex align-items-center justify-content-center">
				        		<p class="gsale" style="display: none;">${game.gsale }</p>
				        		<p class="grelease" style="display: none;">${game.grelease }</p>
				        		<p class="ganre" style="display: none;">${game.gtag }</p>
				        		<c:choose>
				        			<c:when test="${game.gsale != 1 }">
						        		<div class="py-4">
							        		<p class="gamePrice_small m-0">\ ${game.gprice }</p>
							        		<div class="d-flex align-items-center justify-content-center">
								        		<p class="gamePrice_big m-0">\&nbsp;</p>
								        		<p class="prdPrice gamePrice_big m-0">${game.gprice / 100 * (100 - game.gsale) }</p>						        		
							        		</div>
						        		</div>
				        			</c:when>
				        			
				        			<c:otherwise>
				        				<div class="h-100 d-flex align-items-center justify-content-center">
				        					<p class="m-0">\&nbsp;</p>
						        			<p class="prdPrice text-center m-0">${game.gprice }</p>				        								        				
				        				</div>
				        			</c:otherwise>
				        		</c:choose>
				        	</div>
						</div>
						<p class="statusCount" style="display: none;">${status.count }</p>
					</c:forEach>
				
					
		        </div>
		        
		        <div class="gameList_tags w-25 mx-2 p-3">
		        	<div class="bg-light">
		        		<div class="d-flex align-items-center justify-content-center p-3">장르로 분류하기</div>
		        		<div class="d-flex align-items-center justify-content-center">적용된 장르</div>
		        		<div id="ganreList" class="d-flex align-items-center justify-content-center my-2"></div>
		        	</div>
		        	
		        	<c:forEach items="${ganreList }" var="ganre">
			        	<div onclick="ganreClick(this)" id="${ganre }" class="ganreDiv p-1 my-2">
			        		${ganre }
			        	</div>
		        	</c:forEach>
		        	
		        </div>
        	</div>
        	
        	<div class="d-flex align-items-center justify-content-center my-4">
        		<button class="moreButton p-2" onclick="moreGame()">더보기</button>
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
    
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <script type="text/javascript">
	    <%-- 대충 이미지 컬럼 구분 하는 코드 --%>
	    <%-- 이미지 컬럼을 나누어 놓고 나누어놓은 배열 사이즈에 맞춰서
	    	 for문을 반복하고 createElement로
	    	 img 태그를 만들고 src에 추가 --%>
    	// let gameUrls = "https://cdn.akamai.steamstatic.com/steam/apps/1169040/ss_a5ed32f738ca984b1a6f656f40d59b5fccccdbd7.1920x1080.jpg?t=1696983938 https://cdn.akamai.steamstatic.com/steam/apps/1169040/ss_a5ed32f738ca984b1a6f656f40d59b5fccccdbd7.1920x1080.jpg?t=1696983938";
    	// document.querySelector('#gameImg').setAttribute('src', gameUrls.split(" ")[1]);
    </script>
    
    <script>
        function prdSort(sortOption){
            console.log("정렬기능 호출 - " + sortOption.innerText);
            
            document.querySelector('#navbarDropdowns').innerText = sortOption.innerText;
            
            let prdList = document.querySelectorAll('#gameList>div.gameList_info');
            let prdList_arr = Array.from(prdList); // 현재 출력 중인 상품들
            let prdSort = []; // 정렬 기준에 따라 상품을 새로 저장할 배열
            
            prdSort[0] = prdList_arr.shift();

            for(let prd_arr of prdList_arr){

                let prdPrice_arr = Number(prd_arr.querySelector('p.prdPrice').innerText);
                let prdSale_arr = Number(prd_arr.querySelector('p.gsale').innerText);
                let prdRelease_arr = prd_arr.querySelector('p.grelease').innerText;
                
                // arrInfo 가격 prdSort 가격 비교
                let idx = -1;
                for(let sortIdx in prdSort){
                    let prdPrice_sort = Number(prdSort[sortIdx].querySelector('p.prdPrice').innerText);
                    let prdSale_sort = Number(prdSort[sortIdx].querySelector('p.gsale').innerText);
                    let prdRelease_sort = prdSort[sortIdx].querySelector('p.grelease').innerText;
                    
                    // console.log(prdPrice_arr + " :: " + prdPrice_sort);
                    
                    let sortCheck = false;
                    switch(sortOption.value){
                        case "price_desc": // 가격이 높은 순
                            sortCheck = prdPrice_arr > prdPrice_sort;
                            break;
                        case "price_asc": // 가격이 낮은 순
                            sortCheck = prdPrice_arr < prdPrice_sort;
                            break;
                        case "sale_desc": // 할인률 높은 순
                        	sortCheck = prdSale_arr > prdSale_sort;
                        	break;
                        case "release_desc":
                        	sortCheck = prdRelease_arr > prdRelease_sort;
                        	break;
                    }

                    if(sortCheck){
                        idx = sortIdx;
                        break;
                    }
                }
                if(idx > -1){
                    prdSort.splice(idx, 0, prd_arr);
                    // arr = [1, 2, 3, 4, 5]
                    // arr.splice(3, 2, 10) >> [1, 2, 3, 10]
                    // .splice(인덱스 번호, (0) 지울 인덱스 개수, 넣을 데이터)
                }
                else{
                    prdSort.push(prd_arr);
                }
            }
            // prdSort[] 옵션에 따라 정렬된 tr 태그
            // tbody >> prdSort를 출력
            let gameListTag = document.querySelector('#gameList');
            gameListTag.innerHTML = "";

            for(let item of prdSort){
                console.log(item);
                gameListTag.appendChild(item);
            }
        }
    </script>
    
    <script type="text/javascript">
    	let ganreList_arr = [];
    	function ganreClick(ganreDiv){
    		console.log('장르 선택 '+ganreDiv.innerText);
    		
    		let ganreList_Div = document.querySelector('#ganreList');
    		
    		
    		if(ganreDiv.classList.contains('ganreDivClick')){
				ganreDiv.classList.remove('ganreDivClick');
		    	ganreList_arr.splice(ganreList_arr.indexOf(ganreDiv.innerText), 1);
    		}
    		
    		else {
	    		ganreDiv.classList.add('ganreDivClick');
	    		
	    		if(!ganreList_arr.includes(ganreDiv.innerText)){
		    		ganreList_arr.push(ganreDiv.innerText);
	    		}
    		}
    		
    		ganreList_Div.innerText = ganreList_arr;
    		
    		ganreSelect(ganreList_arr);
    		
    		// console.log(ganreList_arr);
    	}
    </script>
    
    <script type="text/javascript">
    	function ganreSelect(ganreList_arr){
    		console.log('장르별 정렬 기능 함수 호출 : ' + ganreList_arr);
    		let gameList = Array.from(document.querySelectorAll('Div.gameList_info'));
    		
    		for(let game of gameList){
    			let gameGanre = game.querySelector('.ganre').innerText.split(', ');
    			let check = 0;
    			for(let i=0;i<gameGanre.length;i++){
    				if(ganreList_arr.includes(gameGanre[i])){
    					check+=1;
    				}
    			}
    			if(check == 0){
    				game.classList.add('gameHide');
    			}
    			else {
    				game.classList.remove('gameHide');
    			}
    		}
    		
    		let ganreAllDiv = Array.from(document.querySelectorAll('div.ganreDiv'));
    		let classCount = 0;
    		for(let ganreDiv of ganreAllDiv){
    			if(ganreDiv.classList.contains('ganreDivClick')){
    				classCount+=1;
    			}
    		}
    		if(classCount == 0){
    			for(let game of gameList){
    				game.classList.remove('gameHide');
    			}
    		}
    	}
        </script>
        
        <script type="text/javascript">
	    	function moreGame(){
	    		let gameCount = Number(document.querySelector('#gameCount').innerText);
	    		
	    		if(gameCount == -1){
	    			alert('더이상 불러올 수 있는 게임이 없습니다.');
	    		}
	    		else {
		    		gameCount += 20;	    			
	    			location.href='/gameList?gameCount='+gameCount+'&gtag=';😊
	    		}
	    		
	    	}
        </script>
        
        <script type="text/javascript">
	        $(document).ready(function(){
	        	let gameCount = Number(document.querySelector('#gameCount').innerText);
	        	let statusCounts = Array.from(document.querySelectorAll('p.statusCount'));
	        	
	        	for(let status of statusCounts){
	        		if(Number(status.innerText) == gameCount-20){
	        			status.previousElementSibling.focus();
	        			break;
	        		}
	        		if(gameCount == -1){
	        			document.querySelector('.moreButton').focus();
	        		}
	        	}
	        });
        </script>
        <script type="text/javascript">
	        let ctag = '${ctag}';
			if(ctag.length > 0){
				document.getElementById(ctag).click();
			}
        </script>
</html>
