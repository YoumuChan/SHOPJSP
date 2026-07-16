<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 🚀 JSTL fmt 태그 라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 🚀 리소스 번들 연결 (사전 파일) -->
<fmt:setBundle basename="resource" />

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
      .login_bt ul li {
         display: inline-block !important;
      }
      .login_bt ul li.dropdown { 
         list-style: none;
         position: relative !important;
      }
      .login_bt ul li.dropdown a { 
         cursor: pointer !important;
         display: flex !important;
         align-items: center !important;
         color: #ffffff !important;
         text-decoration: none !important;
      }
      .login_bt .user_icon {
         margin-right: 8px !important;
      }
      
      /* 커스텀 드롭다운 */
      .dropdown-menu-custom { 
         display: none;
         position: absolute !important;
         top: 100% !important;
         right: 0 !important;
         min-width: 130px !important;
         background-color: #ffffff !important;
         border: 1px solid #e1e1e1 !important;
         border-radius: 4px !important;
         padding: 5px 0 !important;
         margin-top: 10px !important;
         box-shadow: 0 4px 12px rgba(0,0,0,0.1) !important;
         z-index: 99999 !important;
      }
      .dropdown-menu-custom.show {
         display: block !important;
      }
      .dropdown-menu-custom .dropdown-item {
         color: #333333 !important;
         display: block !important;
         width: 100% !important;
         padding: 8px 15px !important;
         font-size: 14px !important;
         text-align: left !important;
         text-decoration: none !important;
         background: none !important;
         border: none !important;
      }
      .dropdown-menu-custom .dropdown-item:hover {
         color: #ff0000 !important;
         background-color: #f8f9fa !important; 
      }
      .dropdown-divider-custom {
         height: 1px;
         margin: 5px 0;
         overflow: hidden;
         background-color: #e9ecef;
      }
      
      .navbar-nav .nav-link {
         white-space: nowrap !important;
      }

      /* 접속 시간 텍스트 스타일 */
      .time-link-custom {
         color: #ff0000 !important;
         background-color: transparent !important;
         background: none !important;
         border: none !important;
         box-shadow: none !important;
         font-weight: 600 !important;    
         font-size: 15px !important;
         cursor: default !important;
         pointer-events: none !important; 
         display: inline-block !important;
         white-space: nowrap !important;
         padding: 0.5rem 1rem !important;
         margin: 0 !important;
      }

      /* 다국어 선택 토글 버튼 스타일 */
      .lang-toggle-link {
         color: #ffffff !important;
         font-weight: bold !important;
         text-decoration: none !important;
         font-size: 14px !important;
         padding: 5px 12px !important;
         border: 1px solid rgba(255, 255, 255, 0.4) !important;
         border-radius: 20px !important;
         transition: all 0.2s ease-in-out !important;
         background-color: rgba(255, 255, 255, 0.1) !important;
         white-space: nowrap !important;
      }
      .lang-toggle-link:hover {
         background-color: #ff0000 !important;
         border-color: #ff0000 !important;
         color: #ffffff !important;
         text-decoration: none !important;
      }
   </style>
   
   <script type="text/javascript">
       // JS 접속 시간 타이틀을 다국어 Properties와 연동하기 위해 변수에 바인딩
       var clockPrefixText = "<fmt:message key='clock_prefix' />";

       function startLiveClock() {
           function updateClock() {
               var now = new Date();
               var hours = now.getHours();
               var minutes = now.getMinutes();
               var seconds = now.getSeconds();
               var ampm = hours >= 12 ? 'PM' : 'AM';
               
               hours = hours % 12;
               hours = hours ? hours : 12;
               var minStr = minutes < 10 ? '0' + minutes : minutes;
               var secStr = seconds < 10 ? '0' + seconds : seconds;
               
               var timeString = ampm + ' ' + hours + ':' + minStr + ':' + secStr;
               var clockEl = document.getElementById("liveClock");
               if (clockEl) {
                   clockEl.innerHTML = clockPrefixText + timeString;
               }
           }
           updateClock();
           setInterval(updateClock, 1000); 
       }

       function toggleLoginDropdown(event) {
           event.preventDefault();
           event.stopPropagation();
           var menu = document.getElementById("customLoginMenu");
           if (menu) {
               menu.classList.toggle("show");
           }
       }

       window.onclick = function(event) {
           var menu = document.getElementById("customLoginMenu");
           if (menu && menu.classList.contains("show")) {
               if (!event.target.matches('#loginDropdown') && 
                   !event.target.matches('.user_icon') && 
                   !event.target.matches('.fa-user')) {
                   menu.classList.remove("show");
               }
           }
       }
       
       window.addEventListener("DOMContentLoaded", startLiveClock);
   </script>
</head>
<body>
   <div class="header_section">
      <div class="container">
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
           
            <a class="navbar-brand" href="main.jsp"><img src="<%= request.getContextPath() %>/images/logo.png" alt="COFFO"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
 
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item active"><a class="nav-link" href="main.jsp"><fmt:message key="menu_home" /></a></li>
                  <li class="nav-item"><a class="nav-link" href="#"><fmt:message key="menu_about" /></a></li>
                  <li class="nav-item"><a class="nav-link" href="InProduct.jsp"><fmt:message key="menu_addProduct" /></a></li>
                  <li class="nav-item"><a class="nav-link" href="Products.jsp"><fmt:message key="menu_shop" /></a></li>
                  <li class="nav-item"><a class="nav-link" href="#"><fmt:message key="menu_blog" /></a></li>
                  <li class="nav-item"><a class="nav-link" href="#"><fmt:message key="menu_contact" /></a></li>
                  
                  <li class="nav-item" style="display: flex; align-items: center;">
                     <span class="time-link-custom" id="liveClock">
                        <fmt:message key="clock_prefix" /><fmt:message key="clock_calculating" />
                     </span>
                  </li>

                  <!-- 다국어 토글 연동 (KR/KO ↔ US/EN 토글) -->
                  <li class="nav-item" style="display: flex; align-items: center; margin-left: 10px;">
                     <% 
                         String curLang = (String) session.getAttribute("currentLang"); 
                         if ("en".equals(curLang)) { 
                     %>
                         <a href="setLocale.jsp?lang=ko" class="lang-toggle-link">🇰🇷 KO</a>
                     <% } else { %>
                         <a href="setLocale.jsp?lang=en" class="lang-toggle-link">🇺🇸 EN</a>
                     <% } %>
                  </li>
               </ul>
               
               <form class="form-inline my-2 my-lg-0">
                  <div class="login_bt">
                     <ul>
                        <li class="dropdown">
                           <a href="#" id="loginDropdown" onclick="toggleLoginDropdown(event)">
                              <span class="user_icon"><i class="fa fa-user" aria-hidden="true"></i></span><fmt:message key="menu_login" />
                           </a>
     
                           <div class="dropdown-menu-custom" id="customLoginMenu">
                              <a class="dropdown-item" href="login.jsp"><fmt:message key="menu_login" /></a>
                              <a class="dropdown-item" href="register.jsp"><fmt:message key="menu_register" /></a>
                              <div class="dropdown-divider-custom"></div>
                              <a class="dropdown-item" href="mypage.jsp"><fmt:message key="menu_mypage" /></a>
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
               <% if(request.getAttribute("currentPage") != null) { %>
                   &nbsp;>&nbsp; 
                   <strong style="color: #ff0000;"><%= request.getAttribute("currentPage") %></strong>
               <% } %>
           </p>
       </div>
   </div>
</body>
</html>