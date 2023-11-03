<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
        <!-- icon -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/users/assets/favicon.ico" />

        <!-- bootstrap icon-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
       
        <!-- bootstrap css-->
        <link href="${pageContext.request.contextPath }/resources/users/css/styles.css" rel="stylesheet" />
<style>
			#typesearch{    			
    			width: 500px;
    			overflow: hidden;
    			text-align: center;
    			white-space: nowrap;
    			height: auto;
    			position: absolute;  
    			max-height: 600px; 
    			overflow: hidden;			
    		}
    		.onkey{
    			z-index: 10;
    			background-color: bisque;
    		}
    		#typesearch>a{
    			text-decoration: none;
    		}
    		#imgdiv{
    			width: 180px;
    			height: 95px;
    			min-width: 180px;
    		}
    		#imgdiv>img{
    			padding-left: 5px;
    			width: 100%;
    			height: 100%;
    			border-radius: 10px;
    		}
    		#infodiv{
    			height: 100px;
    			width: 100%;
    			display: flex;
    			padding: 0;
    			padding-bottom: 5px;
    		}
    		#tpdiv{
    			height: 100%;
    			width: 360px;   			
    		}
    		#tpdiv>div{
    			height: 50%;
    			width: 100%; 
    			text-align: left;
    			padding-left: 15px;
    		}
    		#infodiv:hover{
    			background-color: white;
    		}
    		#salediv{
    			background-color: green;
    			color: white;
    			border: 1px solid black;
    			height: 60%;
    			width: 30%;
    			text-align: center;
    		}    	
    		#tdiv>div{
    			height: 50%;
    			margin-top: 5px;
    			width: 100%;
    		}
    		#pdiv{
    			margin-top: 10px;
    			display: flex;
    		}  		
		</style>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${pageContext.request.contextPath }/companyView">GameStoreProject</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-12">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/">상점</a></li>
                        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/serviceCenter">고객지원</a></li>
                        
                    <li class="nav-item" style="margin-left: 45px;"> <input onclick="printType(this.value)" oninput="printType(this.value)" type="text" name="search" placeholder="search" class="nav-link active search" style="width: 500px;"><div id="typesearch"></div></li>
                    
                   	<c:choose>
                  		<c:when test = "${sessionScope.loginId == null }">   
                       		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/loginpage">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/joinpage">회원가입</a></li>
                   		</c:when> 
                        
                        <c:otherwise>
	                        <li class="nav-item dropdown" style="margin-left: 70px;">
	                        
	                            <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                            <c:choose>
									<c:when test="${sessionScope.loginState == 'YP' }">
										<img style="width: 30px; height: 30px;" src="${pageContext.request.contextPath }/resources/memberprofile/${sessionScope.loginProfile }">
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${sessionScope.loginState == 'Y ' }">
												<img style="width: 30px; height: 30px;" src="${pageContext.request.contextPath }/resources/users/assets/img/basic.png">
											</c:when>
											<c:otherwise>
	                           					 <img style="width: 30px; height: 30px;" src="${sessionScope.loginProfile }">
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
	                             ${sessionScope.loginMnickname }
	                            </a>
	                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/mypage">내 정보</a></li>
									<li><a class="dropdown-item" href="${pageContext.request.contextPath }/mygamepage">내 게임</a></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/myreviewpage">내 리뷰</a></li>
	                                <li><hr class="dropdown-divider" /></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/paymentHistory">결제내역/환불</a></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/pointrechargepage">포인트 충전</a></li>
	                           		<li><a class="dropdown-item" href="${pageContext.request.contextPath }/mycouponpage">내 쿠폰함</a></li>
	                           		<li><hr class="dropdown-divider" /></li>
	                           		<li><a class="dropdown-item" href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
	                            </ul>
	                        </li>
                        </c:otherwise>
                        
                    </c:choose>
                    
                    </ul>
                    <form class="d-flex" action="${pageContext.request.contextPath }/basketpage" method="get">
                        <button class="btn btn-outline-dark">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script type="text/javascript">
		let uid = '<%=(String)session.getAttribute("loginId")%>'; 
		if(uid == 'jinseoshin3@naver.com'){
			$('.search').attr( 'disabled', 'disabled' );
			$('#typesearch').hide();
		}		
		function printType(text){
    		console.log(text.length);
    		if(text.length>0){
	    		$.ajax({
	    			type : 'get',
	    			url : '${pageContext.request.contextPath }/printgame',
	    			data : {'text' : text,
	    				},
	    			success : function(typeList){
	    				let searchDiv = document.querySelector("#typesearch");
	    				let br = document.createElement('br');
	    				searchDiv.innerHTML="";
	    				searchDiv.classList.add('onkey');
	    				searchDiv.classList.add('check');
	    				for(let i=0; i<typeList.length; i++){
	    					let infoD = document.createElement('div');
	    					infoD.classList.add('check');
	    					let tpD = document.createElement('div');
	    					tpD.classList.add('check');
	    					tpD.setAttribute('id','tpdiv');	    	
	    					let tD = document.createElement('div');	
	    					tD.setAttribute('id','tdiv');
	    					tD.classList.add('check');
	    					let titleD = document.createElement('div');
	    					titleD.classList.add('check');
	    					titleD.innerText = typeList[i].gname;
	    					tD.appendChild(titleD);
	    					let tagD = document.createElement('div');
	    					tagD.classList.add('check');
	    					tagD.innerText = typeList[i].gtag;
	    					tD.appendChild(tagD);
	    					let pD = document.createElement('div');	 
	    					pD.classList.add('check');	  
	    					pD.setAttribute('id','pdiv');
	    					if(typeList[i].gsale != 0){
	    						let sD = document.createElement('div');
	    						sD.setAttribute('id','salediv');
	    						sD.classList.add('check');
		    					sD.innerText += " "+typeList[i].gsale+'% OFF';	
		    					pD.appendChild(sD);
		    					let prD = document.createElement('div');
	    						prD.classList.add('check');
		    					prD.innerText += "  ₩ "+Math.floor(typeList[i].gprice*((100-typeList[i].gsale)*0.01)/10)*10;	    
		    					prD.setAttribute('style','padding-left: 10px;')
		    					pD.appendChild(prD);
	    					} else {
	    						pD.innerText = "₩ "+	typeList[i].gprice;
	    					}
	    					infoD.setAttribute('id','infodiv');	 	    					  					
	    					let imgD = document.createElement('div');
	    					imgD.classList.add('check');
	    					imgD.setAttribute('id','imgdiv');	 
	    					let img = document.createElement('img');
	    					img.classList.add('check');
	    					img.setAttribute('src',typeList[i].gmainimg);	    					
	    					let typeA = document.createElement('a');
	    					typeA.innerText = typeList[i].gname;
	    					typeA.setAttribute('id',typeList[i].gname);
	    					typeA.setAttribute('onclick','change(this)');
	    					tpD.appendChild(tD);
	    					tpD.appendChild(pD);
	    					imgD.appendChild(img);
	    					infoD.appendChild(imgD);
	    					infoD.appendChild(tpD);
	    					let infoA = document.createElement('a');
	    					infoA.appendChild(infoD);
	    					infoA.setAttribute('href','${pageContext.request.contextPath }/gameDetail/?gcode='+typeList[i].gcode);
	    					infoA.setAttribute('style','color: black;')
	    					searchDiv.appendChild(infoA);
	    				}
	    			}
	    		}).then()
    			
    		}    			
    	}
		$(document).click(function(e){
		    if(e.target.className =="check"){
		    	
		    }
		    else if(e.target.className =="check onkey"){
		    } else{
			    let searchDiv = document.querySelector("#typesearch");
			    searchDiv.innerHTML="";
			    $("#typesearch").removeClass('onkey');		    			    		    		    	
		    }
		})		
		</script>