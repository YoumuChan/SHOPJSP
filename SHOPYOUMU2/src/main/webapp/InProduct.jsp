<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* CSS 파일의 간섭을 차단하기 위해 !important 사용 */
        .my-form-group { margin-bottom: 20px; }
        .my-form-control { width: 100% !important; padding: 10px; border: 1px solid #ccc; border-radius: 4px; }
    </style>
</head>
<body>
    <% request.setAttribute("currentPage", "상품 등록"); %>
    <%@ include file="nav.jsp" %>
    
    <div class="container" style="padding: 50px 0;">
        <div class="card p-4">
            <h3 class="mb-4">상품 정보 입력</h3>
            <form action="processAddProduct.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6 my-form-group">
                        <label>상품 코드</label>
                        <input type="text" name="productId" class="my-form-control" required>
                    </div>
                    <div class="col-md-6 my-form-group">
                        <label>상품명</label>
                        <input type="text" name="name" class="my-form-control" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 my-form-group">
                        <label>가격</label>
                        <input type="number" name="unitPrice" class="my-form-control">
                    </div>
                    <div class="col-md-4 my-form-group">
                        <label>제조사</label>
                        <input type="text" name="manufacturer" class="my-form-control">
                    </div>
                    <div class="col-md-4 my-form-group">
                        <label>재고 수량</label>
                        <input type="number" name="unitsInStock" class="my-form-control">
                    </div>
                </div>
                
                <div class="my-form-group">
                    <label class="mr-3">상품 상태: </label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="condition" id="cond1" value="New" checked>
                        <label class="form-check-label" for="cond1">신규(New)</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="condition" id="cond2" value="Used">
                        <label class="form-check-label" for="cond2">중고(Used)</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="condition" id="cond3" value="Refurbished">
                        <label class="form-check-label" for="cond3">리퍼브(Refurbished)</label>
                    </div>
                </div>

                <div class="my-form-group">
                    <label>상세 설명</label>
                    <textarea name="description" class="my-form-control" rows="4"></textarea>
                </div>
                <div class="my-form-group">
                    <label>상품 이미지</label>
                    <input type="file" name="productImage" class="my-form-control">
                </div>
                <button type="submit" class="btn btn-danger">등록 완료</button>
            </form>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>