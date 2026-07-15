<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      /* 로그인 및 검색 아이콘 원래 위치(가로 정렬) 강제 복구 */
      .login_bt ul { 
         display: flex !important; 
         align-items: center !important; 
      }
      .login_bt ul li.dropdown { 
         list-style: none; 
      }
      /* 부트스트랩 기본 드롭다운 화살표 숨기기 */
      .login_bt ul li.dropdown a[data-toggle="dropdown"]::after { 
         display: none; 
      }
      /* 드롭다운 메뉴 위치 미세조정 */
      .dropdown-menu { 
         min-width: 8rem; 
         margin-top: 15px; 
      }
      /* ⭐ 드롭다운 안쪽 글씨가 안 보이는 현상(흰색 바탕에 흰색 글씨) 수정 ⭐ */
      .dropdown-menu .dropdown-item {
         color: #333333 !important; /* 기본 글씨를 어두운 색으로 강제 지정 */
      }
      .dropdown-menu .dropdown-item:hover {
         color: #ff0000 !important; /* 마우스 올렸을 때 빨간색으로 변경 (선택사항) */
         background-color: #f8f9fa; /* 호버 시 옅은 회색 배경 */
      }
   </style>
</head>
<body>

   <div class="header_section">
      <div class="container">
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.jsp"><img src="images/logo.png"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                     <a class="nav-link" href="index.jsp">홈</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="about.jsp">소개</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="coffees.jsp">커피</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="shop.jsp">상점</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="blog.jsp">블로그</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="contact.jsp">연락처</a>
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
      
      <div class="banner_section layout_padding">
         <div class="container">
            <div id="banner_slider" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <div class="row">
                        <div class="col-md-12">
                           <div class="banner_taital_main">
                              <h1 class="banner_taital">커피 <br>숍</h1>
                              <p class="banner_text">바쁜 일상 속에서 완벽한 커피 한 잔의 여유를 즐겨보세요.</p>
                              <div class="btn_main">
                                 <div class="about_bt active"><a href="#">가게 소개</a></div>
                                 <div class="callnow_bt"><a href="#">전화하기</a></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div style="min-height: 400px; padding: 50px 0; text-align: center; background-color: #f8f9fa;">
       
       <%!
           String greeting ="Welcome to Zay Shoppingmaill";
           String tagline  ="쇼핑을 즐긴다, Zay Shopping";
       %>
       
       <h1><%=greeting %></h1>
       <h3><%=tagline %></h3>
       
   </div>
   <div class="footer_section layout_padding">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="footer_social_icon">
                  <ul>
                     <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                     <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                     <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                     <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                  </ul>
               </div>
               <div class="location_text">
                  <ul>
                     <li>
                        <a href="#">
                        <i class="fa fa-phone" aria-hidden="true"></i><span class="padding_left_10">010-1234-5678</span>
                        </a>
                     </li>
                     <li>
                        <a href="#">
                        <i class="fa fa-envelope" aria-hidden="true"></i><span class="padding_left_10">demo@gmail.com</span>
                        </a>
                     </li>
                  </ul>
               </div>
               <div class="form-group">
                  <textarea class="update_mail" placeholder="이메일 주소 입력" rows="5" id="comment" name="Your Email"></textarea>
                  <div class="subscribe_bt"><a href="#"><i class="fa fa-arrow-right" aria-hidden="true"></i></a></div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <div class="copyright_section">
      <div class="container">
         <div class="row">
            <div class="col-sm-12">
               <p class="copyright_text">2020 모든 권리 보유. 디자인: <a href="https://html.design">Free Html Templates</a> 배포: <a href="https://themewagon.com">ThemeWagon</a></p>
            </div>
         </div>
      </div>
   </div>
   <script src="js/jquery.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.bundle.min.js"></script>
   <script src="js/jquery-3.0.0.min.js"></script>
   <script src="js/plugin.js"></script>
   <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
   <script src="js/custom.js"></script>
</body>
</html>