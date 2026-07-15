package dto;

import java.io.Serializable;

public class Product implements Serializable {

    private String productIDString;
    private String nameString;
    private int unitPrice;
    private String descripString;
    private String manufacturer;    
    private String categoryString;
    private long unitsInStock;      
    private String conditionString;
    private String filenameString;

    // 1. 기본 생성자
    public Product() {
        super();
    }

    // 2. ID, 이름, 가격을 받는 생성자
    public Product(String productIDString, String nameString, int unitPrice) {
        super();
        this.productIDString = productIDString;
        this.nameString = nameString;
        this.unitPrice = unitPrice;
    }

    // ==========================================
    // 3. Getter & Setter (게터 & 세터)
    // ==========================================

    public String getProductIDString() {
        return productIDString;
    }

    public void setProductIDString(String productIDString) {
        this.productIDString = productIDString;
    }

    public String getNameString() {
        return nameString;
    }

    public void setNameString(String nameString) {
        this.nameString = nameString;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getDescripString() {
        return descripString;
    }

    public void setDescripString(String descripString) {
        this.descripString = descripString;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getCategoryString() {
        return categoryString;
    }

    public void setCategoryString(String categoryString) {
        this.categoryString = categoryString;
    }

    public long getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitsInStock(long unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

    public String getConditionString() {
        return conditionString;
    }

    public void setConditionString(String conditionString) {
        this.conditionString = conditionString;
    }

    public String getFilenameString() {
        return filenameString;
    }

    public void setFilenameString(String filenameString) {
        this.filenameString = filenameString;
    }
}