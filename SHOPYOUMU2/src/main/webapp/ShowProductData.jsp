<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRapository" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    String id = request.getParameter("id");
    ProductRapository dao = ProductRapository.getInstance();
    Product product = dao.getProductById(id);
    DecimalFormat formatter = new DecimalFormat("#,###");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <style>
        .detail_container { padding-bottom: 60px; margin-top: 40px; }
        .product_title { font-size: 32px; font-weight: 800; color: #111; margin-bottom: 12px; }
        .product_price { font-size: 28px; color: #ff0000; font-weight: bold; margin-bottom: 25px; }
        .info_group p { margin-bottom: 8px; color: #444; font-size: 15px; }
        
        .premium_spec_zone {
            background-color: #fafafa !important;
            border: 1px solid #e5e5e5 !important;
            padding: 18px 22px !important;
            border-radius: 6px !important;
            margin-bottom: 25px !important;
            line-height: 2.2 !important;
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.02);
        }
        .premium_spec_item { font-size: 14px !important; color: #222222 !important; display: inline-block !important; font-weight: 500; }
        .premium_spec_key { font-weight: 700 !important; color: #007bff !important; }
        .premium_spec_value { color: #333 !important; }
        .premium_divider { color: #dddddd !important; margin: 0 12px !important; font-size: 14px !important; display: inline-block; font-weight: 300; }
    </style>
</head>
<body>

    <%@ include file="nav.jsp" %>

    <div class="detail_container">
        <div class="container">
            <% if (product != null) { %>
                <div class="row">
                    <div class="col-md-5">
                        <%
                            // 어떤 주소(ImgBB, 위키미디어 등)든 http로 시작하면 전부 통과시키는 강력한 분기 처리
                            String imgUrl = product.getFilenameString();
                            String finalSrc = "images/img-1.png";
                            
                            if (imgUrl != null && !imgUrl.isEmpty()) {
                                imgUrl = imgUrl.trim();
                                // 혹시 모를 공백 제거
                                if (imgUrl.toLowerCase().startsWith("http")) {
                                    finalSrc = imgUrl;
                                    // 외부 인터넷 이미지 주소 그대로 출력!
                                } else {
                                    finalSrc = "images/" + imgUrl;
                                    // 일반 로컬 파일명일 때만 경로 조립!
                                }
                            }
                        %>
                        <img src="<%= finalSrc %>" style="width: 100%; border: 1px solid #e1e1e1; border-radius: 6px; box-shadow: 0 4px 12px rgba(0,0,0,0.05);" onerror="this.src='images/img-1.png';">
                    </div>
                    
                    <div class="col-md-7" style="padding-left: 45px;">
                        <h1 class="product_title"><%= product.getNameString() %></h1>
          
                        <div class="premium_spec_zone">
                            <%
                                String rawDesc = product.getDescripString();
                                if (rawDesc != null && !rawDesc.isEmpty()) {
                                    String[] sections = rawDesc.split("/");
                                    for (int i = 0; i < sections.length; i++) {
                                        String section = sections[i].trim();
                                        if (section.isEmpty()) continue;
                                        
                                        if (section.contains(":")) {
                                            String[] kv = section.split(":");
                                            String key = kv[0].trim();
                                            String valuesRaw = kv.length > 1 ? kv[1].trim() : "";
                                            
                                            String[] tokens = valuesRaw.split("[, ]+");
                                            StringBuilder sb = new StringBuilder();
                                            for (String token : tokens) {
                                                String t = token.trim();
                                                if (!t.isEmpty()) {
                                                    if (sb.length() > 0) sb.append(", ");
                                                    sb.append(t);
                                                }
                                            }
                                %>
                                            <span class="premium_spec_item">
                                                <span class="premium_spec_key"><%= key %> :</span>
                                                <span class="premium_spec_value"><%= sb.toString() %></span>
                                            </span>
                                <%
                                        } else {
                                            String[] tokens = section.split("[, ]+");
                                            StringBuilder sb = new StringBuilder();
                                            for (String token : tokens) {
                                                String t = token.trim();
                                                if (!t.isEmpty()) {
                                                    if (sb.length() > 0) sb.append(", ");
                                                    sb.append(t);
                                                }
                                            }
                                %>
                                            <span class="premium_spec_item"><%= sb.toString() %></span>
                                <%
                                        }
    
                                        if (i < sections.length - 1) { %>
                                            <span class="premium_divider">/</span>
                                <%      }
                                    }
                                } else {
                                %>
                                    <span class="text-muted">등록된 상세 사양 정보가 없습니다.</span>
                                <%
                                }
                            %>
                        </div>
               
                        <p class="product_price"><%= formatter.format(product.getUnitPrice()) %>원</p>
                        
                        <div class="info_group" style="border-top: 1px solid #eee; padding-top: 20px;">
                            <p><strong>상품 코드:</strong> <span class="badge badge-dark" style="font-size:13px; padding: 5px 8px;"><%= product.getProductIDString() %></span></p>
                            <p><strong>제조사:</strong> <%= product.getManufacturer() %></p>
                            <p><strong>분류:</strong> <%= product.getCategoryString() %></p>
                            <p><strong>재고 수량:</strong> <%= product.getUnitsInStock() %>개</p>
                            <p><strong>상태:</strong> <%= product.getConditionString() %></p>
                        </div>
                        
                        <div style="margin-top: 35px;">
                            <a href="#" class="btn btn-danger btn-lg px-5 font-weight-bold" style="border-radius:4px; box-shadow: 0 4px 8px rgba(220,53,69,0.2);">구매하기</a>
                            <a href="Products.jsp" class="btn btn-dark btn-lg px-4 font-weight-bold" style="border-radius:4px; margin-left: 10px;">
                                <i class="fa fa-arrow-left" aria-hidden="true"></i> 상품 목록
                            </a>
                        </div>
                    </div>
                </div>
            <% } else { %>
                <div class="text-center py-5">
                    <h3>🚨 상품 정보를 불러올 수 없습니다.</h3>
                    <a href="Products.jsp" class="btn btn-primary mt-3">목록으로 돌아가기</a>
                </div>
            <% } %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
</body>
</html>