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
        <title>GameStoreProject</title>
    </head>
    <style>
		.main_container{
    			width: 900px;
    			height: 940px;
    			margin:	0 auto;
    			margin-top: 60px;
    			margin-bottom: 60px;
    			background-color: white;
    			border-radius: 50px;
    		}
    		.comment_title{
    			width: 800px;
    			height: 100px;
    			margin: 0 auto;
    			padding: 28px 0 16px 10px;
    			font-weight: bold;
    			font-size: 20px;
    		}
    		.comment_tab{
    			width: 850px;
    			height: 50px;
    			margin: 0 auto;
    		}
    		.comment_tab>div{
    			height: 50px;
    			width: 170px;
    			font-size: 16px;	
    			padding: 14px 30px 14px 38px;
    		}
    		.select_div{
    			border-top: 5px solid bisque; 	
    		}
    		.comment_info{
    			width: 100%;
    			height: 100%;
    			margin: 0 auto;
    		}
    		.info_area{
    			width: 800px;
    			height: 720px;
    			margin: 0 auto;
    			max-height: 760px;
    			overflow: scroll;
    		}
    		.info_area::-webkit-scrollbar {
  				display: none;
    		}
    		.background{
	    		position: absolute;
	    		height: 1000px;
	    		width: 1000px;
	    		margin: 0 auto;
	    		margin-top: 90px;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				z-index: -3;
				-webkit-clip-path: inset(0 0 0 0);
				clip-path: inset(0 0 0 0);  
				background: linear-gradient(to top, #3e5151, #decba4);
				border-radius: 20px;
    		}
    		section{
    			min-height: 1000px;
    		}
    		.a_tag{
    			text-decoration: none;
    		}
    		
    		.formInput{
            display: flex;
            align-items: center;
            margin-bottom: 0px;
            /* border: 1px solid black; */
            border-radius: 7px;
            padding: 7px;
            flex-wrap: wrap;
       		}
       		
       		.formInput>input[type='text']{
            box-sizing: border-box;
            width: 100%;
            padding: 3px;
            font-size: 15px;
        	}
        	
        	.formInput>input[type='button']{
            width: 100%;
            padding: 3px;
            border-radius: 10px;
            background-color: cornsilk;
            cursor: pointer;
            margin-bottom: 3px;
      		}
      		
    		 .formSubmit{
            border: none;
            margin-top: 5px;
      		}
      		
        	.formSubmit>input{
            background-color: mistyrose;
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
        	}
        	.icontent{
        	height: 300px;
        	border: solid 1px black;
        	}
        	div.replyArea{
			border: 3px solid black;
			border-radius: 10px;
			width: 500px;
			margin: 0 auto;
			padding:15px;
		}
		
		.inquiryWrite textarea{
			border-radius: 7px;
			width: 93%;
			min-height: 70px;
			font-family: auto;
			resize: none;
			padding: 8px;
		}
		.inquiryWrite button{
			width: 98%;
			margin-top: 5px;
			cursor: pointer;
			padding: 5px;
		}
   		.answer{
   			display : flex;
   			
   		}
   		.answer>p{
   			padding: 0;
   			margin: 5px;
   		}
   		.acomm{
   			margin-top: 5px;
   			border-radius: 7px;
			width: 93%;
			min-height: 70px;
			font-family: auto;
			resize: none;
			padding: 8px;
   		}
	</style>
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
       	
       	<section class="">
            <div class="main_container">
            	<div class="mt-3 comment_title">
					고객지원          	
            	</div>
            	<div class="mt-3 info_area ">
	            	<div class="comment_tab d-flex">
						<div class="select_div">문의 사항</div>	
	            	</div>
	            	<div class="mt-3 comment_info">
							
		            	<div class="formInput">
		            		<input type="text" class="ititle" name="ititle" value="문의 제목 : ${inquire.ititle }                         문의 등록 시간: ${inquire.idate }" disabled="disabled">
		            	</div>
		            	<div class="formInput">
		            		<input type="text" class="icontent" name="icontent" value="문의 내용: ${inquire.icontent }" disabled="disabled">
		            	</div>
		            <%-- 문의답변 시작 --%>
	                <hr>
	             	<div clas="inquiryArea">
	             		${ sessionScope.loginId} ${inquire.icode}
	             		<c:if test="${sessionScope.loginId != null }">
	             		
	             		<div class="inquiryWrite">
	             		<h3>문의 답변 - 로그인한 경우 출력</h3>
	             		<form onsubmit="return inquiryWrite(this)">
	             			<input type="hidden" name="acode" value="${inquire.icode}">
	             			<textarea  name="acomment" placeholder="문의 내용 작성"></textarea>
	             			<button type = "submit">문의 답변 등록</button>
	             		</form>
	             		</div>
	             		<hr>
	             		</c:if>
	             	</div>
	             	
	             	<div id = "inquiryList">
	             			
	             	</div>
	            	</div>
            	</div>
            	
	            <div class="background">
	            
	            </div>
            </div>
        </section>
       
   		<!-- Footer-->
        <%@ include file="/WEB-INF/views/include/footer.jsp"%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/users/js/scripts.js"></script>
   		<!-- Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    </body>
    <script type="text/javascript">
			let msg = '${msg}';
			if(msg.length > 0){
				alert(msg);
			}
	</script>
	<!-- 문의 답변 등록 -->	
	<script type="text/javascript">
		function inquiryWrite(formObj) {
			console.log("inquiryWrite 호출 " + formObj.acode.value);
			//$.ajax({ 문의 답변 요청 전송})
			$.ajax({
				type: "get",
				url : "inquiryAnswerWrite",
				data: {"icode": formObj.acode.value,
					   "acomment": formObj.acomment.value},
				success: function (result) {
					console.log(result);
					if(result == "1"){
						alert("문의 답변이 등록되었습니다.");
						//문의 답변 조회
						formObj.acomment.value = "";
						getAnswersList(icode);
					}else{
						alert("문의 답변 등록이 실패하였습니다.");
					}
				}
			});
			return false;
		}
		//문의 답변 목록 조회 및 출력
		function getAnswersList(acode){
			console.log("getAnswersList() 호출");
			console.log("문의 답변 조회 할 글번호 : " + icode);
			
			//>>ArrayList<Reply> >> JSON 변환 >> 페이지로
			$.ajax({
				type: "get",
				url: "answersList",
				data: {"icode" : icode},
				dataType: "json", 
				success : function(awList){
					printAnswersList(awList); //댓글 출력 기능 호출
					console.log(awList);
				}
			});
		}
	</script>
	<script type="text/javascript">
		let loginId = '${sessionScope.loginId}';
		
		//문의 출력 기능
		function printAnswersList(awList) {
			let awListDiv = document.querySelector("#inquiryList");
			awListDiv.innerHTML = "";
			
			for(let awInfo of awList){
				let aDiv = document.createElement('div');
				awListDiv.appendChild(aDiv);
				
				let answerDiv = document.createElement('div');
				answerDiv.classList.add('answer');
				aDiv.appendChild(answerDiv);
				
				let aWriter = document.createElement('p');
				aWriter.innerText = "작성자: "+awInfo.amid;
				answerDiv.appendChild(aWriter);
				
				let aDate = document.createElement('p');
				aDate.innerText = "작성일: "+awInfo.adate;
				answerDiv.appendChild(aDate);
				
				let acomment = document.createElement('textarea');
				aDiv.appendChild(acomment);
				acomment.innerText = awInfo.acomment;
				acomment.classList.add('acomm');
				acomment.setAttribute('disabled','disabled');
			
				console.log(aDiv); 	
			}
			
		}
	</script>
	
	<script type="text/javascript">
		let icode = '${inquire.icode}';
		$(document).ready(function() {
			getAnswersList(icode);
		});
	</script>
</html>
