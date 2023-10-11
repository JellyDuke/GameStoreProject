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
	</head>
<body>
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/include/menu.jsp" %>
	
	<!-- 사이드바 -->
  	<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
  	
	<!-- 내용 -->
	
	<!-- 헤더 -->
	<header class="content_header" style="padding-left: 300px;">
		<h1 class="content_title">내 정보</h1>
	</header>
	
	<!-- 내 정보 -->
	<div class= "content_body" style="padding-left: 350px;">
		<h2 class="content_title">회원 정보</h2>
		<div class="tab_info">
			<hr>
			<nav class="tab_nav">
				<ul class="tab_nav_items">
					<li class="tab_nav_items_item is-active">
						<a href="#" class="tab_nav_items_item_link">회원 정보</a>
					</li>
				</ul>
			</nav>
			<div class="tab_content">
				<div class="form_pane is-active">
					<div class="form-section">
						<h3 class="form-section_title">회원정보 설정</h3>
						<table class="table_base">
							<colgroup> 
								<col style="width: 176px;">
								<col style="width: *;">
							</colgroup>
							<tbody>
								<tr>
									<th class="table_th">내용</th>
									<td class="table_td">내용</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<th class="table_th">내용</th>
									<td class="table_td">내용</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<th class="table_th">내용</th>
									<td class="table_td">내용</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<th class="table_th">내용</th>
									<td class="table_td">내용</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
        
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/users/js/scripts.js"></script>
</body>
</html>