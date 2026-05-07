package model;

public class ImportInvoiceItem {
    private int importInvoiceItemId;
    private int importInvoiceId;
    private int partId;
    private String partName;
    private String unit;
    private int quantity;
    private double unitPrice;
    private double lineAmount;

    public ImportInvoiceItem() {
    }

    public ImportInvoiceItem(int partId, String partName, String unit, int quantity, double unitPrice) {
        this.partId = partId;
        this.partName = partName;
        this.unit = unit;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.lineAmount = quantity * unitPrice;
    }

    public int getImportInvoiceItemId() { return importInvoiceItemId; }
    public void setImportInvoiceItemId(int importInvoiceItemId) { this.importInvoiceItemId = importInvoiceItemId; }

    public int getImportInvoiceId() { return importInvoiceId; }
    public void setImportInvoiceId(int importInvoiceId) { this.importInvoiceId = importInvoiceId; }

    public int getPartId() { return partId; }
    public void setPartId(int partId) { this.partId = partId; }

    public String getPartName() { return partName; }
    public void setPartName(String partName) { this.partName = partName; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.lineAmount = this.quantity * this.unitPrice;
    }

    public double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
        this.lineAmount = this.quantity * this.unitPrice;
    }

    public double getLineAmount() { return lineAmount; }
    public void setLineAmount(double lineAmount) { this.lineAmount = lineAmount; }
}