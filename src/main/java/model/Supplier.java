package model;

public class Supplier {
    private int supplierId;
    private String supplierName;
    private String phoneNumber;
    private String email;
    private String address;
    private String taxCode;
    private String supplierStatus;

    public Supplier() {
    }

    public Supplier(int supplierId, String supplierName, String phoneNumber,
                    String email, String address, String taxCode, String supplierStatus) {
        this.supplierId = supplierId;
        this.supplierName = supplierName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.taxCode = taxCode;
        this.supplierStatus = supplierStatus;
    }

    public int getSupplierId() { return supplierId; }
    public void setSupplierId(int supplierId) { this.supplierId = supplierId; }

    public String getSupplierName() { return supplierName; }
    public void setSupplierName(String supplierName) { this.supplierName = supplierName; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getTaxCode() { return taxCode; }
    public void setTaxCode(String taxCode) { this.taxCode = taxCode; }

    public String getSupplierStatus() { return supplierStatus; }
    public void setSupplierStatus(String supplierStatus) { this.supplierStatus = supplierStatus; }
}