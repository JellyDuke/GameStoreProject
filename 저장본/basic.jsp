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
            .content{
            border: 1px solid #F00;
            height: 400px;
            }
        </style>

    </head>
    <body>
        <!-- 메뉴 -->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
        <!-- 배너(헤더) -->
        <%@ include file="/WEB-INF/views/include/header.jsp"%>
        
        <!-- contents start -->
        <div class="contents">
            컨텐츠
        </div>
        <!-- contents end -->

        <!-- Footer-->
        <%@ include file="/WEB-INF/views/include/footer.jsp"%>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/users/js/scripts.js"></script>
        
    </body>
</html>

