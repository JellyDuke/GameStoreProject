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
        <style type="text/css">
        body, h2, form {
		    margin: 0;
		    padding: 0;
		}
		
		/* Style the container */
		.form {
		    width: 300px;
		    margin: 0 auto;
		    padding: 20px;
		    text-align: center;
		    background-color: #f4f4f4;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}
		
		/* Style the form elements */
		.form-group {
		    margin-bottom: 10px;
		    text-align: left;
		}
		
		label {
		    display: block;
		    font-weight: bold;
		}
		
		input[type="text"],
		input[type="password"] {
		    width: 100%;
		    padding: 5px;
		    border: 1px solid #ccc;
		    border-radius: 3px;
		}
		
		/* Style the submit button */
		button[type="submit"] {
		    background-color: #007bff;
		    color: #fff;
		    border: none;
		    border-radius: 3px;
		    padding: 10px 20px;
		    cursor: pointer;
		}
		
		button[type="submit"]:hover {
		    background-color: #0056b3;
		}
        </style>
    </head>
    <body>
       <!-- 메뉴 -->
       <%@ include file="/WEB-INF/views/include/menu.jsp" %>
       <!-- 배너(헤더) -->
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
        
       <!-- contents start -->
       <div class="form">
        <h2>회원가입</h2>
        <form action="signup.php" method="POST">
            <div class="form-group">
                <label for="username">아이디:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임:</label>
                <input type="text" id="nickname" name="nickname" required>
            </div>
            <button type="submit">가입</button>
        </form>
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

