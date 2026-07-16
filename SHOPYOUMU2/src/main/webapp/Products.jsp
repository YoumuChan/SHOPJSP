<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRapository" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Coffo - 상점</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
    <link rel="stylesheet" type="text/css" href="css/style.css"> 
    <link rel="stylesheet" href="css/responsive.css"> 
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"> 
    <style>
    /* 전체 폭을 깔끔하게 묶어서 화면 쩍벌 방지 */
    .shop_layout_container {
        max-width: 1140px !important;
        margin: 0 auto !important;
        padding: 0 15px !important;
    }

    /* 슬라이더 영역의 좌우 화살표 버튼 공간 확보 */
    .slider_wrapper {
        position: relative !important;
        padding: 0 45px !important;
        margin-bottom: 20px;
    }

    /* Owl Carousel 화살표 정중앙 세로 고정 및 클릭 가능하게 설정 */
    .slider_wrapper .owl-nav {
        display: block !important;
        position: absolute !important;
        width: 100% !important;
        top: 50% !important;
        left: 0 !important;
        transform: translateY(-50%) !important;
        z-index: 9999 !important;
        pointer-events: none;
    }
    .slider_wrapper .owl-nav .owl-prev,
    .slider_wrapper .owl-nav .owl-next {
        width: 40px !important;
        height: 40px !important;
        font-size: 16px !important;
        color: #ffffff !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        position: absolute !important;
        pointer-events: auto;
        cursor: pointer !important;
        margin: 0 !important;
        padding: 0 !important;
        transition: background-color 0.2s ease-in-out !important;
    }
    .slider_wrapper .owl-nav .owl-prev { left: 0px !important; background-color: #ff0000 !important; } 
    .slider_wrapper .owl-nav .owl-next { right: 0px !important; background-color: #424242 !important; } 
    .slider_wrapper .owl-nav .owl-prev:hover, .slider_wrapper .owl-nav .owl-next:hover { background-color: #111111 !important; } 

    /* 상품 카드 디자인 규격 통일 */
    .product_card_custom {
        border: 1px solid #e9ecef !important;
        border-radius: 6px !important;
        background: #ffffff !important;
        overflow: hidden !important;
        box-shadow: 0 2px 8px rgba(0,0,0,0.04) !important;
        transition: transform 0.2s ease, box-shadow 0.2s ease !important;
        height: 100% !important;
        display: flex !important;
        flex-direction: column !important;
    }
    .product_card_custom:hover {
        transform: translateY(-4px) !important;
        box-shadow: 0 6px 16px rgba(0,0,0,0.08) !important;
    }

    /* 이미지 고정 그리드 박스 */
    .coffee_img {
        position: relative !important;
        overflow: hidden !important;
        height: 200px !important;
        background: #fafafa !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        border-bottom: 1px solid #f1f3f5 !important;
    }
    .coffee_img img {
        max-height: 90% !important;
        width: auto !important;
        max-width: 90% !important;
        object-fit: contain !important;
    }

    /* 텍스트 설명 구역 */
    .coffee_box {
        padding: 18px 12px !important;
        flex-grow: 1 !important;
        display: flex !important;
        flex-direction: column !important;
        justify-content: space-between !important;
        background: #ffffff !important;
    }
    .types_text {
        font-size: 16px !important;
        font-weight: bold !important;
        color: #222222 !important;
        white-space: nowrap !important;
        overflow: hidden !important;
        text-overflow: ellipsis !important;
        margin-bottom: 6px !important;
        text-align: center !important;
    }

    /* 설명글 최대 2줄 고정 */
    .custom-desc {
        font-size: 13px !important;
        color: #666666 !important;
        line-height: 1.4 !important;
        margin-bottom: 12px !important;
        height: 36px !important;
        text-align: center !important;
        word-break: break-all !important;
        display: -webkit-box !important;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical !important;
        overflow: hidden !important;
    }
    
    .looking_text {
        font-size: 16px !important;
        font-weight: bold !important;
        color: #ff0000 !important;
        margin-bottom: 12px !important;
        text-align: center !important;
    }

    .read_bt_custom {
        text-align: center !important;
    }
    .read_bt_custom a {
        display: inline-block !important;
        width: 100% !important;
        padding: 8px 0 !important;
        background-color: #252525 !important;
        color: #ffffff !important;
        font-size: 13px !important;
        font-weight: bold !important;
        border-radius: 4px !important;
        transition: background-color 0.2s !important;
    }
    .read_bt_custom a:hover {
        background-color: #ff0000 !important;
        text-decoration: none !important;
    }

    .section_title_custom {
        font-size: 24px;
        font-weight: bold;
        color: #1a1a1a;
        border-left: 5px solid #ff0000;
        padding-left: 12px;
        margin-top: 50px;
        margin-bottom: 25px;
        text-transform: uppercase;
    }
</style>
</head>
<body>

    <% request.setAttribute("currentPage", "상점"); %> 
    <%@ include file="nav.jsp" %> 
    <% DecimalFormat formatter = new DecimalFormat("#,###"); %> 
    <div class="shop_layout_container">
        <h1 class="section_title_custom" style="margin-top: 40px;">NEW ARRIVALS</h1>
        
        <div class="slider_wrapper">
            <div id="new-carousel" class="owl-carousel owl-theme">
                <%
                    ProductRapository dao = ProductRapository.getInstance();
                    ArrayList<Product> newProducts = dao.getNewProducts();
                    
                    if(newProducts != null && !newProducts.isEmpty()) {
                        for (Product product : newProducts) {
                            String filename = product.getFilenameString();
                            String finalSrc = "images/img-1.png"; // 기본 이미지
                            
                            if (filename != null && !filename.isEmpty()) {
                                if (filename.trim().startsWith("http")) {
                                    finalSrc = filename.trim();
                                } else {
                                    if (!filename.contains(".")) {
                                        filename += ".png";
                                    }
                                    finalSrc = "images/" + filename.trim();
                                }
                            }
                %>
                <div class="item">
                    <div class="product_card_custom">
                        <div class="coffee_img">
                            <img src="<%= finalSrc %>" alt="<%= product.getNameString() %>" onerror="this.src='images/img-1.png';"> 
                        </div>
                        <div class="coffee_box">
                            <h3 class="types_text"><%= product.getNameString() %></h3> 
                            <p class="custom-desc"><%= product.getDescripString() != null ? product.getDescripString() : "" %></p> 
                            <p class="looking_text"><%= formatter.format(product.getUnitPrice()) %>원</p> 
                            <div class="read_bt_custom">
                                <a href="ShowProductData.jsp?id=<%= product.getProductIDString() %>">상세정보</a> 
                            </div>
                        </div>
                    </div>
                </div>
                <% 
                        }
                    } else {
                %>
                    <div class="item text-center py-5" style="width: 100%;">
                        <p class="text-muted">현재 등록된 상품이 없습니다.</p> 
                    </div>
                <%
                    }
                %>
            </div>
        </div>

        <h2 class="section_title_custom">ALL PRODUCTS</h2>
        
        <div class="row">
            <%
                ArrayList<Product> listOfProducts = dao.getAllProducts();
                if(listOfProducts != null && !listOfProducts.isEmpty()) {
                    for (Product product : listOfProducts) {
                        String filename = product.getFilenameString();
                        String finalSrc = "images/img-1.png"; // 기본 이미지
                        
                        if (filename != null && !filename.isEmpty()) {
                            if (filename.trim().startsWith("http")) {
                                finalSrc = filename.trim();
                            } else {
                                if (!filename.contains(".")) {
                                    filename += ".png";
                                }
                                finalSrc = "images/" + filename.trim();
                            }
                        }
            %>
            <div class="col-lg-3 col-md-4 col-sm-6" style="margin-bottom: 30px;">
                <div class="product_card_custom">
                    <div class="coffee_img">
                        <img src="<%= finalSrc %>" alt="<%= product.getNameString() %>" onerror="this.src='images/img-1.png';"> 
                    </div>
                    <div class="coffee_box">
                        <h3 class="types_text"><%= product.getNameString() %></h3> 
                        <p class="custom-desc"><%= product.getDescripString() != null ? product.getDescripString() : "" %></p> 
                        <p class="looking_text"><%= formatter.format(product.getUnitPrice()) %>원</p> 
                        <div class="read_bt_custom">
                            <a href="ShowProductData.jsp?id=<%= product.getProductIDString() %>">상세정보</a> 
                        </div>
                    </div>
                </div>
            </div>
            <% 
                    }
                } else {
            %>
                <div class="col-md-12 text-center py-5">
                    <p class="text-muted">현재 등록된 상품이 없습니다.</p> 
                </div>
            <%
                }
            %>
        </div>
    </div>

    <%@ include file="footer.jsp" %> 
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script> 
    <script src="js/plugin.js"></script>
    <script src="js/custom.js"></script>
    
    <script>
        $(document).ready(function() {
            var newOwl = $('#new-carousel');
            if (newOwl.length > 0) {
                newOwl.owlCarousel({
                    loop: true,
                    margin: 30,
                    nav: true,
                    autoplay: true, 
                    autoplayTimeout: 3000,
                    autoplayHoverPause: true,
                    navText: ["<i class='fa fa-arrow-left'></i>", "<i class='fa fa-arrow-right'></i>"],
                    responsive: {
                        0: { items: 1 }, 
                        576: { items: 2 }, 
                        768: { items: 3 }, 
                        992: { items: 4 } 
                    }
                });
            }
        });
    </script>
</body>
</html>