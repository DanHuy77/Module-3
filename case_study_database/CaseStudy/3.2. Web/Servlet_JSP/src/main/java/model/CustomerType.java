package model;

public class CustomerType {
    private int customerTypeCode;
    private String customerTypeName;

    public CustomerType() {
    }

    public CustomerType(int customerTypeCode, String customerTypeName) {
        this.customerTypeCode = customerTypeCode;
        this.customerTypeName = customerTypeName;
    }

    public int getCustomerTypeCode() {
        return customerTypeCode;
    }

    public void setCustomerTypeCode(int customerTypeCode) {
        this.customerTypeCode = customerTypeCode;
    }

    public String getCustomerTypeName() {
        return customerTypeName;
    }

    public void setCustomerTypeName(String customerTypeName) {
        this.customerTypeName = customerTypeName;
    }
}
