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
		  height: 900px;
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
		  width: 320px;
		  padding: 30px;
		  padding-top: 156px;
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
		  width: 75%;
		  transition: .2s;
		}
		
		.join__input:active,
		.join__input:focus,
		.join__input:hover {
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
		
		.join__submit:active,
		.join__submit:focus,
		.join__submit:hover {
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
		p{
		font-size: 12px;
		}
        </style>

    </head>
    <body>
        <!-- contents start -->
        <div class="container">
		  <div class="screen">
		    <div class="screen__content">
		      <form class="join">
		        <div class="join__field">
		          <i class="join__icon fas fa-user"></i>
		          <input type="text" id="inputId" name="mid" onkeyup="idCheck(this)" class="join__input" placeholder="이메일">
		        </div>
		        <p id="idMsg">중복확인 해주세요!</p>
		        <div class="join__field">
		          <i class="join__icon fas fa-lock"></i>
		          <input type="text" name="mcheck" class="join__input" placeholder="이메일 인증 번호"> <button>인증</button>
		        </div>
		        <div class="join__field">
		          <i class="join__icon fas fa-lock"></i>
		          <input type="password" name="mpw" class="join__input" placeholder="비밀번호">
		        </div>
		        <div class="join__field">
		          <i class="join__icon fas fa-lock"></i>
		          <input type="password" name="rempw" class="join__input" placeholder="비밀번호 재입력">
		        </div>
		        <div class="join__field">
		          <i class="join__icon fas fa-lock"></i>
		          <input type="text" name="mname" class="join__input" placeholder="이름">
		        </div>
		        <div class="join__field">
		          <i class="join__icon fas fa-lock"></i>
		          <input type="text" name="nickname" class="join__input" placeholder="닉네임">
		        </div>
		        <button class="button join__submit">
		          <span class="button__text">회원가입</span>
		          <i class="button__icon fas fa-chevron-right"></i>
		        </button>       
		      </form>
		      	  
		      <div class="social-join">
		        <div class="social-icons">
		      	  <a href="${pageContext.request.contextPath }/loginpage" class="social-join__icon"><ion-icon name="lock-open-outline"></ion-icon></a>
		          <a href="#" class="social-join__icon"><img style="width: 18px; height: 18px;" src="resources/images/kakao.jpg"></a>
		          <a href="#" class="social-join__icon"><img style="width: 18px; height: 18px;" src="resources/images/naver.jpg"></a>
		          <a href="${pageContext.request.contextPath }/" class="social-join__icon"><ion-icon name="home-outline"></ion-icon></a>
		          
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
        
        <script type="text/javascript">
		let idChecked = false; // 아이디 중복확인 
    	
    	function idCheck(inputId){
			// 중복 확인할 아이디 VALUE 확인
			let idEl = document.querySelector('#inputId');
			console.log(idEl.value);
			
			// ajax - 아이디 중복 확인요청(memberIdCheck)
			$.ajax( { type: "get", // 전송 방식
					  url: "memberIdCheck", // 전송 URL
					  data: { "inputId" : idEl.value }, // 전송 파라메터
					  success: function(re){ // 전송에 성공했을 경우
						  // re : 응답받은 데이터
						  console.log("확인결과 : " + re);
		                    if(re == "Y"){
		                    	/* 사용 가능한 아이디입니다. 출력 */
		                    	let msgEl = document.getElementById('idMsg');
		                    	msgEl.innerText = '사용 가능한 아이디입니다.';
		                    	idChecked = true;
		                    }
		                    
		                    else{
		                    	/* 중복된 아이디입니다. 출력 */
		                    	let msgEl = document.getElementById('idMsg');
		                    	msgEl.innerText = '이미 가입된 아이디입니다.';
		                    	idChecked = false;
		                    }
		                }
				 });
		}
        </script>
        
        <script type="text/javascript">
        function formCheck(formObj) {
        	console.log("formCheck()호출");
        	let idEl = formObj.mid; //아이디
        	let mcEl = formObj.mcheck; //이메일
    	    let pwEl = formObj.mpw; //비밀번호
    	    let repwEl = formObj.rempw; //비번 재입력
    	    let nmEl = formObj.mname; //이름 
    	    let niEl = formObj.nickname; //닉네임
    	    
    	    //아이디가 입력되지 않았으면 false;
    	    if(idEl.value.length == 0){
    	        alert("아이디를 입력해주세요!");
    	        idEl.focus();
    	        return false;
    	    }
    	    //아이디 길이 체크 false;
    	    if(idEl.value.length > 51){
    	    	alret("이메일 50글자 이내로 입력해주세요!");
    	    	idEl.focus();
    	    	return false;
    	    }
    	    //인증 메일 체크
    	    if(mcEl.value.length > 13 && mcEl.value.length == 0){
    	    	alret("인증 메일을 확인 해 주세요!");
    	    	mcEl.focus();
    	    	return false;
    	    }
    	    //
    	    if(pwEl.value.length > 101){
    	    	alret("비밀번호를 100글자 이내로 입력해주세요!");
    	    	pwEl.focus();
    	    	return false;
    	    }
    	    if(pwEl.value.length < 7){
    	    	alret("비밀번호를 7자으로 만들어주세요!");
    	    	pwEl.focus();
    	    	return false;
    	    }
    	    if(pwEl.value.length == 0){
    	    	alret("비밀번호를 입력하세요!");
    	    	pwEl.focus();
    	    	return false;
    	    }
    	    if(repwEl.value == pwEl.value){
    	    	alret("비밀번호가 틀립니다.");
    	    	repwEl.focus();
    	    	return false;
    	    }
    	    if(nmEl.value.length > 6){
    	    	alret("이름 5글자 이내로 입력해주세요!");
    	    	idEl.focus();
    	    	return false;
    	    }
    	    if(idEl.value.length > 51){
    	    	alret("이메일 50글자 이내로 입력해주세요!");
    	    	idEl.focus();
    	    	return false;
    	    }
        }
        </script>
        <script type="text/javascript">
		let msg = '${msg}';
		if(msg.length > 0){
			alert(msg);
		}
		</script>
    </body>
</html>
