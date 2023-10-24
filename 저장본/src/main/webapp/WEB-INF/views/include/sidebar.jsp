<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	    body{
	      min-height: 100vh;
	    }
	    .sidebar{
	      position: absolute;
	      width: 60px;
	      height: 100vh;
	      background-color: rgb(255, 255, 255);
	      overflow: hidden;
	      transition: 0.5s;
	    }
	    .sidebar:hover{
	      width: 300px;
	    }
	    .sidebar ul{
	      margin: 0;
	      padding: 0;
	      box-sizing: border-box;
	      position: relative;
	      height: 100vh;
	    }
	    .sidebar ul li{
	      margin: 0;
	      padding: 0;
	      list-style: none;
	    }
	    .sidebar ul li:hover{
	      background: rgba(250, 224, 215, 0.74);
	    }
	    .sidebar ul li a{
	      position: relative;
	      display: flex;
	      white-space: nowrap;
	      text-decoration: none;
	    }
	    .sidebar ul li a .icon{
	      position: relative;
	      display: flex;
	      justify-content: center;
	      align-items: center;
	      min-width: 60px;
	      height: 60px;
	      font-size: 2em;
	      color: rgb(44, 43, 43);
	    }
	    .sidebar ul li a .text{
	      position: relative;
	      height: 60px;
	      display: flex;
	      align-items: center;
	      font-size: 1em;
	      color: rgb(37, 35, 35);
	      text-transform: uppercase;
	      letter-spacing: 0.05em;
	    }
	    .bottom{
	      position: absolute;
	      bottom: 0;
	      width: 100%;
	    }
	  </style>
<div class="sidebar">
    <ul>
      <li style="margin-bottom: 50px;">
        <a href="#">
          <span class="icon">
          	<div class="imgBx">
          		<img src="img.jpg">
          	</div>
          </span>
          <span class="text">회원명</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon">C</span>
          <span class="text">0 캐시</span>
        </a>
      </li>
      <hr>
      <li>
        <a href="${pageContext.request.contextPath }/mypage">
          <span class="icon"><ion-icon name="person-circle-outline"></ion-icon></span>
          <span class="text">내 정보</span>
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath }/mygamepage">
          <span class="icon"><ion-icon name="game-controller-outline"></ion-icon></span>
          <span class="text">내 게임</span>
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath }/myreviewpage">
          <span class="icon"><ion-icon name="chatbubble-ellipses-outline"></ion-icon></span>
          <span class="text">내 리뷰</span>
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath }/myWishlist">
          <span class="icon"><ion-icon name="clipboard-outline"></ion-icon></span>
          <span class="text">찜 목록</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon">P</span>
          <span class="text">포인트</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"><ion-icon name="cube-outline"></ion-icon></span>
          <span class="text">쿠폰함</span>
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath }/paymentHistory">
          <span class="icon"><ion-icon name="journal-outline"></ion-icon></span>
          <span class="text">결제 내역</span>
        </a>
      </li>
      
      <li>
        <a href="${pageContext.request.contextPath }/inquiryHistory">
          <span class="icon"><ion-icon name="chatbubbles-outline"></ion-icon></span>
          <span class="text">내 문의 내역</span>
        </a>
      </li>
		<div class="bottom">
       		<li>
	          <a href="#">
	            <span class="icon"><ion-icon name="trash-outline"></ion-icon></span>
	            <span class="text">회원탈퇴</span>
	          </a>
        	</li>
		</div>
    </ul>
  </div>
  
  <!-- icons -->
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>