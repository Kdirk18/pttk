package model;

import java.util.Date;

public class SupplierPayment {
    private int supplierPaymentId;
    private int importInvoiceId;
    private int supplierId;
    private Date paymentDate;
    private double amount;
    private String paymentMethod;
    private String paymentStatus;
    private String note;

    public int getSupplierPaymentId() { return supplierPaymentId; }
    public void setSupplierPaymentId(int supplierPaymentId) { this.supplierPaymentId = supplierPaymentId; }

    public int getImportInvoiceId() { return importInvoiceId; }
    public void setImportInvoiceId(int importInvoiceId) { this.importInvoiceId = importInvoiceId; }

    public int getSupplierId() { return supplierId; }
    public void setSupplierId(int supplierId) { this.supplierId = supplierId; }

    public Date getPaymentDate() { return paymentDate; }
    public void setPaymentDate(Date paymentDate) { this.paymentDate = paymentDate; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
}