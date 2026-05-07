package model;

public class SparePart {
    private int partId;
    private String partName;
    private String description;
    private String unit;
    private double salePrice;
    private int stockQuantity;
    private String partStatus;

    public SparePart() {
    }

    public SparePart(int partId, String partName, String description,
                     String unit, double salePrice, int stockQuantity, String partStatus) {
        this.partId = partId;
        this.partName = partName;
        this.description = description;
        this.unit = unit;
        this.salePrice = salePrice;
        this.stockQuantity = stockQuantity;
        this.partStatus = partStatus;
    }

    public int getPartId() { return partId; }
    public void setPartId(int partId) { this.partId = partId; }

    public String getPartName() { return partName; }
    public void setPartName(String partName) { this.partName = partName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public double getSalePrice() { return salePrice; }
    public void setSalePrice(double salePrice) { this.salePrice = salePrice; }

    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

    public String getPartStatus() { return partStatus; }
    public void setPartStatus(String partStatus) { this.partStatus = partStatus; }
}