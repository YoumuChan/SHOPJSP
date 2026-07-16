<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.Base64" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRapository" %>

<%
    request.setCharacterEncoding("UTF-8");
    // 1. 임시로 서버에 저장할 경로 지정
    String tempPath = request.getServletContext().getRealPath("/images");
    File tempDir = new File(tempPath);
    if (!tempDir.exists()) {
        tempDir.mkdirs(); // 폴더가 없으면 자동 생성
    }

    int maxSize = 5 * 1024 * 1024; // 5MB 제한
    String encType = "UTF-8";
    // 일단 로컬 임시 폴더에 파일 업로드 처리
    MultipartRequest multi = new MultipartRequest(
        request, 
        tempPath, 
        maxSize, 
        encType, 
        new DefaultFileRenamePolicy()
    );
    // 폼 파라미터 가져오기
    String productId = multi.getParameter("productId");
    String name = multi.getParameter("name");
    String unitPriceStr = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String manufacturer = multi.getParameter("manufacturer");
    String category = multi.getParameter("category");
    String unitsInStockStr = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");

    // =======================================================
    // 🚀 [서버 철벽 가드] 가격이 비어있거나, 0원 이하(음수 포함)일 때 원천 차단!
    // =======================================================
    if (unitPriceStr == null || unitPriceStr.trim().isEmpty()) {
%>
        <script>
            alert("[등록 실패] 가격을 입력해 주세요.");
            history.back();
        </script>
<%
        return;
    }

    int unitPrice = 0;
    try {
        unitPrice = Integer.parseInt(unitPriceStr.trim());
    } catch (NumberFormatException e) {
%>
        <script>
            alert("[등록 실패] 가격은 숫자만 입력해야 합니다.");
            history.back();
        </script>
<%
        return;
    }

    // ⭐ 가격이 0원이거나 음수(마이너스)면 서버에서 절대 통과 안 시키고 뒤로 보냄!
    if (unitPrice <= 0) {
%>
        <script>
            alert("[등록 실패] 가격은 1원 이상이어야 합니다. (0원 및 음수 등록 불가)");
            history.back();
        </script>
<%
        return;
    }

    // =======================================================
    // 🚀 [서버 철벽 가드] 재고 수량이 비어있거나, 음수(마이너스)일 때 원천 차단!
    // =======================================================
    if (unitsInStockStr == null || unitsInStockStr.trim().isEmpty()) {
%>
        <script>
            alert("[등록 실패] 재고 수량을 입력해 주세요.");
            history.back();
        </script>
<%
        return;
    }

    long unitsInStock = 0;
    try {
        unitsInStock = Long.parseLong(unitsInStockStr.trim());
    } catch (NumberFormatException e) {
%>
        <script>
            alert("[등록 실패] 재고 수량은 숫자만 입력해야 합니다.");
            history.back();
        </script>
<%
        return;
    }

    if (unitsInStock < 0) {
%>
        <script>
            alert("[등록 실패] 재고 수량은 음수일 수 없습니다.");
            history.back();
        </script>
<%
        return;
    }

    // =======================================================
    // 데이터 검증 완료 후, 상품 객체 정보 담기
    // =======================================================
    Product newProduct = new Product();
    newProduct.setProductIDString(productId);
    newProduct.setNameString(name);
    newProduct.setUnitPrice(unitPrice);
    newProduct.setDescripString(description);
    newProduct.setManufacturer(manufacturer);
    newProduct.setCategoryString(category);
    newProduct.setUnitsInStock(unitsInStock);
    newProduct.setConditionString(condition);

    // =======================================================
    // 🚀 [이미지 버그 완벽 해결!] 이미지가 아예 없을 때 에러가 안 나게 가드 처리!
    // =======================================================
    String finalImageUrl = "https://i.ibb.co/4M3g96v/img-1.png"; // 기본 이미지 주소
    
    Enumeration files = multi.getFileNames();
    // 파일 입력 요소가 실존할 때만 데이터를 꺼냄 (NullPointer / NoSuchElement 원천 방지)
    if (files != null && files.hasMoreElements()) {
        String fname = (String) files.nextElement();
        String fileName = multi.getFilesystemName(fname);

        // 사용자가 실제로 파일을 선택해서 올렸을 때만 ImgBB API 전송을 시작함!
        if (fileName != null && !fileName.isEmpty()) {
            File uploadFile = new File(tempPath + File.separator + fileName);
            if (uploadFile.exists()) {
                try {
                    // 1) 임시 저장된 이미지 파일을 Base64 문자열로 변환
                    FileInputStream fis = new FileInputStream(uploadFile);
                    byte[] fileBytes = new byte[(int) uploadFile.length()];
                    fis.read(fileBytes);
                    fis.close();
                    String base64Image = Base64.getEncoder().encodeToString(fileBytes);

                    // 2) ImgBB API 전송 준비
                    String apiKey = "748e6981b8bb761d0d129be5c11c8b92";
                    String apiURL = "https://api.imgbb.com/1/upload?key=" + apiKey;
                    
                    URL url = new URL(apiURL);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setDoOutput(true);
                    conn.setRequestMethod("POST");
                    conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

                    // 파라미터 구성
                    String postData = "image=" + java.net.URLEncoder.encode(base64Image, "UTF-8");

                    // API 서버로 전송
                    OutputStream os = conn.getOutputStream();
                    os.write(postData.getBytes("UTF-8"));
                    os.flush();
                    os.close();

                    // 3) 응답 데이터 받아오기
                    int responseCode = conn.getResponseCode();
                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                        String inputLine;
                        StringBuilder responseJson = new StringBuilder();
                        while ((inputLine = in.readLine()) != null) {
                            responseJson.append(inputLine);
                        }
                        in.close();

                        // 4) JSON 응답 파싱
                        String responseStr = responseJson.toString();
                        int urlStartIndex = responseStr.indexOf("\"url\":\"") + 7;
                        int urlEndIndex = responseStr.indexOf("\"", urlStartIndex);
                        if (urlStartIndex > 6) {
                            finalImageUrl = responseStr.substring(urlStartIndex, urlEndIndex).replace("\\/", "/");
                        }
                    }
                    
                    // 5) 서버 저장 용량 방지를 위해 원본 임시 파일은 즉시 삭제
                    uploadFile.delete();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // 최종 결정된 이미지 링크(업로드 성공 시 ImgBB URL, 미업로드 시 기본 이미지 URL) 저장!
    newProduct.setFilenameString(finalImageUrl);

    // DB 리포지토리에 저장 진행
    ProductRapository dao = ProductRapository.getInstance();
    dao.addProduct(newProduct);

    // 완료 후 상품 목록 페이지로 리다이렉트
    response.sendRedirect("Products.jsp");
%>