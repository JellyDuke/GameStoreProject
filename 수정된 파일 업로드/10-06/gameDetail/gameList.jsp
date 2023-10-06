<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>GameList</title>
        <!-- icon -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/users/assets/favicon.ico" />
        
        <!-- bootstrap icon-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
       
        <!-- bootstrap css-->
        <link href="${pageContext.request.contextPath }/resources/users/css/styles.css" rel="stylesheet" />
    	<style type="text/css">
    		.row{   		
    		height: 300px;
    		}
    		.row>div{
    		border: 1px solid black;
    		}
    	</style>
    </head>
    <body>
        <!-- 메뉴 -->
         <%@ include file="/WEB-INF/views/include/menu.jsp" %>
        <!-- 배너(헤더) -->
        <%@ include file="/WEB-INF/views/include/header.jsp"%>
        
        <!-- 내용 -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
					<div class="col-md-8">
						<div class="card h-100">
							<img class="card-img-top h-60" alt="" src="data:image/jpeg;base64,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">
							<div class="card-body h-20">사진,동영상 작게보기</div>
							<div class="card-footer h-10">스크롤</div>
						</div>
					</div>
					<div class="col-6 col-md-4">게임정보</div>
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
</html>

