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
            // 1. SONY 알파 A7R VI (기존 유지)
            Product p1 = new Product("P1234", "SONY 알파 A7R VI", 5995520);
            p1.setDescripString("종류 : 미러리스 / 화소 : 6680만화소 / 센서 : 풀프레임 / 손떨림보정 : 5축광학식 / 보정성능 : 8.5스톱 / 프로세서 : Bionz XR2 / 마운트 : SONY FE / 화면 : 3.2인치 / 화면형태 : 회전+틸트형 / 화면화소 : 209만화소 / 화면특징 : 셀카 터치 / 뷰파인더 : 전자식 / 초점영역 : 759개 / 감도 : ISO32000 / 확장감도 : ISO50-102400 / 셔터스피드 : 1-8000초 / 연사 : 초당10매(기계식 전자식) / 해상도 : 8K / 프레임 : 30p / 영상색상 : 10bit / 영상포맷 : 4-2-2 / 다이나믹레인지 : DR-16스톱 이상 / 포맷 : RAW / 스타일 : SONY 크리에이티브룩 / 규격단자 : 듀얼슬롯 USB-C HDMI 마이크 헤드폰");
            p1.setCategoryString("computer device");
            p1.setManufacturer("SONY");
            p1.setUnitsInStock(1000);
            p1.setConditionString("New");
            p1.setFilenameString("img-1.png");
            listOfProducts.add(p1);
            
            // 2. 네오북 N16GO (기존 유지)
            Product p2 = new Product("P1235", "네오북 N16GO", 339000);
            p2.setDescripString("제조사 : NEOBOOK / 브랜드 : 네오북(자체제작 상품) / 모델명 : N16GO / 원산지 : 중국산(주)태클라스트코리아) / 제조일자 : 2024.12.30. / 출시년도 : 2025 / 코어종류 : 2코어(듀얼코어) / CPU : 셀러론-N4020");
            p2.setCategoryString("Laptop");
            p2.setManufacturer("NEOGOOK");
            p2.setUnitsInStock(500);
            p2.setConditionString("New");
            p2.setFilenameString("img-2.png");
            listOfProducts.add(p2);
            
            // 3. 카시오_MDV-106 (기존 유지)
            Product p3 = new Product("P1236", "카시오_MDV-106", 65000);
            p3.setDescripString("종류 : 손목시계 / 타겟 : 남성용 / 스트랩소재 : 우레탄 레진 / 표시방식 : 아날로그시계 / 무브먼트 : 쿼츠 / 기압방수 : 20ATM / 글라스 : 미네랄 / 기능 : 날짜표시 / 용도 : 다이버 / 케이스형태 : 원형");
            p3.setCategoryString("Watch");
            p3.setManufacturer("CASIO");
            p3.setUnitsInStock(200);
            p3.setConditionString("New");
            p3.setFilenameString("img-3.png");
            listOfProducts.add(p3);

            // ==================== [보안 차단 절대 없는 Unsplash 고화질 핫링크 주소] 스타벅스 메뉴 15개 🚀 ====================

            // 4. 카페 아메리카노
            Product americano = new Product("P1001", "카페 아메리카노", 4500);
            americano.setDescripString("원두 : 에스프레소 로스트 / 바디감 : 미디엄 / 특징 : 진한 에스프레소에 뜨거운 물을 섞어 우려낸 깔끔하고 깊은 풍미의 클래식 커피");
            americano.setManufacturer("Starbucks");
            americano.setCategoryString("Espresso");
            americano.setUnitsInStock(100);
            americano.setConditionString("Hot/Ice");
            americano.setFilenameString("https://images.unsplash.com/photo-1551030173-122aabc4489c?w=500"); 
            listOfProducts.add(americano);

            // 5. 카페 라떼
            Product latte = new Product("P1002", "카페 라떼", 5000);
            latte.setDescripString("원두 : 에스프레소 로스트 / 우유 : 고소한 스팀 밀크 / 특징 : 풍부하고 진한 에스프레소 샷에 신선한 우유를 넣어 부드러운 스탠다드 라떼");
            latte.setManufacturer("Starbucks");
            latte.setCategoryString("Espresso");
            latte.setUnitsInStock(80);
            latte.setConditionString("Hot/Ice");
            latte.setFilenameString("https://images.unsplash.com/photo-1570968915860-54d5c301fc9f?w=500");
            listOfProducts.add(latte);

            // 6. 스타벅스 돌체 라떼
            Product dolce = new Product("P1003", "스타벅스 돌체 라떼", 5900);
            dolce.setDescripString("우유 : 무지방 우유, 돌체 시럽 / 휘핑 : 없음 / 특징 : 깊은 풍미의 에스프레소와 깔끔한 무지방 우유, 달콤한 연유가 만나 부드럽고 달콤한 라떼");
            dolce.setManufacturer("Starbucks");
            dolce.setCategoryString("Blended");
            dolce.setUnitsInStock(50);
            dolce.setConditionString("Hot/Ice");
            dolce.setFilenameString("https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500");
            listOfProducts.add(dolce);

            // 7. 카라멜 마키아또
            Product macchiato = new Product("P1004", "카라멜 마키아또", 5900);
            macchiato.setDescripString("시럽 : 바닐라 시럽 / 토핑 : 달콤한 카라멜 드리즐 / 특징 : 향긋한 바닐라 시럽과 따뜻한 우유 거품, 그리고 그 위에 그려진 달콤한 카라멜 드리즐의 조화");
            macchiato.setManufacturer("Starbucks");
            macchiato.setCategoryString("Espresso");
            macchiato.setUnitsInStock(60);
            macchiato.setConditionString("Hot/Ice");
            macchiato.setFilenameString("https://images.unsplash.com/photo-1485808191679-5f86510681a2?w=500");
            listOfProducts.add(macchiato);

            // 8. 카페 모카
            Product mocha = new Product("P1005", "카페 모카", 5500);
            mocha.setDescripString("초콜릿 : 모카 시럽 / 휘핑 : 일반 휘핑 크림 / 특징 : 진한 에스프레소와 초콜릿 액상 시럽, 신선한 우유를 휘핑크림과 함께 즐기는 달콤 쌉싸름한 맛");
            mocha.setManufacturer("Starbucks");
            mocha.setCategoryString("Espresso");
            mocha.setUnitsInStock(45);
            mocha.setConditionString("Hot/Ice");
            mocha.setFilenameString("https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=500");
            listOfProducts.add(mocha);

            // 9. 자바 칩 프라푸치노
            Product javachip = new Product("P1006", "자바 칩 프라푸치노", 6300);
            javachip.setDescripString("베이스 : 커피 프라푸치노 / 토핑 : 초콜릿 칩, 에스프레소 휘핑 / 특징 : 커피, 모카 시럽, 그리고 통째로 갈아 넣은 초콜릿 칩이 어우러진 시그니처 블렌디드");
            javachip.setManufacturer("Starbucks");
            javachip.setCategoryString("Frappuccino");
            javachip.setUnitsInStock(70);
            javachip.setConditionString("Ice Only");
            javachip.setFilenameString("https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500");
            listOfProducts.add(javachip);

            // 10. 제주 말차 크림 프라푸치노
            Product matcha = new Product("P1007", "제주 말차 크림 프라푸치노", 6300);
            matcha.setDescripString("말차 : 100% 제주 유기농 말차 / 휘핑 : 일반 휘핑 / 특징 : 깊고 진한 제주도산 말차의 쌉싸름한 맛에 달콤함과 부드러움을 더한 프라푸치노");
            matcha.setManufacturer("Starbucks");
            matcha.setCategoryString("Frappuccino");
            matcha.setUnitsInStock(40);
            matcha.setConditionString("Ice Only");
            matcha.setFilenameString("https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=500");
            listOfProducts.add(matcha);

            // 11. 콜드 브루
            Product coldbrew = new Product("P1008", "콜드 브루 커피", 4900);
            coldbrew.setDescripString("추출 방식 : 찬물로 14시간 침출 / 원두 : 콜드브루 전용 전용 원두 / 특징 : 부드러운 목 넘김과 은은한 초콜릿 풍미가 살아있는 깔끔하고 시원한 커피");
            coldbrew.setManufacturer("Starbucks");
            coldbrew.setCategoryString("ColdBrew");
            coldbrew.setUnitsInStock(90);
            coldbrew.setConditionString("Ice Only");
            coldbrew.setFilenameString("https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=500");
            listOfProducts.add(coldbrew);

            // 12. 자몽 허니 블랙 티
            Product jahubla = new Product("P1009", "자몽 허니 블랙 티", 5700);
            jahubla.setDescripString("베이스 : 홍차 (블랙티) / 베이스2 : 달콤한 자몽 허니 소스 / 특징 : 새콤한 자몽과 달콤한 꿀이 어우러진 소스에 티바나 블랙 티를 더한 스타벅스 대표 티 음료");
            jahubla.setManufacturer("Starbucks");
            jahubla.setCategoryString("Teavana");
            jahubla.setUnitsInStock(120);
            jahubla.setConditionString("Hot/Ice");
            jahubla.setFilenameString("https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500");
            listOfProducts.add(jahubla);

            // 13. 딸기 딜라이트 요거트 블렌디드
            Product strawberryYogurt = new Product("P1010", "딸기 요거트 블렌디드", 6300);
            strawberryYogurt.setDescripString("요거트 : 리얼 유산균 요거트 / 과일 : 딸기 과육 시럽 / 특징 : 유산균이 살아있는 리얼 요거트와 상큼하고 풍부한 딸기 과육이 듬뿍 씹히는 패밀리 블렌디드");
            strawberryYogurt.setManufacturer("Starbucks");
            strawberryYogurt.setCategoryString("Blended");
            strawberryYogurt.setUnitsInStock(35);
            strawberryYogurt.setConditionString("Ice Only");
            strawberryYogurt.setFilenameString("https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=500");
            listOfProducts.add(strawberryYogurt);

            // 14. 시그니처 핫 초콜릿
            Product hotchoco = new Product("P1011", "시그니처 초콜릿", 5700);
            hotchoco.setDescripString("베이스 : 코코아 분말, 스팀 밀크 / 토핑 : 휩 크림, 코코아 파우더 / 특징 : 깊고 진한 프리미엄 초콜릿 시럽과 따뜻한 우유가 만나 오랫동안 사랑받는 달콤함");
            hotchoco.setManufacturer("Starbucks");
            hotchoco.setCategoryString("Chocolate");
            hotchoco.setUnitsInStock(55);
            hotchoco.setConditionString("Hot/Ice");
            hotchoco.setFilenameString("https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=500");
            listOfProducts.add(hotchoco);

            // 15. 에스프레소 콘 파나
            Product conpanna = new Product("P1012", "에스프레소 콘 파나", 4200);
            conpanna.setDescripString("에스프레소 : 1 샷 / 토핑 : 휘핑크림 / 특징 : 데미타세 잔에 담긴 강렬한 솔로 에스프레소 샷 위에 달콤하고 차가운 휘핑크림을 얹은 쌉쌀달콤한 음료");
            conpanna.setManufacturer("Starbucks");
            conpanna.setCategoryString("Espresso");
            conpanna.setUnitsInStock(30);
            conpanna.setConditionString("Hot");
            conpanna.setFilenameString("https://images.unsplash.com/photo-1606791405792-1004f1718d0c?w=500");
            listOfProducts.add(conpanna);

            // 16. 바닐라 크림 콜드 브루
            Product vanillacold = new Product("P1013", "바닐라 크림 콜드 브루", 5800);
            vanillacold.setDescripString("시럽 : 바닐라 시럽 / 우유 : 하프 앤 하프 밀크 / 특징 : 콜드 브루 커피 위에 부드러운 바닐라 크림을 올려 깔끔하면서도 은은한 달콤함이 도는 인기 음료");
            vanillacold.setManufacturer("Starbucks");
            vanillacold.setCategoryString("ColdBrew");
            vanillacold.setUnitsInStock(75);
            vanillacold.setConditionString("Ice Only");
            vanillacold.setFilenameString("https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=500");
            listOfProducts.add(vanillacold);

            // 17. 유자 민트 티
            Product yujamint = new Product("P1014", "유자 민트 티", 5900);
            yujamint.setDescripString("베이스 : 국내산 고흥 유자 / 티 : 민트 블렌드 티 / 특징 : 달콤한 고흥 유자청과 알싸하고 개운한 민트 티가 만나 머릿속까지 상쾌하게 해주는 티 음료");
            yujamint.setManufacturer("Starbucks");
            yujamint.setCategoryString("Teavana");
            yujamint.setUnitsInStock(60);
            yujamint.setConditionString("Hot/Ice");
            yujamint.setFilenameString("https://images.unsplash.com/photo-1597481499750-3e6b22637e12?w=500");
            listOfProducts.add(yujamint);

            // 18. 민트 초콜릿 칩 블렌디드
            Product mintchoco = new Product("P1015", "민트 초콜릿 칩 블렌디드", 6300);
            mintchoco.setDescripString("베이스 : 민트 초코 시럽 / 토핑 : 돌체 휘핑, 통 초콜릿 칩 / 특징 : 상쾌한 민트와 달콤한 초콜릿 칩이 시원하게 블렌딩되어 민초단 취향을 저격하는 음료");
            mintchoco.setManufacturer("Starbucks");
            mintchoco.setCategoryString("Blended");
            mintchoco.setUnitsInStock(40);
            mintchoco.setConditionString("Ice Only");
            mintchoco.setFilenameString("https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=500");
            listOfProducts.add(mintchoco);
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