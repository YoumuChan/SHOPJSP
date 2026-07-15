<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    java.util.Date day = new java.util.Date();
    String am_pm;
    int hour = day.getHours();
    int minute = day.getMinutes();
    int second = day.getSeconds();

    // AM/PM 계산 로직
    if(hour / 12 == 0) {
        am_pm = "AM";
        if(hour == 0) hour = 12;
    } else {
        am_pm = "PM";
        if(hour > 12) hour = hour - 12;
    }
    
    // ⭐ 1:9:22 -> 1:09:22 처럼 한 자리수일 때 앞에 0 붙여주기
    String minStr = (minute < 10) ? "0" + minute : String.valueOf(minute);
    String secStr = (second < 10) ? "0" + second : String.valueOf(second);
    
    String CT = am_pm + " " + hour + ":" + minStr + ":" + secStr;
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <title>Coffo - 커피 숍</title>
   
   <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="css/style.css">
   <link rel="stylesheet" href="css/responsive.css">
   <link rel="icon" href="images/fevicon.png" type="image/gif" />
   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   
   <style>
      .login_bt ul { 
         display: flex !important; 
         align-items: center !important; 
      }
      .login_bt ul li.dropdown { 
         list-style: none; 
      }
      .login_bt ul li.dropdown a[data-toggle="dropdown"]::after { 
         display: none; 
      }
      .dropdown-menu { 
         min-width: 8rem; 
         margin-top: 15px; 
      }
      .dropdown-menu .dropdown-item {
         color: #333333 !important; 
      }
      .dropdown-menu .dropdown-item:hover {
         color: #ff0000 !important; 
         background-color: #f8f9fa; 
      }
      
      .navbar-nav .nav-link {
         white-space: nowrap !important;
      }
   </style>
</head>
<body>
   <div class="header_section">
      <div class="container">
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="main.jsp"><img src="images/logo.png"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item active"><a class="nav-link" href="main.jsp">홈</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">소개</a></li>
                  
                  <li class="nav-item"><a class="nav-link" href="InProduct.jsp">상품 등록</a></li>
                  
                  <li class="nav-item"><a class="nav-link" href="Products.jsp">상점</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">블로그</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">연락처</a></li>
                  
                  <li class="nav-item">
                     <a class="nav-link" style="color: #ff0000; font-weight: bold; cursor: default;">
                        현재 접속 시간 : <%= CT %>
                     </a>
                  </li>
               </ul>
               <form class="form-inline my-2 my-lg-0">
                  <div class="login_bt">
                     <ul>
                        <li class="dropdown">
                           <a href="#" id="loginDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="user_icon"><i class="fa fa-user" aria-hidden="true"></i></span>로그인
                        </a>
                           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="loginDropdown">
                              <a class="dropdown-item" href="login.jsp">로그인</a>
                              <a class="dropdown-item" href="register.jsp">회원가입</a>
                              <div class="dropdown-divider"></div>
                              <a class="dropdown-item" href="mypage.jsp">마이페이지</a>
                           </div>
                        </li>
                        <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                     </ul>
                  </div>
               </form>
            </div>
         </nav>
      </div>
   </div>

   <div class="breadcrumb_section" style="background-color: #f4f4f4; padding: 20px 0; margin-bottom: 30px; border-bottom: 1px solid #e1e1e1;">
       <div class="container">
           <p style="margin: 0; color: #666; font-size: 14px;">
               <a href="main.jsp" style="color: #666; text-decoration: none;">Home</a>
               
               <%-- currentPage가 있을 때만 ' > 페이지명' 출력 --%>
               <% if(request.getAttribute("currentPage") != null) { %>
                   &nbsp;>&nbsp; 
                   <strong style="color: #ff0000;"><%= request.getAttribute("currentPage") %></strong>
               <% } %>
           </p>
       </div>
   </div>

   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>