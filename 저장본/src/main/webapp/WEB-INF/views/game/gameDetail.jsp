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
             	margin: 20px 0;
             }
             
             .game_mainImage{
             	border: 1px solid black;
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
             
             .game_imagese {
             	border: 1px solid black;
             	border-radius: 5px;
             	margin: 0 5px;
             	width: 200px;
             }
             
             .game_smallImage {
             	border: 1px solid black;
             	border-radius: 5px;
             	margin: 10px 0;
             	min-height: 150px;
             }
             
             .game_smallInfo {
             	border: 1px solid black;
             	border-radius: 5px;
             	min-height: 405px;
             }
             
             .top_bar {
             	border: 1px solid black;
             	border-radius: 5px;
             	margin-right: auto;
			    margin-left: auto;
             	width: 70%;
             	height: 70px;
             	display: flex;
             	--bs-gutter-x: 1.5rem;
			    --bs-gutter-y: 0;
			    
             }
             
             .game_price {
             	border: 1px solid black;
             	border-radius: 5px;
             	min-width: 200px;
             	height: 50px;
             }
             
             .add_game {
             	border: 1px solid black;
             	border-radius: 5px;
             	width: 150px;
             	height: 50px;
             	margin-left: 50px;
             }
             
             .game_content {
             	border: 1px solid black;
             	border-radius: 5px;
			    width: 50%;
			    min-height: 300px;
			    margin-right: auto;
			    margin-left: auto;
             	--bs-gutter-x: 1.5rem;
			    --bs-gutter-y: 0;
             }
             
             .reviewDiv {
             	border: 1px solid black;
             	border-radius: 5px;
             	width: 60%;
             	min-height: 200px;
			    margin-right: auto;
			    margin-left: auto;
             	--bs-gutter-x: 1.5rem;
			    --bs-gutter-y: 0;
             }
             
             .review_profile {
             	border: 1px solid black;
             	border-radius: 5px;
             	width: 150px;
             	height: 150px;
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
             	width: 500px;
			    min-height: 110px;
			    resize: none;
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
			    background-image: url('/resources/users/assets/starrate.png');
			    background-repeat: no-repeat;
			    background-size: 60px 60px;
			    cursor: pointer;
			    background-color: #f0f0f0;
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
			
        </style>
        
    </head>
    
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
        
        <!-- contents start -->
        <div class="container game_head">
       		<h2 class="game_title">게임 제목</h2>
            <div class="row content_Div">
            	<div class="col-lg-8">
            		<div class="game_mainImage">
            			사진
            		</div>
            		<div class="game_list">
            			<div class="list_image">
            				<div class="game_imagese">동영상</div>
            				<div class="game_imagese">이미지2</div>
            				<div class="game_imagese">이미지3</div>
            				<div class="game_imagese">이미지4</div>
            				<div class="game_imagese">이미지5</div>
            				<div class="game_imagese">이미지6</div>
            				<div class="game_imagese">이미지7</div>
            				<div class="game_imagese">이미지8</div>
            			</div>
            		</div>
            	</div>
            	
            	<div class="col-lg-4">
            		<div class="game_smallImage">
            			사진
            		</div>
            		<div class="game_smallInfo">
            			간단한 설명 및 태그
            		</div>
            	</div>
            	
            </div>
        </div>
        
        <div class="top_bar text-center d-flex align-items-center justify-content-center mt-3">
            <div class="game_price d-flex align-items-center justify-content-center">할인/가격</div>
            <div class="add_game d-flex align-items-center justify-content-center">장바구니에 추가</div>
        </div>
        
        <div class="game_content d-flex justify-content-center p-3 px-5 mt-3">
            <div class="d-flex justify-content-center w-100 p-2">
            	게임 설명
            </div>
        </div>
        
        <div class="game_content d-flex justify-content-center p-3 px-5 mt-3 w-75">
            <div class="d-flex justify-content-center w-50 p-2">
            	최소 시스템 요구사항
            </div>
            <div class="d-flex justify-content-center w-50 p-2">
            	권장 시스템 요구사항
            </div>
        </div>
        
        <%-- 리뷰를 쓴 적이 있으면 내가 쓴 리뷰를 표시하고
        	 리뷰를 쓴 적이 없으면 리뷰 작성 양식을 표시
        	 
        	 페이지 이동 전 리뷰에 관한 정보를 담을 때
        	 리뷰 작성자 아이디를 담아 주고 세션 아이디와 비교 --%>
        <c:choose>
        	<%-- 리뷰를 쓴 적이 있으면 --%>
        	<c:when test="false">
        		<div class="reviewDiv mt-3 mb-5 p-4">
        			<h2>내가 작성한 리뷰</h2>
	        		<div class="row my-3">
		            	<div class="col-lg-3">
		            		<div class="review_profile d-flex align-items-center justify-content-center mx-auto">프로필</div>
		            		<div class="d-flex align-items-center justify-content-center my-1 p-1">닉네임</div>
		            	</div>
		            	<div class="col-lg-9">
		            		<div class="review_info p-3">
			            		<div class="d-flex justify-content-center">
			            			<div class="mx-3">
			            				별점 ★★★★★
			            			</div>
			            			<div class="mx-3">
			            				추천수 : 1
			            			</div>
			            			<div class="mx-4">
			            				작성일 : 2023-10-11 18:42
			            			</div>
			            		</div>
			            		<div class="review_content mt-1 px-3">
			            			리뷰 내용
			            		</div>
		            		</div>
		            	</div>
		            	
		            	<div class="d-flex justify-content-center mt-1">
			            	<button class="mx-2">수정</button>
			            	<button class="mx-2">삭제</button>
		            	</div>
		            	
		            </div>
	            </div>
        	</c:when>
        	
        	<%-- 리뷰를 쓴 적이 없으면 --%>
        	<c:otherwise>
        		<div id="myReview" class="wrap mt-3 w-50">
        			<form id="review_form" name="reviewform" class="reviewform" method="post" action="">
        				<input type="hidden" name="rate" id="rate" value="0"/>
				        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
				 
				        <div class="review_rating d-flex">
				            <div class="warning_msg">별점을 선택해 주세요.</div>
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
				            <div id="starValue" class="review_write_starValue d-flex align-items-center text-center mx-3">
				            	0점
				            </div>
				        </div>
				        
				        <div class="review_contents">
				            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
				            <textarea rows="10" class="review_textarea"></textarea>
				        </div>   
				        
				        <div class="cmd">
				            <input class="btn-dark w-100 mt-2" type="button" name="save" id="save" value="등록">
				        </div>
				        
        			</form>
		        </div>
        	</c:otherwise>
        </c:choose>
        
        <c:choose>
        	<%-- 가져온 리뷰가 하나라도 있으면 --%>
        	<c:when test="true">
		        <div class="reviewDiv mt-3 p-4">
		            <div class="row my-3">
		            	<div class="col-lg-3">
		            		<div class="review_profile d-flex align-items-center justify-content-center mx-auto">프로필</div>
		            		<div class="d-flex align-items-center justify-content-center my-1 p-1">닉네임</div>
		            	</div>
		            	<div class="col-lg-9">
		            		<div class="review_info p-3">
			            		<div class="d-flex justify-content-center">
			            			<div class="mx-3">
			            				별점 ★★★★★
			            			</div>
			            			<div class="mx-3">
			            				추천수 : 1
			            			</div>
			            			<div class="mx-4">
			            				작성일 : 2023-10-11 18:42
			            			</div>
			            		</div>
			            		<div class="review_content mt-1 px-3">
			            			리뷰 내용
			            		</div>
		            		</div>
		            	</div>
		            	
		            	<div class="d-flex justify-content-center mt-1">
		            		<button class="mx-2">좋아요</button>
		            		<button class="mx-2">싫어요</button>
		            	</div>
		            	
		            </div>
		            <div class="row my-3">
		            	<div class="col-lg-3">
		            		<div class="review_profile d-flex align-items-center justify-content-center mx-auto">프로필</div>
		            		<div class="d-flex align-items-center justify-content-center my-1 p-1">닉네임</div>
		            	</div>
		            	<div class="col-lg-9">
		            		<div class="review_info p-3">
			            		<div class="d-flex justify-content-center">
			            			<div class="mx-3">
			            				별점 ★★★☆☆
			            			</div>
			            			<div class="mx-3">
			            				추천수 : 3
			            			</div>
			            			<div class="mx-4">
			            				작성일 : 2023-10-11 20:14
			            			</div>
			            		</div>
			            		<div class="review_content mt-1 px-3">
			            			리뷰 내용
			            		</div>
		            		</div>
		            	</div>
		            	
		            	<div class="d-flex justify-content-center mt-1">
		            		<button class="mx-2">좋아요</button>
		            		<button class="mx-2">싫어요</button>
		            	</div>
		            	
		            </div>
		            
		        </div>
        	</c:when>
        	
        	<%-- 아직 작성된 리뷰가 없으면 --%>
        	<c:otherwise>
        		<div class="reviewDiv d-flex justify-content-center mt-3 p-4">
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
	        document.querySelector('.rating').addEventListener('click',function(e){
	            let elem = e.target;
	            if(elem.classList.contains('rate_radio')){
	                rating.setRate(parseInt(elem.value));
			        document.querySelector('#starValue').innerText = e.target.value + "점";
	            }
	        })
	    });
	    
		  //상품평 작성 글자수 초과 체크 이벤트 리스너
		    document.querySelector('.review_textarea').addEventListener('keydown',function(){
		        //리뷰 900자 초과 안되게 자동 자름
		        let review = document.querySelector('.review_textarea');
		        let lengthCheckEx = /^.{900,}$/;
		        if(lengthCheckEx.test(review.value)){
		            //900자 초과 컷
		            review.value = review.value.substr(0,900);
		        }
		    });
	
		    //저장 전송전 필드 체크 이벤트 리스너
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
		    
		    Rating.prototype.showMessage = function(type){//경고메시지 표시
			    switch(type){
			        case 'rate':
			            //안내메시지 표시
			            document.querySelector('.review_rating .warning_msg').style.display = 'block';
			            //지정된 시간 후 안내 메시지 감춤
			            setTimeout(function(){
			                document.querySelector('.review_rating .warning_msg').style.display = 'none';
			            },1000);            
			            break;
			        case 'review':
			            //안내메시지 표시
			            document.querySelector('.review_contents .warning_msg').style.display = 'block';
			            //지정된 시간 후 안내 메시지 감춤
			            setTimeout(function(){
			                document.querySelector('.review_contents .warning_msg').style.display = 'none';
			            },1000);    
			            break;
			    }
			}
    </script>
    
</html>