<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/users/css/stylesCompany.css" rel="stylesheet" />
</head>
<body>
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	<!-- 배너(헤더) -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 내용 -->
	<section class="py-5">				
		<hr>
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${GameList }" end="11" var="gl" varStatus="status">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Sale badge-->
							<c:if test="${gl.gsale > 1 }">
								<div class="badge bg-dark text-white position-absolute"
									style="top: 0.5rem; right: 0.5rem">Sale</div>
							</c:if>
							<!-- Product image-->
							<img class="card-img-top" src="${gl.gimg}" alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${gl.gname }</h5>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<c:choose>
										<c:when test="${gl.gsale > 1 }">
											<span class="text-muted text-decoration-line-through">${gl.gprice }₩</span>
		                                    ${gl.gsale }₩
                                    	</c:when>
										<c:otherwise>
                                    		${gl.gprice }₩
                                    	</c:otherwise>
									</c:choose>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto" href="/gameDetail?gcode=${gl.gcode }">GAME VIEW</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="border border-dark text-center" style="width: 300px; height: auto; border-radius: 10px; background-color: black;">😊
					<a style="text-decoration: none; font-size: 25px; color: white; " href="${pageContext.request.contextPath }/gameList?gameCount=20&gtag=">게임 더보기</a>
				</div>	
			</div>
		</div>
	</section>
	<hr>
	<div class="row gx-0 mb-5 mb-lg-0 justify-content-center">
		<div class="col-lg-6">
			<video class="video img-fluid mb-3 mb-lg-0" autoplay muted controls style="margin-left: 50px;">
				<source type="video/webm" src="${pageContext.request.contextPath }/resources/users/assets/img/left4.webm">
			</video>
		</div>
		<div class="col-lg-6">
			<div class="bg-black text-center h-50 project">
				<div class="d-flex h-100">
					<div class="project-text w-100 my-auto text-center text-lg-left">
						<h4 class="text-white">놀라운 존재!</h4>
						<p class="mb-0 text-white-50">강력한 야생에 좀비가 나타났습니다!</p>
					</div>

				</div>
			</div>
			<video class="video img-fluid mb-3 mb-lg-0" autoplay muted controls style="width: 300px; height: 250px;">
				<source type="video/webm"src="${pageContext.request.contextPath }/resources/users/assets/img/7Days.webm">
			</video>
			<video class="video img-fluid mb-3 mb-lg-0" autoplay muted controls style="width: 300px; height: 250px;">
				<source type="video/webm"src="${pageContext.request.contextPath }/resources/users/assets/img/worldz.webm">
			</video>
			<video class="video img-fluid mb-3 mb-lg-0" autoplay muted controls style="width: 300px; height: 250px;">
				<source type="video/webm"src="${pageContext.request.contextPath }/resources/users/assets/img/dying.webm">
			</video>
		</div>
	</div>
	<hr>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/users/js/scripts.js"></script>
	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
	<script type="text/javascript">
		let msg = '${msg}';
		if(msg.length > 0){
			alert(msg);
		}
	</script>
</html>

