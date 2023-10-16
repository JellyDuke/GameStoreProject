<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>GameStorePorject</title>

<!-- icon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/users/assets/favicon.ico" />

<!-- bootstrap icon-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- bootstrap css-->
<link
	href="${pageContext.request.contextPath }/resources/users/css/styles.css"
	rel="stylesheet" />
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Raleway, sans-serif;
}

body {
	background: white;
}

.screen_container {
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

.container>div {
	z-index: 3;
}

.screen {
	background: linear-gradient(90deg, #b8e2ff, #78a4b8);
	position: relative;
	height: 950px;
	width: 1200px;
	box-shadow: 0px 0px 24px #b5c5f1;

}


.screen__background {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 0;
	-webkit-clip-path: inset(0 0 0 0);
	clip-path: inset(0 0 0 0);
}

.screen__background>span {
	z-index: -2;
}

.screen__background__shape {
	transform: rotate(45deg);
	position: absolute;
}

.screen__background__shape1 {
	height: 520px;
	width: 520px;
	background: #FFF;
	top: -50px;
	right: 120px;
	border-radius: 0 72px 0 0;
}

.screen__background__shape2 {
	height: 220px;
	width: 220px;
	background: hsl(187, 50%, 76%);
	top: -172px;
	right: 0;
	border-radius: 35px;
}

.screen__background__shape3 {
	height: 540px;
	width: 190px;
	background: linear-gradient(270deg, #3eb893, rgb(69, 174, 192));
	top: -24px;
	right: 0;
	border-radius: 52px;
}

.screen__background__shape4 {
	height: 400px;
	width: 200px;
	background: #66b4e0;
	top: 420px;
	right: 50px;
	border-radius: 650px;
}

.join {
	width: 800px;
	padding: 30px;
	padding-top: 50px;
	padding-left: 100px;
}

.join__field {
	padding: 20px 0px;
	position: relative;
}

.join__icon {
	position: absolute;
	top: 30px;
	color: #f2ffb6;
}

.join__input {
	border: none;
	border-bottom: 2px solid #D1D1D4;
	background: none;
	padding: 10px;
	padding-left: 24px;
	font-weight: 700;
	width: 50% !important;
	transition: .2s;
}

.join__input:active, .join__input:focus, .join__input:hover {
	outline: none;
	border-bottom-color: #6A679E;
}

.join__submit {
	background: #fff;
	font-size: 14px;
	margin-top: 30px;
	padding: 16px 20px;
	border-radius: 26px;
	border: 1px solid #D4D3E8;
	text-transform: uppercase;
	font-weight: 700;
	display: flex;
	align-items: center;
	width: 100%;
	color: #26292be3;
	box-shadow: 0px 2px 2px #3e1b5a;
	cursor: pointer;
	transition: .2s;
}

.join__submit:active, .join__submit:focus, .join__submit:hover {
	border-color: #c9bb6e;
	outline: none;
}

.button__icon {
	font-size: 24px;
	margin-left: auto;
	color: #9affc1;
}

.social-join {
	position: absolute;
	height: 140px;
	width: 160px;
	text-align: center;
	bottom: 0px;
	right: 0px;
	color: #fff;
}

.social-icons {
	display: flex;
	align-items: center;
	justify-content: center;
}

.social-join__icon {
	padding: 10px 10px;
	color: #fff;
	text-decoration: none;
	text-shadow: 0px 0px 8px #4d739e;
}

.social-join__icon:hover {
	transform: scale(1.5);
}

p {
	font-size: 12px;
}

.m0>div {
	margin: 0;
}

.font>p {
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
}

.noline>h2>a {
	text-decoration: none;
}

.noline>h2 {
	margin-bottom: 100px;
}

.mem_img>div {
	padding: 0;
}

.mem_img>div>p {
	text-align: center;
	margin-top: 35px;
	font-size: 20px;
}

.border {
	border-radius: 10px;
}

p>button {
	margin: 0 auto;
}

.center>div>div>div>div>p {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

</style>
</head>
<body>
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	<!-- 배너(헤더) -->

	<!-- 내용 -->
	<section>
		<div class="screen_container">
			<div class="screen">
				<div class="container w-100 h-100 d-flex"
					style="padding: 0;">
					<div class="col-3 h-100 border border-dark m0 center">
						<div id="myPage.jsp" class="btn w-100 h-25 row border border-dark" onclick="location.href = 'myPage';">
							<div class=" h-100 mt-5 ">
								<div class="noline m-auto h-50 w-50">
									<img class="h-100 w-100" alt=""
										src="https://cdn.icon-icons.com/icons2/2406/PNG/512/user_account_icon_145918.png">
									<div class="w-100">
										<p>account</p>
									</div>
								</div>
							</div>
						</div>
						<div class="h-75 row">
							<div class="btn w-100 h-25 border border-dark" onclick="location.href = 'myGamePage';">
								<div class="noline mt-5 m-auto h-50 w-50">
									<img class="h-100 w-100" alt=""
										src="https://cdn.icon-icons.com/icons2/1369/PNG/512/-library-books_90035.png">
									<div class="w-100">
										<p>library</p>
									</div>
								</div>
							</div>
							<div class="btn w-100 h-25 border border-dark" onclick="location.href = 'myPaymentPage';">
								<div class="noline mt-5 m-auto h-50 w-50">
									<img class="h-100 w-100" alt=""
										src="https://cdn-icons-png.flaticon.com/512/1421/1421340.png">
									<div class="w-100">
										<p>payment/refund</p>
									</div>
								</div>
							</div>
							<div class="btn w-100 h-25 border border-dark" onclick="location.href = 'myCouponPage';">
								<div class="noline mt-5 m-auto h-50 w-50">
									<img class="h-100 w-100" alt=""
										src="https://cdn-icons-png.flaticon.com/512/287/287585.png">
									<div class="w-100">
										<p>coupons</p>
									</div>
								</div>
							</div>
							<div class="btn w-100 h-25 border border-dark" onclick="location.href = 'myReviewPage';">
								<div class="noline mt-5 m-auto h-50 w-50">
									<img class="h-100 w-100" alt=""
										src="https://cdn-icons-png.flaticon.com/512/4897/4897932.png">
									<div class="w-100">
										<p>reviews</p>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="col-9 h-100 m0">
						<div class="row mem_img border border-dark w-100 h-25 d-flex">
							<div class="h-100 col-4 border border-dark">
								<img class="w-75 h-75 m-4" style="text-align: center;" alt=""
									src="https://cdn-icons-png.flaticon.com/512/5448/5448082.png">
							</div>
							<div class="font h-100 col-8 border border-dark">
								<p>닉네임</p>
								<p>
									포인트 : <span>0p</span>
								</p>
								<p>
									등급 : <span>???</span>
								</p>
							</div>
						</div>
						<div class="font row mem_img border border-dark w-100 h-75">

							<div class="font col-4 w-25 border border-dark ">
								<p>비밀번호 :</p>
							</div>
							<div class="font w-75 col-8 border border-dark">
								<input class="h-100 w-100" type="text" disabled="disabled"
									value="비밀번호">
							</div>
							<div class="font col-4 w-25 border border-dark">
								<p>이메일 :</p>
							</div>
							<div class="font w-75 col-8 border border-dark">
								<input class="h-100 w-100" type="text" disabled="disabled"
									value="이메일">
							</div>
							<div class="font col-4 w-25 border border-dark">
								<p>가입일자 :</p>
							</div>
							<div class="font w-75 col-8 border border-dark">
								<input class="h-100 w-100" type="text" disabled="disabled"
									value="가입일자">
							</div>
							<div class="font col-4 w-25 border border-dark">
								<p>이름 :</p>
							</div>
							<div class="font w-75 col-8 border border-dark">
								<input class="h-100 w-100" type="text" disabled="disabled"
									value="이름">
							</div>
							<div class="font col-4 w-25 border border-dark">
								<p>닉네임 :</p>
							</div>
							<div class="font w-75 col-8 border border-dark">
								<input class="h-100 w-100" type="text" disabled="disabled"
									value="닉네임">
							</div>
							<div class="font col-4 w-25 border border-dark">
								<p>포인트 :</p>
							</div>
							<div class="font w-75 col-8 border border-dark d-flex">
								<input class="h-100 w-75" type="text" disabled="disabled"
									value="포인트">
								<button class="h-100 w-25">충전하기</button>
							</div>
							<p>
								<button>회원탈되</button>
							</p>
							<button>정보수정</button>
						</div>
					</div>
				</div>
				<div class="screen__background">
					<span class="screen__background__shape screen__background__shape4"></span>
					<span class="screen__background__shape screen__background__shape3"></span>
					<span class="screen__background__shape screen__background__shape2"></span>
					<span class="screen__background__shape screen__background__shape1"></span>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/users/js/scripts.js"></script>
	<!-- icons -->
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</body>

<script type="text/javascript">
    
    </script>
</html>

