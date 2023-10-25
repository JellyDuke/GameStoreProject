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
        <title>GameStorePorject</title>

        <style>
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
		
		.container {
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  min-height: 100vh;
		}
		
		.screen {   
		  background: linear-gradient(90deg, #b8e2ff, #78a4b8);   
		  position: relative; 
		  height: 650px;
		  width: 360px; 
		  box-shadow: 0px 0px 24px #b5c5f1;
		}
		
		.screen__content {
		  z-index: 1;
		  position: relative; 
		  height: 100%;
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
		  background: linear-gradient(270deg, #12a182, rgb(69, 174, 192));
		  top: -24px;
		  right: 0; 
		  border-radius: 52px;
		}
		
		.screen__background__shape4 {
		  height: 400px;
		  width: 200px;
		  background: #3588b9;  
		  top: 420px;
		  right: 50px;  
		  border-radius: 650px;
		}
		
		.login {
		  width: 320px;
		  padding: 30px;
		  padding-top: 156px;
		}
		
		.login__field {
		  padding: 20px 0px;  
		  position: relative; 
		}
		
		.login__icon {
		  position: absolute;
		  top: 30px;
		  color: #f2ffb6;
		}
		
		.login__input {
		  border: none;
		  border-bottom: 2px solid #D1D1D4;
		  background: none;
		  padding: 10px;
		  padding-left: 24px;
		  font-weight: 700;
		  width: 75%;
		  transition: .2s;
		}
		
		.login__input:active,
		.login__input:focus,
		.login__input:hover {
		  outline: none;
		  border-bottom-color: #6A679E;
		}
		
		.login__submit {
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
		
		.login__submit:active,
		.login__submit:focus,
		.login__submit:hover {
		  border-color: #c9bb6e;
		  outline: none;
		}
		
		.button__icon {
		  font-size: 24px;
		  margin-left: auto;
		  color: #9affc1;
		}
		
		.social-login { 
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
		
		.social-login__icon {
		  padding: 10px 10px;
		  color: #fff;
		  text-decoration: none;  
		  text-shadow: 0px 0px 8px #4d739e;
		}
		
		.social-login__icon:hover {
		  transform: scale(1.5);  
		}
        </style>

    </head>
    <body>
        <!-- contents start -->
        <div class="container">
		  <div class="screen">
		    <div class="screen__content">
		      <form class="login" action="/changePw" method="post" onsubmit="return formCheck(this)">
		        <div class="login__field">
		          <i class="login__icon fas fa-user"></i>
		          <input type="password" name="currentPw" class="login__input" placeholder="현재 비밀번호">
		        </div>
		        <div class="login__field">
		          <i class="login__icon fas fa-lock"></i>
		          <input type="password" name="newPw" class="login__input" placeholder="새 비밀번호">
		        </div>
		         <div class="login__field">
		          <i class="login__icon fas fa-lock"></i>
		          <input type="password" name="newPwConfirm" class="login__input" placeholder="새 비밀번호 확인">
		        </div>
		        <button class="button login__submit">
		          <span class="button__text">비밀번호 변경</span>
		          <i class="button__icon fas fa-chevron-right"></i>
		        </button>       
		      </form>
		      	
		      <div class="social-login">
		        <div class="social-icons">
		      	  <a href="${pageContext.request.contextPath }/serviceCenter" class="social-login__icon"><ion-icon name="alert-circle-outline"></ion-icon></a>
		          <a href="${pageContext.request.contextPath }/" class="social-login__icon"><ion-icon name="home-outline"></ion-icon></a>
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
        <!-- contents end -->

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/users/js/scripts.js"></script>
       	<!-- icons -->
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <!-- kakao API -->
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js" integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
		<!-- naver api -->
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>		
  		
		<script type="text/javascript">
			let msg = '${msg}';
			if(msg.length > 0){
				alert(msg);
			}
		</script>
		
		<script type="text/javascript">
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		 function formCheck(formObj) {
			let mpw = formObj.currentPw;
			let newPw = formObj.newPw;
			let conFirmMpw = formObj.newPwConfirm;
			if(newPw.value != conFirmMpw.value){
				alert("현재 비밀번호가 틀립니다!");
				newPw.focus();
    	    	return false;
			}
			if(!pwdCheck.test(newPw.value)){
				 alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
				 newPw.focus();
	    	     return false;
			}
			if(newPw.value == mpw.value){
				 alert("현재 사용 비밀번호와 같을 수 없습니다.");
				 newPw.focus();
	    	     return false;
			}
		 }
		</script>
		
    </body>
</html>