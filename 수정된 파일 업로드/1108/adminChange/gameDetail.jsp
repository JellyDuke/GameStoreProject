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
        <title>게임 상세 페이지</title>
        <style>
        	.content_Div {
        		border: 1px solid black;
        		border-radius: 5px;
        	}
             
             .game_head{
             	padding-top: 20px;
             }
             
             .game_title {
             	font-weight: bold;
             	margin: 20px 0;
             }
             
             .game_mainImage{
             	border-radius: 5px;
             	margin: 10px 0;
             	min-height: 400px;
             }
             
             .game_list {
             	margin-bottom: 10px;
             	min-height: 150px;
             }
             
             .list_image {
             	border: 1px solid black;
             	border-radius: 5px;
             	min-height: 150px;
             	padding: 7px;
             	margin-top: 20px;
             	display: -webkit-box;
             	overflow: scroll;
             }
             
             .game_imageDiv {
             	margin: 0 5px;
             	width: 200px;
             	cursor: pointer;
             }
             
             .game_imageDiv_focus {
             	border: 3px solid deepskyblue;
    			border-radius: 10px;
             }
             
             .playButton {
             	position: relative;
             	background: none;
             }
             
             .playIcon {
             	position: absolute;
             	left: 70px;
    			bottom: 35px;
             	font-size: 60px;
    			color: white;
             }
             
             .game_image {
             	border-radius: 10px;
             	width: 100%;
             	height: 100%;
             }
             
             .game_smallImage {
             	margin: 10px 0;
             	min-height: 150px;
             }
             
             .game_smallInfo {
             	border: 1px solid black;
             	border-radius: 5px;
             	min-height: 452px;
             }
             
             .game_info_head {
             	margin: 0;
             	font-weight: bold;
    			font-size: 20px;
             }
             
             .game_price {
             	font-size: 25px;
    			font-weight: bold;
             }
             
             .game_price_small {
             	text-decoration: line-through;
			    font-size: 20px;
			    font-weight: bold;
			    color: gray;
             }
             
             .game_price_big {
             	font-size: 27px;
			    font-weight: bold;
			    color: limegreen;
             }
             
             .addBasket_Button {
             	border: none;
             	border-radius: 10px;
             	padding: 15px;
             	width: 70%;
             	background-color: antiquewhite;
             }
             
             .game_contentDiv {
             	border: 1px solid black;
             	border-radius: 5px;
			    width: 50%;
			    min-height: 250px;
			    margin-right: auto;
			    margin-left: auto;
             	--bs-gutter-x: 1.5rem;
			    --bs-gutter-y: 0;
             }
             
             .gameContent_head {
             	border: 1px solid black;
             	border-radius: 15px;
             	text-align: center;
			    font-size: 20px;
			    margin-bottom: 15px;
             }
             
             .gameContent {
             	font-weight: bold;
             	margin-top: 10px;
             	margin-bottom: 10px;
             }
             
             .gameSystemDiv {
             	margin-top: 15px;
             	margin-left: auto;
    			margin-right: auto;
             }
             
             .reviewDiv {
             	border: 1px solid black;
             	border-radius: 5px;
             	width: 50%;
             	min-height: 200px;
			    margin-right: auto;
			    margin-left: auto;
             	--bs-gutter-x: 1.5rem;
			    --bs-gutter-y: 0;
             }
             
             .review_profile {
             	width: 150px;
             	height: 150px;
             }
             
             .profile_image {
             	border-radius: 7px;
             	width: 100%;
             	height: 100%;
             }
             
             .review_info {
             	border: 1px solid black;
             	border-radius: 5px;
             	min-height: 150px;
			    margin-right: auto;
			    margin-left: auto;
             	--bs-gutter-x: 1.5rem;
			    --bs-gutter-y: 0;
             }
             
             .review_content {
			    min-height: 110px;
			    resize: none;
             }
             
             .myReview {
             	border: 1px solid black;
			    border-radius: 10px;
			    width: 20%;
			    height: 80%;
			    display: flex;
			    align-items: center;
			    justify-content: center;
			    text-align: center;
			    font-weight: bold;
             }
             
			.wrap{
				border: 1px solid black;
             	border-radius: 5px;
			    max-width: 60%;
			    height: 100%;
			    padding: 20px;
			    margin: 0 auto; /* 화면 가운데로 */
			    background-color: #fff;
			    box-sizing: border-box;
			}
			.reviewform textarea{
				resize: none;
			    width: 100%;
			    padding: 10px;
			    box-sizing: border-box;
			}
			.rating .rate_radio {
			    position: relative;
			    display: inline-block;
			    z-index: 20;
			    opacity: 0.001;
			    width: 60px;
			    height: 60px;
			    background-color: #fff;
			    cursor: pointer;
			    vertical-align: top;
			    display: none;
			}
			.rating .rate_radio + label {
			    position: relative;
			    display: inline-block;
			    margin-left: -4px;
			    z-index: 10;
			    width: 60px;
			    height: 60px;
			    background-image: url('/resources/images/starrate.png');
			    background-repeat: no-repeat;
			    background-size: 60px 60px;
			    cursor: pointer;
			    background-color: #f0f0f0;
			    caret-color: transparent;
			}
			.rating .rate_radio:checked + label {
			    background-color: #ff8;
			}
			
			.warning_msg {
			    display: none;
			    position: relative;
			    text-align: center;
			    background: #ffffff;
			    line-height: 26px;
			    width: 100%;
			    color: red;
			    padding: 10px;
			    box-sizing: border-box;
			    border: 1px solid #e0e0e0;
			}
			
			.title_star {
				margin: 5px;
			}
			
			.review_write_starValue {
				font-size: 35px;
				font-weight: bold;
			}
			
			.likeButton {
				width: 200px;
			    border-radius: 15px;
			    background-color: azure;
			}
			
			.reviewModify_Button {
				width: 100px;
			    border-radius: 15px;
			    background-color: bisque;
			}
			
			.reviewDelete_Button {
				width: 100px;
			    border-radius: 15px;
			    background-color: orangered;
			}
			
        </style>
        
        <script src="https://kit.fontawesome.com/b213412e2c.js" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
        
        <!-- contents start -->
        <div class="container game_head">
       		<h1 class="game_title">${game.gname }</h1>
       		<c:choose>😊
			       		<c:when test = "${sessionScope.loginId == 'jinseoshin3@naver.com' }">      					
			       			<form action="#" class="border border-dark w-25" onsubmit="return adminChange('${game.gcode }')">
				       			할인율: <input type="number" oninput="changeSalePrice(this.value)" min="1" max="99">%
				       			<br>
				       			현재 가격: <input id="currentPrice" type="text" value="${game.gprice }" disabled="disabled" size="6">
				       			<br>
				           		할인 가격: <input id="salePrice" type="text" value="" disabled="disabled" size="6">
				           		<input type="submit" value="변경">									     								       			
			       			</form>
			          	</c:when>     	
			</c:choose>		
       		<p id="gameCode" hidden="hidden">${game.gcode }</p>
            <div class="row content_Div">
            	<div class="col-lg-8">
            		<div class="game_mainImage">
            			<video id="gameVideo" class="game_image" src="${game.gvideo }" controls muted autoplay loop>
				        	<source type="video/mp4">
				        </video>
				        <img id="gameImg" alt="게임 이미지" src="" class="d-none game_image">
            		</div>
            		<div class="game_list">
            			<div class="list_image">
            				<div class="game_imageDiv game_imageDiv_focus" onclick="img_click(this)">
            					<span class="playButton"><i class="fa-regular fa-circle-play playIcon"></i></span>
            					<video class="game_image" onclick="showVideo()" src="${game.gvideo }">
						        </video>
            				</div>
            				<c:forEach items="${gameImgs }" var="gameImg">
            					<div class="game_imageDiv" onclick="img_click(this)">
	            					<img alt="게임 이미지" src="${gameImg }" class="game_image" onclick="showImg(this)">
            					</div>
            				</c:forEach>
            			</div>
            		</div>
            	</div>
            	
            	<div class="col-lg-4">
            		<div class="game_smallImage">
            			<img alt="게임 대표 이미지" src="${game.gmainimg }" class="game_image">
            		</div>
            		<div class="game_smallInfo p-3">
            			<p class="game_info_head">장르</p>
            			<p>${game.gtag }</p>
            			
            			<p class="game_info_head">제작사</p>
            			<p>${game.gmaker }</p>
            			
            			<p class="game_info_head">배급사</p>
            			<p>${game.gpublisher }</p>
            			
            			<p class="game_info_head">출시일</p>
            			<p class="m-0">${game.grelease }</p>
            			
            			<div class="my-4">
	            			<div class="d-flex align-items-center justify-content-center">
	            				<c:choose>
	            					<c:when test="true">
			            				<p class="game_price_big mx-3">\ ${game.gprice / 100 * (80 - 20)}</p>
				            			<p class="game_price_small mx-3">\ ${game.gprice }</p>
	            					</c:when>
	            					
	            					<c:otherwise>
	            						<p class="game_price ">\ ${game.gprice }</p>
	            					</c:otherwise>
	            				</c:choose>
	            			</div>
	            			
	            			<div class="d-flex align-items-center justify-content-center">
		            			<button class="addBasket_Button" onclick="addBasket('${game.gcode}', '${sessionScope.loginId }')">장바구니에 추가</button>            			
	            			</div>
            			</div>
            		</div>
            	</div>
            	
            </div>
        </div>
        
        <div class="game_contentDiv d-flex justify-content-center p-3 px-5 mt-3">
            <div class="w-100 p-2">
            	<div class="gameContent_head">
	            	게임 설명
            	</div>
            	<div class="gameContent">
            		${game.gcontent.split("게임에 대해")[1] }
            	</div>
            </div>
        </div>
        
        <div class="game_contentDiv d-flex justify-content-center p-2 px-5 mt-3">
        	<c:if test="${minFinalSystem != null }">
	            <div class="gameSystemDiv mx-3">
	            	<p class="gameContent_head">최소 시스템 요구사항</p>
	            	<c:forEach items="${minFinalSystem }" var="minsys">
			            <p class="gameContent">${minsys }</p>	            	
	            	</c:forEach>
	            </div>        	
        	</c:if>
        	<c:if test="${maxFinalSystem != null }">
	            <div class="gameSystemDiv mx-3">
	            	<p class="gameContent_head">권장 시스템 요구사항</p>
	            	<c:forEach items="${maxFinalSystem }" var="maxsys">
			            <p class="gameContent">${maxsys }</p>	            	
	            	</c:forEach>
	            </div>        	
        	</c:if>
        </div>
        
        <c:if test="${sessionScope.loginId != null }">

			<c:choose>
	        	<c:when test="${myReview != null}">
					<%-- 리뷰 수정 --%>
					<div id="modifyReview" class="d-none wrap mt-3 w-50">
						<form id="review_form" name="reviewform" class="reviewform" method="post" action="review_modify">
							<input type="hidden" name="gameCode" value="${game.gcode }">
							<input type="hidden" name="rate" id="rate" value="0" />
							<input type="hidden" name="rcode" value="${myReview.RCODE }">
							<p class="title_star">리뷰 수정하기</p>
							
							<div class="review_rating">
								<div class="warning_msg">별점을 선택해 주세요.</div>
								<div class="d-flex">
									<div class="rating">
										<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
										<input type="checkbox" name="rating" id="rating1" value="1"class="rate_radio" title="1점">
										<label for="rating1"></label>
										<input type="checkbox" name="rating" id="rating2" value="2"class="rate_radio" title="2점">
										<label for="rating2"></label>
										<input type="checkbox" name="rating" id="rating3" value="3"class="rate_radio" title="3점">
										<label for="rating3"></label>
										<input type="checkbox" name="rating" id="rating4" value="4"class="rate_radio" title="4점">
										<label for="rating4"></label>
										<input type="checkbox" name="rating" id="rating5" value="5"class="rate_radio" title="5점">
										<label for="rating5"></label>
									</div>
									
									<div id="starValue"class="review_write_starValue d-flex align-items-center text-center ms-3">
										0
									</div>
									<p class="review_write_starValue d-flex align-items-center text-center m-0">점</p>
									
									<div class="d-flex align-items-center justify-content-center text-center ms-5">
										<button type="button" onclick="modifyCancle()">취소</button>
									</div>
								</div>
							</div>
			
							<div class="review_contents">
								<div class="warning_msg">5자 이상으로 작성해 주세요.</div>
								<textarea rows="10" name="re_content" class="review_textarea"></textarea>
							</div>
			
							<div class="cmd">
								<input class="btn-dark w-100 mt-2" type="button" name="save" id="save" value="리뷰 수정">
							</div>
			
						</form>
					</div>
					<%-- 리뷰 수정 끝 --%>
	        		<div id="myReviewDiv" class="reviewDiv mt-3 mb-3 p-4">
	        			<p id="rcode" hidden="hidden">${myReview.RCODE }</p>
	        			<h2>내가 작성한 리뷰</h2>
		        		<div class="row my-3">
			            	<div class="col-lg-3">
			            		<div class="review_profile d-flex align-items-center justify-content-center mx-auto">
			            			<c:choose>
			            				<c:when test="${myReview.PROFILE == '기본이미지' }">
			            					<img class="profile_image" alt="프로필 이미지" src="resources/images/기본프로필.jpg">
			            				</c:when>
			            				
			            				<c:otherwise>
				            				<img class="profile_image" alt="프로필 이미지" src="${myReview.PROFILE }">		            				
			            				</c:otherwise>
			            			</c:choose>
			            		</div>
			            		<div class="d-flex align-items-center justify-content-center my-1 p-1">${myReview.NICKNAME }</div>
			            	</div>
			            	<div class="col-lg-9">
			            		<div class="review_info p-3">
				            		<div class="d-flex justify-content-center">
				            			<div class="mx-3">
				            				별점 : <c:forEach begin="1" end="${myReview.RSCORE }" step="1">★</c:forEach>
				            			</div>
				            			<div class="mx-3">
				            				추천수 : ${myReview.RLIKE }
				            			</div>
				            			<div class="mx-4">
				            				작성일 : ${myReview.RDATE }
				            			</div>
				            		</div>
				            		<div class="review_content mt-1 mx-2 p-2">
				            			${myReview.RCONTENT }
				            		</div>
			            		</div>
			            	</div>
			            	
			            	<div class="d-flex justify-content-center my-1">
				            	<button class="reviewModify_Button mx-2" onclick="modifyReview()">수정</button>
				            	<button class="reviewDelete_Button mx-2" onclick="deleteReview()">삭제</button>
			            	</div>
			            	
			            </div>
		            </div>
	        	</c:when>
	        	
	        	<c:otherwise>
	        		<div id="myReview" class="wrap mt-3 w-50">
	        			<form id="review_form" name="reviewform" class="reviewform" method="post" action="review_regist">
	        				<input type="hidden" name="gameCode" value="${game.gcode }">
	        				<input type="hidden" name="rate" id="rate" value="0"/>
					        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
					 
					        <div class="review_rating">
					            <div class="warning_msg">별점을 선택해 주세요.</div>
					            	<div class="d-flex">
							            <div class="rating">
							                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
							                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
							                <label for="rating1"></label>
							                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
							                <label for="rating2"></label>
							                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
							                <label for="rating3"></label>
							                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
							                <label for="rating4"></label>
							                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
							                <label for="rating5"></label>
							            </div>
							            <div id="starValue" class="review_write_starValue d-flex align-items-center text-center ms-3">
							            	0
							            </div>
							           	<p class="review_write_starValue d-flex align-items-center text-center m-0">점</p>
					            	</div>
					        </div>
					        
					        <div class="review_contents">
					            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
					            <textarea rows="10" name="re_content" class="review_textarea"></textarea>
					        </div>   
					        
					        <div class="cmd">
					            <input class="btn-dark w-100 mt-2" type="button" name="save" id="save" value="등록">
					        </div>
					        
	        			</form>
			        </div>
	        	</c:otherwise>
	        </c:choose>
        </c:if>
        
        <c:choose>
        	<%-- 가져온 리뷰가 하나라도 있으면 --%>
        	<c:when test="${reviewList != null && reviewList.size() > 0 }">
		        <div class="reviewDiv my-3 p-4 pb-0">
		        	<c:forEach items="${reviewList }" var="review">
		        	
			            <div class="row my-3">
			            	<div class="col-lg-3">
			            		<div class="review_profile d-flex align-items-center justify-content-center mx-auto">
			            			<c:choose>
				            			<c:when test="${review.PROFILE == '기본이미지' }">
				            				<img class="profile_image" alt="프로필 이미지" src="resources/images/기본프로필.jpg">
				            			</c:when>
				            				
				            			<c:otherwise>
					            			<img class="profile_image" alt="프로필 이미지" src="${review.PROFILE }">		            				
				            			</c:otherwise>
				            		</c:choose>
			            		</div>
			            		<div class="d-flex align-items-center justify-content-center text-center my-2 p-1">${review.NICKNAME }</div>
			            	</div>
			            	<div class="col-lg-9">
			            		<div class="review_info p-3">
				            		<div class="d-flex justify-content-center">
				            			<c:if test="${review.MID == sessionScope.loginId }">
					            			<div class="myReview">내 평가</div>				            			
				            			</c:if>
				            			<div class="mx-3">
				            				별점 : <c:forEach begin="1" end="${review.RSCORE }" step="1">★</c:forEach>
				            			</div>
				            			<div class="mx-3">
				            				추천수 : ${review.RLIKE }
				            			</div>
				            			<div class="mx-4">
				            				작성일 : ${review.RDATE }
				            			</div>
				            		</div>
				            		<div class="review_content mt-1 mx-2 p-2">
				            			${review.RCONTENT }
				            		</div>
			            		</div>
			            	</div>
			            	
			            	<div class="d-flex justify-content-center">
			            		<button class="likeButton mx-3" onclick="reLike('${sessionScope.loginId}', '${review.RCODE}', 'good')">좋아요</button>
			            		<button class="likeButton mx-3" onclick="reLike('${sessionScope.loginId}', '${review.RCODE}', 'bad')">싫어요</button>
			            	</div>
			            	
			            </div>
		        	</c:forEach>
		            
		        </div>
        	</c:when>
        	
        	<%-- 아직 작성된 리뷰가 없으면 --%>
        	<c:otherwise>
        		<div class="reviewDiv d-flex justify-content-center my-3 p-4">
        			아직 작성된 리뷰가 없어요.
        		</div>
        	</c:otherwise>
        </c:choose>
        <!-- contents end -->

        <!-- Footer-->
        <%@ include file="/WEB-INF/views/include/footer.jsp"%>
        
    </body>
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Core theme JS-->
    <script src="resources/users/js/scripts.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <script type="text/javascript">
		let msg = '${msg}';
		if(msg.length > 0){
			alert(msg);
		}
	</script>
    
    <script type="text/javascript">😊
    	let saleper = 0;
    	let currentPrice = document.querySelector("#currentPrice");
    	let salePrice = document.querySelector("#salePrice");
    	function changeSalePrice(sper){
    		console.log(sper);
    		saleper = (100-sper)/100;
    		salePrice.value = currentPrice.value*(100-sper)/100;
    		console.log(saleper);
    	}
    	
    	function adminChange(gcode){
    		if(saleper == 0){
    			alert("할인율 입력해주세요");
    			return false;
    		}
    		$.ajax({
			    type : 'get',
			    url : 'adminChange',
			    data : {'percent' : saleper,
			    		'gcode' : gcode},
			    async : false,
			    success : function(checknum){
			    	console.log(checknum);
			    	if(checknum > 0){
			    		alert("변경완료");	
			    	} else{
			    		alert("변경실패");
			    	}
			    				
			    }
			})
			location.reload();
			return false;
    	}
    </script>
    
    <script type="text/javascript">
	  //별점 마킹 모듈 프로토타입으로 생성
	    function Rating(){};
	    Rating.prototype.rate = 0;
	    Rating.prototype.setRate = function(newrate){
	        //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	        this.rate = newrate;
	        let items = document.querySelectorAll('.rate_radio');
	        items.forEach(function(item, idx){
	            if(idx < newrate){
	                item.checked = true;
	            }else{
	                item.checked = false;
	            }
	        });
	    }
	    let rating = new Rating();//별점 인스턴스 생성
	    
	    document.addEventListener('DOMContentLoaded', function(){
	        //별점선택 이벤트 리스너
	        if(document.querySelector('.rating') != null){
		        document.querySelector('.rating').addEventListener('click',function(e){
		            let elem = e.target;
		            if(elem.classList.contains('rate_radio')){
		                rating.setRate(parseInt(elem.value));
				        document.querySelector('#starValue').innerText = e.target.value;
				        document.querySelector('#rate').value = e.target.value;
				    }
		        })
	        }
	    });
	    
		  //상품평 작성 글자수 초과 체크 이벤트 리스너
		  if(document.querySelector('.review_textarea') != null){
		    document.querySelector('.review_textarea').addEventListener('keydown',function(){
		        //리뷰 900자 초과 안되게 자동 자름
		        let review = document.querySelector('.review_textarea');
		        let lengthCheckEx = /^.{900,}$/;
		        if(lengthCheckEx.test(review.value)){
		            //900자 초과 컷
		            review.value = review.value.substr(0,900);
		        }
		    });
		  }
	
		    //저장 전송전 필드 체크 이벤트 리스너
		    if(document.querySelector('#save') != null){
			    document.querySelector('#save').addEventListener('click', function(e){
			        //별점 선택 안했으면 메시지 표시
			        if(rating.rate == 0){
			            rating.showMessage('rate');
			            return false;
			        }
			        //리뷰 5자 미만이면 메시지 표시
			        if(document.querySelector('.review_textarea').value.length < 5){
			            rating.showMessage('review');
			            return false;
			        }
			        //폼 서밋
			        document.querySelector('#review_form').submit();
			    });
		    }
		    
		    Rating.prototype.showMessage = function(type){//경고메시지 표시
			    switch(type){
			        case 'rate':
			            //안내메시지 표시
			            document.querySelector('.review_rating .warning_msg').style.display = 'block';
			            //지정된 시간 후 안내 메시지 감춤
			            setTimeout(function(){
			                document.querySelector('.review_rating .warning_msg').style.display = 'none';
			            }, 2000);            
			            break;
			        case 'review':
			            //안내메시지 표시
			            document.querySelector('.review_contents .warning_msg').style.display = 'block';
			            //지정된 시간 후 안내 메시지 감춤
			            setTimeout(function(){
			                document.querySelector('.review_contents .warning_msg').style.display = 'none';
			            }, 2000);    
			            break;
			    }
			}
    </script>
    
    <script type="text/javascript">
    	function showVideo(){
    		document.querySelector('#gameImg').classList.add('d-none');;
    		let gameVideo = document.querySelector('#gameVideo');
    		gameVideo.classList.remove('d-none');
    	}
    	
    	function showImg(imgEl){
    		document.querySelector('#gameVideo').classList.add('d-none');
    		let gameImg = document.querySelector('#gameImg');
    		gameImg.classList.remove('d-none');
    		gameImg.setAttribute('src', imgEl.getAttribute('src'));
    	}
    </script>
    
    <script type="text/javascript">
    	function img_click(divEl){
    		console.log('이미지 클릭');
    		let imgDivs = document.querySelectorAll('.game_imageDiv');
    		for(let img of imgDivs){
    			img.classList.remove('game_imageDiv_focus');
    		}
    		divEl.classList.add('game_imageDiv_focus');
    	}
    </script>
    
    <script type="text/javascript">
    	function deleteReview(){
    		let deleteCheck = confirm('리뷰를 삭제하시겠습니까?');
    		if(deleteCheck == true){
    			let rcode = document.querySelector('#rcode').innerText;
    			let gcode = document.querySelector('#gameCode').innerText;
    			console.log(gcode);
    			location.href = '/deleteReview?rcode='+rcode+'&gcode='+gcode;
    		}
    	}
    </script>
    
    <script type="text/javascript">
    	function modifyReview(){
    		let modifyReviewDiv = document.querySelector('#modifyReview');
    		modifyReviewDiv.classList.remove('d-none');
    		let myReviewDiv = document.querySelector('#myReviewDiv');
    		myReviewDiv.classList.add('d-none');
    	}
    </script>
    
    <script type="text/javascript">
    	function modifyCancle(){
    		let modifyReviewDiv = document.querySelector('#modifyReview');
    		modifyReviewDiv.classList.add('d-none');
    		let myReviewDiv = document.querySelector('#myReviewDiv');
    		myReviewDiv.classList.remove('d-none');
    	}
    </script>
    
    <script type="text/javascript">
    	function reLike(memId, rcode, selected){
    		$.ajax({
    			type : "get",
    			url : "/modifyReviewLikes",
    			data : { "memId" : memId, "rcode" : rcode, "selected" : selected },
    			success : function(re){
    				if(re == '3'){
    					alert('이미 해당 리뷰를 평가했습니다.');
    				}
    				else {
    					alert('리뷰를 성공적으로 평가했습니다.');
    				}
    				console.log(re);
    			}
    		});
    	}
    </script>
    
    <script type="text/javascript">
    	function addBasket(gcode, memId){
    		console.log('장바구니 추가');
    		$.ajax({
    			type : "get",
    			url : "/addGameBasket",
    			data : { "gcode" : gcode, "memId" : memId },
    			success : function(re){
    				if(re == '1'){
    					let check = confirm('장바구니에 게임을 성공적으로 추가하였습니다.\n장바구니 페이지로 이동하시겠습니까?');
    					if(check == true){
    						location.href = '/basketpage';
    					}
    				}
    				else {
    					alert('장바구니에 게임을 추가하던 중 오류가 발생했습니다.');
    				}
    			}
    		});
    	}
    </script>
    
</html>
