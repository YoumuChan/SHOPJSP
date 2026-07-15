<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRapository" %>
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
</head>
<body>
    <div class="coffee_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="coffee_taital">OUR SHOP</h1>
                </div>
            </div>
        </div>
        
        <div class="coffee_section_2">
            <div class="container-fluid">
                <div class="row">
                    <%
                        // DAO 인스턴스 생성
                        ProductRapository dao = new ProductRapository();
                        ArrayList<Product> listOfProducts = dao.getAllProducts();
                        
                        // 데이터 안전 체크
                        if(listOfProducts != null && !listOfProducts.isEmpty()) {
                            for (Product product : listOfProducts) {
                    %>
                    <div class="col-lg-3 col-md-6" style="margin-bottom: 30px;">
                        <div class="coffee_img">
                            <img src="images/<%= product.getFilenameString() != null ? product.getFilenameString() : "img-1.png" %>" alt="<%= product.getNameString() %>">
                        </div>
                        <div class="coffee_box">
                            <h3 class="types_text"><%= product.getNameString() %></h3>
                            <p class="looking_text"><%= product.getUnitPrice() %>원</p>
                            <div class="read_bt">
                                <a href="ShowProductData.jsp?id=<%= product.getProductIDString() %>">상세정보</a>
                            </div>
                        </div>
                    </div>
                    <% 
                            } // for 종료
                        } else {
                    %>
                        <div class="col-md-12 text-center">
                            <p>현재 등록된 상품이 없습니다.</p>
                        </div>
                    <%
                        } // if 종료
                    %>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>