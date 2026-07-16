// validation.js
function validateForm() {
    var form = document.newProduct;

    if (!form) {
        return false;
    }
    
    // 1. 상품 코드 검증 (P/p로 시작하고 뒤에 숫자만 오면 자릿수 상관없이 통과!)
    var productId = form.productId.value.trim();
    var regExpId = /^[pP][0-9]+$/; 
    if (!regExpId.test(productId)) {
        alert("[상품 코드]\n반드시 영어 'p' 또는 'P'로 시작하고 뒤이어 숫자만 입력해 주세요.\n예시: P1234");
        form.productId.select();
        form.productId.focus();
        return false; // ❌ 서버 전송 강제 중단
    }

    // 2. 상품명 검증 (최소 2자 ~ 최대 50자)
    var name = form.name.value.trim();
    if (name.length < 2 || name.length > 50) {
        alert("[상품명]\n최소 2자에서 50자 이하로 입력하세요.");
        form.name.select();
        form.name.focus();
        return false; // ❌ 서버 전송 강제 중단
    }

    // 3. 상품 가격 검증 (숫자만, 0원 및 음수 절대 불가!)
    var unitPrice = form.unitPrice.value.trim();
    if (unitPrice.length == 0 || isNaN(unitPrice)) {
        alert("[가격]\n숫자만 입력하세요.");
        form.unitPrice.select();
        form.unitPrice.focus();
        return false; // ❌ 서버 전송 강제 중단
    }
    if (parseInt(unitPrice) <= 0) {
        alert("[가격]\n가격을 1원 이상의 올바른 숫자로 입력해 주세요. (0원 및 음수는 입력할 수 없습니다.)");
        form.unitPrice.select();
        form.unitPrice.focus();
        return false; // ❌ 서버 전송 강제 중단
    }

    // 4. 재고 수량 검증 (숫자만, 음수 불가)
    var unitsInStock = form.unitsInStock.value.trim();
    if (unitsInStock.length == 0 || isNaN(unitsInStock)) {
        alert("[재고 수량]\n숫자만 입력하세요.");
        form.unitsInStock.select();
        form.unitsInStock.focus();
        return false; // ❌ 서버 전송 강제 중단
    }
    if (parseInt(unitsInStock) < 0) {
        alert("[재고 수량]\n음수는 입력할 수 없습니다.");
        form.unitsInStock.select();
        form.unitsInStock.focus();
        return false; // ❌ 서버 전송 강제 중단
    }

    // 5. 분류(Category) 검증
    var category = form.category.value.trim();
    if (category === "") {
        alert("[분류]\n분류(카테고리)를 입력해 주세요.");
        form.category.focus();
        return false; // ❌ 서버 전송 강제 중단
    }

    // 6. 상세 설명 검증 (최소 5자 이상)
    var description = form.description.value.trim();
    if (description.length < 5) {
        alert("[상세 설명]\n상세 설명을 최소 5자 이상 입력해 주세요.");
        form.description.select();
        form.description.focus();
        return false; // ❌ 서버 전송 강제 중단
    }

    // 7. 이미지 파일 필수 업로드 및 확장자 검증 🚀 [철벽 락 장치]
    var productImage = form.productImage.value; // 선택한 파일명 가져오기
    if (!productImage || productImage.trim() === "") {
        alert("[상품 이미지]\n상품 이미지를 필수적으로 등록해야 합니다!");
        form.productImage.focus();
        return false; // ❌ 여기서 강제로 가로막음
    }
    
    var regExpImg = /\.(jpg|jpeg|png|gif)$/i; 
    if (!regExpImg.test(productImage)) {
        alert("[상품 이미지]\n이미지 파일(jpg, jpeg, png, gif)만 업로드할 수 있습니다.");
        form.productImage.focus();
        return false; // ❌ 서버 전송 강제 중단
    }

    // 8. 제조사 검증
    var manufacturer = form.manufacturer.value.trim();
    if (manufacturer === "") {
        alert("[제조사]\n제조사를 입력해 주세요.");
        form.manufacturer.focus();
        return false; // ❌ 서버 전송 강제 중단
    }
    
    // 모든 관문을 통과했다면 정상 제출(true)을 반환합니다.
    return true;
}