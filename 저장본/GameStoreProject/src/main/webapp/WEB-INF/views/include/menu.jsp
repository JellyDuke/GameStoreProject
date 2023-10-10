<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <!-- icon -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/users/assets/favicon.ico" />

        <!-- bootstrap icon-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
       
        <!-- bootstrap css-->
        <link href="${pageContext.request.contextPath }/resources/users/css/styles.css" rel="stylesheet" />

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${pageContext.request.contextPath }/">GameStoreProject</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-12">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">상점</a></li>
                        <li class="nav-item"><a class="nav-link active" href="#!">고객지원</a></li>
                        
                    <li class="nav-item" style="margin-left: 70px;"> <input type="text" name="search" placeholder="search" class="nav-link active" style="width: 500px;"> </li>
                   
                   	<c:choose>
                    
                  		<c:when test="${sessionScope.loginId = null }">    
                       		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/loginpage">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/joinpage">회원가입</a></li>
                   		</c:when> 
                        
                        <c:otherwise>
	                        <li class="nav-item dropdown" style="margin-left: 70px;">
	                            <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">프로필</a>
	                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/mypage">내 정보</a></li>
									<li><a class="dropdown-item" href="${pageContext.request.contextPath }/mygamepage">내 게임</a></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/myreviewpage">내 리뷰</a></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/mywishlist">내 찜 목록</a></li>
	                                <li><hr class="dropdown-divider" /></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/paymentHistorypage">결제내역/환불</a></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath }/pointrechargepage">포인트 충전</a></li>
	                           		<li><a class="dropdown-item" href="${pageContext.request.contextPath }/mycouponpage">내 쿠폰함</a></li>
	                           		<li><hr class="dropdown-divider" /></li>
	                           		<li><a class="dropdown-item" href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
	                            </ul>
	                        </li>
                        </c:otherwise>
                        
                    </c:choose>
                    
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
