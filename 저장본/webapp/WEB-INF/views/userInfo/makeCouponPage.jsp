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
        
        <!-- icon -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/users/assets/favicon.ico" />
        
        <!-- bootstrap icon-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
       
        <!-- bootstrap css-->
        <link href="${pageContext.request.contextPath }/resources/users/css/styles.css" rel="stylesheet" />
    	<style type="text/css">
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
    			max-width: 100%;
    		}
    		.comment_tab{
    			width: 515px;
    			height: 50px;
    			margin: 0 auto;
    		}
    		.comment_tab>div{
    			height: 50px;
    			width: 170px;
    			font-size: 14px;	
    			padding: 14px 39px 14px 39px;
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
    		.table_div{
    			overflow: scroll;
    			max-height: 500px;
    		}
    		.table_th{
    			height: 100px;
    			width: 225px;
    			border: 1px solid #e7e7e7;   	
    			font-size: 14px;
    			max-width: 225px;		
    		}
    		.table_bd{
    			height: 100px;
    			width: 100px;
    			border: 1px solid #e7e7e7;
    		}
    		.table_ft{
    			height: 100px;
    			width: 130px;
    		}
    		tr{
    			border-collapse: collapse;
    		}
    		tr>th{
    			padding: 7px;
    			font-weight: normal;
    		}
    		tr>td{
    			padding: 15px;
    			font-weight: normal; 		
    		}
    		tr>td>span{
    			font-size: 14px;		
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
    		.btn{
    			border: 1px solid black !important;
    		}    		
    		section{
    			min-height: 1000px;
    		}
    		.coupon_code{
    			margin-left: 10px;
    			margin-right: 10px;
    		}
    		thead>tr>td{
    			text-align: center;
    			max-height: 50px;
    		}
    		tbody>tr>td{
    			text-align: center;
    			max-height: 50px;
    		}
    		#typesearchs{
    			border: 1px solid black;
    			width: 185px;
    			overflow: hidden;
    			text-align: center;
    			white-space: nowrap;
    			height: 265px;
    		}
    		#typesearchs>a{
    			text-decoration: none;
    		}
    	</style>
    </head>
    <body>
        <!-- 메뉴 -->
         <%@ include file="/WEB-INF/views/include/menu.jsp" %>
          <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
        <!-- 배너(헤더) -->
        
        <!-- 내용 -->
        <section class="">
            <div class="main_container">
            	<div class="mt-3 comment_title">
					쿠폰 생성 사이트          	
            	</div>    
            	       	
            	<div class="mt-3 info_area ">
	            	
	            	<div class="mt-3 comment_info">	
	            		<div class="h-100 w-100 row">
	            			<form class="h-25" action="${pageContext.request.contextPath }/makecoupon" onsubmit="return inputcheck(this)">
		            			<input type="text" oninput="printType(this.value)" id="type" name="ctype" placeholder="title">	
	            				<select onchange="typechange(this)" id="typeCheck">	                     		
	                        		<option selected="selected" value="title">제목</option>
                        			<option value="tag">태그</option>                    		
                        		</select>
	            				<input type="text" id="percent" name="cpercent" placeholder="퍼센트">%
	            				<input type="text" id="stack" name="cstack" placeholder="수량">개
	            				<input type="submit" value="생성">	
		            			<div id="typesearchs">
		            				
		            			</div>
	            			</form>
	            			
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    </body>
    <script type="text/javascript">
    let typech = "title";
    let tag = "tag";
    let title = "title";
    let searchDiv = document.querySelector("#typesearchs");
    	function typechange(ty) {
    		document.getElementById("type").placeholder = ty.value;
    		typech = ty.value;   		
    		console.log(typech);  
    		searchDiv.innerHTML="";
    		document.getElementById("type").value = "";
    		if(typech == tag){
    			$.ajax({
	    			type : 'get',
	    			url : 'printtag',
	    			success : function(tagList){
	    				console.log(tagList);	    				
	    				searchDiv.innerHTML="";
	    				for(let i=0; i<tagList.length; i++){
	    					let typeA = document.createElement('a');
	    					typeA.innerText = tagList[i];
	    					typeA.setAttribute('id',tagList[i]);
	    					typeA.setAttribute('onclick','change(this)');
	    					let br = document.createElement('br');	    					
	    					searchDiv.appendChild(typeA);
	    					searchDiv.appendChild(br);
	    				}	
	    			}
    		})
    		}
		}		
    	function printType(text){
    		console.log(text.length);
    		if(text.length>0 && typech == title){
	    		$.ajax({
	    			type : 'get',
	    			url : 'printtype',
	    			data : {'text' : text,
	    				},
	    			success : function(typeList){
	    				console.log(typeList);
	    				let searchDiv = document.querySelector("#typesearchs");
	    				searchDiv.innerHTML="";
	    				for(let i=0; i<typeList.length; i++){
	    					let typeA = document.createElement('a');
	    					typeA.innerText = typeList[i];
	    					typeA.setAttribute('id',typeList[i]);
	    					typeA.setAttribute('onclick','change(this)');
	    					let br = document.createElement('br');	    					
	    					searchDiv.appendChild(typeA);
	    					searchDiv.appendChild(br);
	    				}
	    			}
	    		})
    			
    		} else{
    		}
    			
    	}
    	function change(type){
			console.log(type);
			console.log(type.value);
			document.getElementById("type").value = type.id;
		}
    	function inputcheck(formobj){
    		let typeEl = formobj.type;
    		let percEl = formobj.percent;
    		let stacEl = formobj.stack;
    		let uid = '<%=(String)session.getAttribute("loginId")%>';
    		if(uid == "null"){
    			alert("로그인해주세요");
    			location.replace("loginpage");
    			return false;
    		}
    		if(typeEl.value == "" && typech == "title"){
    	        alert("제목을 입력해주세요!");
    	        typeEl.focus();
    	        return false;
    	    }
    		if(typeEl.value == "" && typech == "tag"){
    	        alert("태그를 입력해주세요!");
    	        typeEl.focus();
    	        return false;
    	    }
    		if(percEl.value == ""){
    	        alert("할인율을 입력해주세요!");
    	        percEl.focus();
    	        return false;
    	    }
    		if(stacEl.value == ""){
    	        alert("수량을 입력해주세요!");
    	        stacEl.focus();
    	        return false;
    	    }
    	}
    </script>
</html>
