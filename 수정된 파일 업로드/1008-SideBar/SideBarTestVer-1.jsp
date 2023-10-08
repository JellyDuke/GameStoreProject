<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <style>
    *{
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body{
      background-color: rgba(96, 20, 20, 0.185);
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
      position: relative;
      height: 100vh;
    }
    .sidebar ul li{
      list-style: none;
    }
    .sidebar ul li:hover{
      background-color: antiquewhite;
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
      font-size: 1.5em;
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
    .sidebar ul li .logo{
      margin-bottom: 50px;
    }
    .sidebar ul li .logo:hover{
      background: wheat;
    }
    .sidebar ul li.logo .icon{
      font-size: 2em;
    }
    .sidebar ul li.logo .text{
      font-size: 1.2em;
      font-weight: 500;
    }
    .bottom{
      position: absolute;
      bottom: 0;
      width: 100%;
    }
  </style>
<body>
  <div class="sidebar">
    <ul>
      <li class="logo">
        <a href="#">
          <span class="icon">
            <div class="imgBx">
              <img src="" alt="">
            </div>
          </span>
          <span class="text">회원명</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"></span>
          <span class="text">0 캐시</span>
        </a>
      </li>
      <hr>
      <li>
        <a href="#">
          <span class="icon"></span>
          <span class="text">회원 정보</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"></span>
          <span class="text">게임 정보</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"></span>
          <span class="text">쿠폰함</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"></span>
          <span class="text">결제 내역</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"></span>
          <span class="text">문의사항</span>
        </a>
      </li>
      <div class="bottom">
        <li>
          <a href="#">
            <span class="icon"></span>
            <span class="text">회원탈퇴</span>
          </a>
        </li>
      </div>
    </ul>
  </div>
</body>
</html>