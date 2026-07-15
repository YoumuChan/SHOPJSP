package dao;

import java.util.ArrayList;
import dto.Product;

public class ProductRapository {
    
    // 서버 가동 중 데이터 보존을 위한 static 공유 리스트
    private static ArrayList<Product> listOfProducts = new ArrayList<Product>();
    private static ProductRapository instance = new ProductRapository();
    
    public static ProductRapository getInstance() {
        return instance;
    }
    
    public ProductRapository() {
        if (listOfProducts.isEmpty()) {
            // 1. SONY 알파 A7R VI (1번 정석 규격화 완료)
            Product p1 = new Product("P1234", "SONY 알파 A7R VI", 5995520);
            p1.setDescripString("종류 : 미러리스 / 화소 : 6680만화소 / 센서 : 풀프레임 / 손떨림보정 : 5축광학식 / 보정성능 : 8.5스톱 / 프로세서 : Bionz XR2 / 마운트 : SONY FE / 화면 : 3.2인치 / 화면형태 : 회전+틸트형 / 화면화소 : 209만화소 / 화면특징 : 셀카 터치 / 뷰파인더 : 전자식 / 초점영역 : 759개 / 감도 : ISO32000 / 확장감도 : ISO50-102400 / 셔터스피드 : 1-8000초 / 연사 : 초당10매(기계식 전자식) / 해상도 : 8K / 프레임 : 30p / 영상색상 : 10bit / 영상포맷 : 4-2-2 / 다이나믹레인지 : DR-16스톱 이상 / 포맷 : RAW / 스타일 : SONY 크리에이티브룩 / 규격단자 : 듀얼슬롯 USB-C HDMI 마이크 헤드폰");
            p1.setCategoryString("computer device");
            p1.setManufacturer("SONY");
            p1.setUnitsInStock(1000);
            p1.setConditionString("New");
            p1.setFilenameString("img-1.png");
            listOfProducts.add(p1);
            
            // 2. 네오북 N16GO (1번 정석 규격화 완료 - 이제 파란색 분류명 정상 작동!)
            Product p2 = new Product("P1235", "네오북 N16GO", 339000);
            p2.setDescripString("제조사 : NEOBOOK / 브랜드 : 네오북(자체제작 상품) / 모델명 : N16GO / 원산지 : 중국산(주)태클라스트코리아) / 제조일자 : 2024.12.30. / 출시년도 : 2025 / 코어종류 : 2코어(듀얼코어) / CPU : 셀러론-N4020");
            p2.setCategoryString("Laptop");
            p2.setManufacturer("NEOGOOK");
            p2.setUnitsInStock(500);
            p2.setConditionString("New");
            p2.setFilenameString("img-2.png");
            listOfProducts.add(p2);
            
            // 3. 카시오_MDV-106 (1번 정석 규격화 완료)
            Product p3 = new Product("P1236", "카시오_MDV-106", 65000);
            p3.setDescripString("종류 : 손목시계 / 타겟 : 남성용 / 스트랩소재 : 우레탄 레진 / 표시방식 : 아날로그시계 / 무브먼트 : 쿼츠 / 기압방수 : 20ATM / 글라스 : 미네랄 / 기능 : 날짜표시 / 용도 : 다이버 / 케이스형태 : 원형");
            p3.setCategoryString("Watch");
            p3.setManufacturer("CASIO");
            p3.setUnitsInStock(200);
            p3.setConditionString("New");
            p3.setFilenameString("img-3.png");
            listOfProducts.add(p3);
        }
    }
    
    public ArrayList<Product> getAllProducts() { 
        return listOfProducts; 
    }
    
    public void addProduct(Product product) {
        listOfProducts.add(0, product);
    }
    
    public ArrayList<Product> getNewProducts() {
        ArrayList<Product> newProducts = new ArrayList<Product>();
        int count = 0;
        for (Product product : listOfProducts) {
            if (count >= 5) break; 
            newProducts.add(product);
            count++;
        }
        return newProducts;
    }
    
    public Product getProductById(String productId) {
        for (Product product : listOfProducts) {
            if (product.getProductIDString().equals(productId)) return product;
        }
        return null;
    }
}