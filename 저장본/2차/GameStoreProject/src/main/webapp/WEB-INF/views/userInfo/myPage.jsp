<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
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
       
        <!-- 고양이 아이콘 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <!-- myInfo css -->
        <link href="${pageContext.request.contextPath }/resources/users/css/myInfoStyle.css" rel="stylesheet" />
	</head>
<body>
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/include/menu.jsp" %>
	<!-- 배너 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 내용 -->
	
	<!-- 사이드바 -->
	<aside class="side-bar">
	  <section class="side-bar__icon-box">
	    <section class="side-bar__icon-1">
	      <div></div>
	      <div></div>
	      <div></div>
	    </section>
	  </section>
	  <ul>
	    <li>
	      <a href="#"><i class="fa-solid fa-cat"></i> menu1</a>
	      <ul>
	        <li><a href="#">text1</a></li>
	        <li><a href="#">text2</a></li>
	        <li><a href="#">text3</a></li>
	        <li><a href="#">text4</a></li>
	      </ul>
	    </li>
	    <li>
	      <a href="#">menu2</a>
	      <ul>
	        <li><a href="#">text1</a></li>
	        <li><a href="#">text2</a></li>
	        <li><a href="#">text3</a></li>
	        <li><a href="#">text4</a></li>
	      </ul>
	    </li>
	    <li>
	      <a href="#">menu3</a>
	      <ul>
	        <li><a href="#">text1</a></li>
	        <li><a href="#">text2</a></li>
	        <li><a href="#">text3</a></li>
	      </ul>
	    </li>
	    <li>
	      <a href="#">menu4</a>
	      <ul>
	        <li><a href="#">text1</a></li>
	        <li><a href="#">text2</a></li>
	      </ul>
	    </li>
	  </ul>
	</aside>
	<!-- 사이드 바 끝 -->
	
	<!-- 내 정보 -->
	
	
	
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
        
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/users/js/scripts.js"></script>
</body>
</html>