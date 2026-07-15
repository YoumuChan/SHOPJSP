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

    // 1. 임시로 서버에 저장할 경로 지정 (Tomcat 가상 매핑 불필요!)
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

    int unitPrice = (unitPriceStr != null && !unitPriceStr.isEmpty()) ? Integer.parseInt(unitPriceStr) : 0;
    long unitsInStock = (unitsInStockStr != null && !unitsInStockStr.isEmpty()) ? Long.parseLong(unitsInStockStr) : 0;

    Product newProduct = new Product();
    newProduct.setProductIDString(productId);
    newProduct.setNameString(name);
    newProduct.setUnitPrice(unitPrice);
    newProduct.setDescripString(description);
    newProduct.setManufacturer(manufacturer);
    newProduct.setCategoryString(category);
    newProduct.setUnitsInStock(unitsInStock);
    newProduct.setConditionString(condition);

    // 이미지 파일명 가져오기
    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    // 사용자가 이미지를 올리지 않았을 때 보여줄 기본 이미지 주소
    String finalImageUrl = "https://i.ibb.co/4M3g96v/img-1.png"; 

    if (fileName != null && !fileName.isEmpty()) {
        // 로컬에 임시 저장된 파일 객체 생성
        File uploadFile = new File(tempPath + File.separator + fileName);
        
        if (uploadFile.exists()) {
            try {
                // 1) 임시 저장된 이미지 파일을 Base64 문자열로 변환 (ImgBB API 전송 규격)
                FileInputStream fis = new FileInputStream(uploadFile);
                byte[] fileBytes = new byte[(int) uploadFile.length()];
                fis.read(fileBytes);
                fis.close();
                String base64Image = Base64.getEncoder().encodeToString(fileBytes);

                // 2) ImgBB API 전송 준비 (보내주신 API Key 적용 완)
                String apiKey = "748e6981b8bb761d0d129be5c11c8b92"; 
                String apiURL = "https://api.imgbb.com/1/upload?key=" + apiKey;
                
                URL url = new URL(apiURL);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setDoOutput(true);
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

                // 파라미터 구성 (image=Base64문자열 형식)
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

                    // 4) JSON 응답 파싱 (서버 이미지 주소만 쏙 빼내기)
                    String responseStr = responseJson.toString();
                    int urlStartIndex = responseStr.indexOf("\"url\":\"") + 7;
                    int urlEndIndex = responseStr.indexOf("\"", urlStartIndex);
                    
                    if (urlStartIndex > 6) {
                        // 추출된 이스케이프 제거된 진짜 이미지 주소 확보
                        finalImageUrl = responseStr.substring(urlStartIndex, urlEndIndex).replace("\\/", "/");
                    }
                }
                
                // 5) 목적 달성 후, 서버 하드디스크 용량을 차지하지 않게 임시 폴더의 원본 파일은 즉시 삭제
                uploadFile.delete();
                
            } catch (Exception e) {
                e.printStackTrace(); 
            }
        }
    }

    // DB/리포지토리에는 ImgBB가 발행해준 영구 보존용 이미지 인터넷 URL을 저장!
    newProduct.setFilenameString(finalImageUrl);

    ProductRapository dao = ProductRapository.getInstance();
    dao.addProduct(newProduct);

    // 완료 후 상품 목록 페이지로 리다이렉트
    response.sendRedirect("Products.jsp");
%>