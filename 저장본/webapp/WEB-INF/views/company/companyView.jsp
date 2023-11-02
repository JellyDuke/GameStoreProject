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
        <title>회사 소개</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }/resources/users/css/stylesCompany.css" rel="stylesheet" />
        <style type="text/css">
        .atag{
       	 text-decoration: none;
        }
        </style>
    </head>
    <body id="page-top">
        
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>        
        
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                        <h1 class="mx-auto my-0 text-uppercase">GameStore</h1>
                        <a class="btn btn-primary" href="${pageContext.request.contextPath }/">GO START</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- Projects-->
        <section class="projects-section bg-light" id="projects">
            <div class="container px-4 px-lg-5">
                <!-- Featured Project Row-->
                <div class="row gx-0 mb-4 mb-lg-5 align-items-center">
                    <div class="col-xl-8 col-lg-7">
                    	<video class="video img-fluid mb-3 mb-lg-0" autoplay muted controls>
                    		<source type="video/webm" src="${pageContext.request.contextPath }/resources/users/assets/img/sekiro.webm" >
                   		</video>
                   	</div>
                    <div class="col-xl-4 col-lg-5">
                        <div class="featured-text text-center text-lg-left">
                            <h4>액션감!</h4>
                            <p class="text-black-50 mb-0">이 미친 게임을 보십시오!</p>
                        </div>
                    </div>
                </div>
                <hr>
                <!-- Project One Row-->
                <div class="row gx-0 mb-5 mb-lg-0 justify-content-center">
	                  	<div class="col-lg-6">
	                    	<video class="video img-fluid mb-3 mb-lg-0" autoplay muted controls>
                    			<source type="video/webm" src="${pageContext.request.contextPath }/resources/users/assets/img/7Days.webm" >
                   			</video>
	                    </div>
                    <div class="col-lg-6">
                        <div class="bg-black text-center h-100 project">
                            <div class="d-flex h-100">
                                <div class="project-text w-100 my-auto text-center text-lg-left">
                                    <h4 class="text-white">놀라운 존재!</h4>
                                    <p class="mb-0 text-white-50">강력한 야생에 좀비가 나타났습니다!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Project Two Row-->
                <div class="row gx-0 justify-content-center">
	                    <div class="col-lg-6">
	                    	<video class="video img-fluid mb-3 mb-lg-0" autoplay muted controls>
                    			<source type="video/webm" src="${pageContext.request.contextPath }/resources/users/assets/img/fifa.webm" >
                   			</video>
	                    </div>
                    <div class="col-lg-6 order-lg-first">
                        <div class="bg-black text-center h-100 project">
                            <div class="d-flex h-100">
                                <div class="project-text w-100 my-auto text-center text-lg-right">
                                    <h4 class="text-white">놀라운 경험!</h4>
                                    <p class="mb-0 text-white-50">이 엄청난 발재간을 보십시오!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		<hr>
        <!-- Signup-->
        <section class="signup-section" id="signup">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-10 col-lg-8 mx-auto text-center">
                        <a class="atag" href="${pageContext.request.contextPath }/loginpage"><h2 class="text-white mb-5">지금 가입하세요!</h2></a>
                    </div>
                </div>
            </div>
        </section>
		<hr>
        
        <!-- Footer-->
        <%@ include file="/WEB-INF/views/include/footer.jsp"%>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/users/js/scriptsCompany.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <!-- Core theme JS-->
        <script src="resources/users/js/scripts.js"></script>
    </body>
</html>
