<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="resource" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* 외부 CSS의 인풋 간섭을 확실히 잡아줍니다. */
        .my-form-group { margin-bottom: 20px; }
        .my-form-control { width: 100% !important; padding: 10px; border: 1px solid #ccc; border-radius: 4px; }
        
        /* 🚀 브라우저 기본 파일 인풋을 숨기고 커스텀하는 스타일 */
        .file-upload-wrapper {
            display: flex;
            align-items: center;
            width: 100%;
        }
        /* 실제 오리지널 file input은 숨김 처리 */
        .real-file-input {
            display: none !important;
        }
        /* 가짜로 보여줄 디자인 버튼 */
        .custom-file-btn {
            background-color: #f4f4f4;
            border: 1px solid #ccc;
            border-right: none;
            border-radius: 4px 0 0 4px;
            padding: 10px 20px;
            font-size: 14px;
            color: #333;
            cursor: pointer;
            white-space: nowrap;
            transition: background-color 0.2s;
        }
        .custom-file-btn:hover {
            background-color: #e9ecef;
        }
        /* 선택된 파일명이 들어갈 텍스트 상자 */
        .custom-file-text {
            flex-grow: 1;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 0 4px 4px 0;
            padding: 10px 15px;
            font-size: 14px;
            color: #666;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
    </style>
    
    <script type="text/javascript" src="js/validation.js?v=9"></script>
    
    <script type="text/javascript">
        function handleFileChange(input) {
            var fileNameText = document.getElementById("fileNameDisplay");
            if (input.files && input.files.length > 0) {
                fileNameText.innerText = input.files[0].name;
                fileNameText.style.color = "#333";
            } else {
                fileNameText.innerText = "<fmt:message key='file_no_selected' />";
                fileNameText.style.color = "#666";
            }
        }
        function triggerFileInput() {
            document.getElementById("productImageInput").click();
        }
    </script>
</head>
<body>
    <% request.setAttribute("currentPage", "상품 등록"); %>
    <%@ include file="nav.jsp" %>
    
    <div class="container" style="padding: 50px 0;">
        <div class="card p-4">
            <h3 class="mb-4"><fmt:message key="title" /></h3>
            
            <form name="newProduct" action="processAddProduct.jsp" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
                <div class="row">
                    <div class="col-md-6 my-form-group">
                        <label><fmt:message key="productId" /></label>
                        <input type="text" name="productId" class="my-form-control" placeholder="<fmt:message key='placeholder_productId' />" required>
                    </div>
                    <div class="col-md-6 my-form-group">
                        <label><fmt:message key="productName" /></label>
                        <input type="text" name="name" class="my-form-control" required>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col-md-4 my-form-group">
                        <label><fmt:message key="unitPrice" /></label>
                        <input type="number" name="unitPrice" class="my-form-control" placeholder="<fmt:message key='placeholder_unitPrice' />" required>
                    </div>
                    <div class="col-md-4 my-form-group">
                        <label><fmt:message key="manufacturer" /></label>
                        <input type="text" name="manufacturer" class="my-form-control" placeholder="<fmt:message key='placeholder_manufacturer' />" required>
                    </div>
                    <div class="col-md-4 my-form-group">
                        <label><fmt:message key="unitsInStock" /></label>
                        <input type="number" name="unitsInStock" class="my-form-control" placeholder="<fmt:message key='placeholder_unitsInStock' />" required>
                    </div>
                </div>
                
                <div class="my-form-group">
                    <label><fmt:message key="category" /></label>
                    <input type="text" name="category" class="my-form-control" placeholder="<fmt:message key='placeholder_category' />" required>
                </div>
                
                <div class="my-form-group">
                    <label class="mr-3"><fmt:message key="condition" />: </label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="condition" id="cond1" value="New" checked>
                        <label class="form-check-label" for="cond1"><fmt:message key="cond_new" /></label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="condition" id="cond2" value="Used">
                        <label class="form-check-label" for="cond2"><fmt:message key="cond_used" /></label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="condition" id="cond3" value="Refurbished">
                        <label class="form-check-label" for="cond3"><fmt:message key="cond_refurbished" /></label>
                    </div>
                </div>

                <div class="my-form-group">
                    <label><fmt:message key="description" /></label>
                    <textarea name="description" class="my-form-control" rows="4" placeholder="<fmt:message key='placeholder_description' />" required></textarea>
                </div>
                
                <div class="my-form-group">
                    <label><fmt:message key="productImage" /></label>
                    <div class="file-upload-wrapper">
                        <button type="button" class="custom-file-btn" onclick="triggerFileInput()">
                            <fmt:message key="file_select" />
                        </button>
                        <div class="custom-file-text" id="fileNameDisplay">
                            <fmt:message key="file_no_selected" />
                        </div>
                        <input type="file" name="productImage" id="productImageInput" class="real-file-input" onchange="handleFileChange(this)" required>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-danger"><fmt:message key="submitBtn" /></button>
            </form>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>