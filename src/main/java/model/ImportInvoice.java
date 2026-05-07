package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ImportInvoice {
    private int importInvoiceId;
    private int supplierId;
    private String invoiceNumber;
    private Date invoiceDate;
    private double totalAmount;
    private String paymentStatus;
    private String note;
    private List<ImportInvoiceItem> items = new ArrayList<>();

    public int getImportInvoiceId() { return importInvoiceId; }
    public void setImportInvoiceId(int importInvoiceId) { this.importInvoiceId = importInvoiceId; }

    public int getSupplierId() { return supplierId; }
    public void setSupplierId(int supplierId) { this.supplierId = supplierId; }

    public String getInvoiceNumber() { return invoiceNumber; }
    public void setInvoiceNumber(String invoiceNumber) { this.invoiceNumber = invoiceNumber; }

    public Date getInvoiceDate() { return invoiceDate; }
    public void setInvoiceDate(Date invoiceDate) { this.invoiceDate = invoiceDate; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }

    public List<ImportInvoiceItem> getItems() { return items; }
    public void setItems(List<ImportInvoiceItem> items) { this.items = items; }

    public void addItem(ImportInvoiceItem item) {
        items.add(item);
        calculateTotal();
    }

    public void calculateTotal() {
        totalAmount = 0;
        for (ImportInvoiceItem item : items) {
            totalAmount += item.getLineAmount();
        }
    }
}