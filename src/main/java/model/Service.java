package model;

public class Service {
    private int serviceId;
    private String serviceName;
    private String description;
    private int estimatedDuration;
    private double basePrice;
    private String serviceStatus;

    public Service() {
    }

    public Service(int serviceId, String serviceName, String description,
                   int estimatedDuration, double basePrice, String serviceStatus) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.description = description;
        this.estimatedDuration = estimatedDuration;
        this.basePrice = basePrice;
        this.serviceStatus = serviceStatus;
    }

    public int getServiceId() { return serviceId; }
    public void setServiceId(int serviceId) { this.serviceId = serviceId; }

    public String getServiceName() { return serviceName; }
    public void setServiceName(String serviceName) { this.serviceName = serviceName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getEstimatedDuration() { return estimatedDuration; }
    public void setEstimatedDuration(int estimatedDuration) { this.estimatedDuration = estimatedDuration; }

    public double getBasePrice() { return basePrice; }
    public void setBasePrice(double basePrice) { this.basePrice = basePrice; }

    public String getServiceStatus() { return serviceStatus; }
    public void setServiceStatus(String serviceStatus) { this.serviceStatus = serviceStatus; }
}