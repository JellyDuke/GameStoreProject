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
    			height: 660px;
    			margin: 0 auto;
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
	            		<form action="${pageContext.request.contextPath}/inquiryWrite" method="post" onsubmit="return formCheck(this)">
		            		
		            		<div class="formInput">
		            			<input type="text" class="ititle" name="ititle" placeholder="문의 글 제목">
		            		</div>
		            		
		            		<div class="formInput">
		            			<input type="text" class="icontent" name="icontent" placeholder="문의 글 내용">
		            		</div>
		            		
		            		<div class="formSubmit">
		            			<input type="submit" value="글등록">
		            		</div>
		            		
	            		</form>
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
    </body>
    <script type="text/javascript">
			let msg = '${msg}';
			if(msg.length > 0){
				alert(msg);
			}
	</script>
	<script type="text/javascript">
		function formCheck(formObj) {
			console.log("formCheck() 호출")
			let itEl = formObj.ititle; //문의 제목 태그
		    let icEl = formObj.icontent; //문의 내용 태그
		    
			//문의 제목이 입력되지 않았으면 false;
		    if(itEl.value.length == 0){
		        alert("문의 제목을 입력 해주세요!");
		        itEl.focus();
		        return false;
		    }
			//문의 내용이 10자 이상되지 않았으면 false;
		    if(icEl.value.length == 0){
		        alert("문의 내용을 입력 해주세요!");
		        icEl.focus();
		        return false;
		    }
		}
	</script>
</html>
