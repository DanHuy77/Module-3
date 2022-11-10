package model;

public class Facility {
    private int id;
    private String name;
    private int area;
    private double rentalCost;
    private int maxUser;
    private String roomStandard;
    private String otherDescription;
    private double poolArea;
    private int floorNumber;
    private String freeService;
    private int rentalTypeCode;
    private int facilityTypeCode;
    private String rentalTypeName;
    private String facilityTypeName;

    public Facility(String name, int area, double rentalCost, int maxUser, String roomStandard, String otherDescription, double poolArea, int floorNumber, int rentalTypeCode, int facilityTypeCode) {
        this.name = name;
        this.area = area;
        this.rentalCost = rentalCost;
        this.maxUser = maxUser;
        this.roomStandard = roomStandard;
        this.otherDescription = otherDescription;
        this.poolArea = poolArea;
        this.floorNumber = floorNumber;
        this.rentalTypeCode = rentalTypeCode;
        this.facilityTypeCode = facilityTypeCode;
    }

    public Facility(String name, int area, double rentalCost, int maxUser, String roomStandard, String otherDescription, double poolArea, int floorNumber, String freeService, int rentalTypeCode, int facilityTypeCode, String rentalTypeName, String facilityTypeName) {
        this.name = name;
        this.area = area;
        this.rentalCost = rentalCost;
        this.maxUser = maxUser;
        this.roomStandard = roomStandard;
        this.otherDescription = otherDescription;
        this.poolArea = poolArea;
        this.floorNumber = floorNumber;
        this.freeService = freeService;
        this.rentalTypeCode = rentalTypeCode;
        this.facilityTypeCode = facilityTypeCode;
        this.rentalTypeName = rentalTypeName;
        this.facilityTypeName = facilityTypeName;
    }

    public Facility(int id, String name, int area, double rentalCost, int maxUser, String roomStandard, String otherDescription, double poolArea, int floorNumber, String freeService, String rentalTypeName, String facilityTypeName) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.rentalCost = rentalCost;
        this.maxUser = maxUser;
        this.roomStandard = roomStandard;
        this.otherDescription = otherDescription;
        this.poolArea = poolArea;
        this.floorNumber = floorNumber;
        this.freeService = freeService;
        this.rentalTypeName = rentalTypeName;
        this.facilityTypeName = facilityTypeName;
    }

    public Facility(String name, int area, double rentalCost, int maxUser, String roomStandard, String otherDescription, double poolArea, int floorNumber, String freeService, int rentalTypeCode, int facilityTypeCode) {
        this.name = name;
        this.area = area;
        this.rentalCost = rentalCost;
        this.maxUser = maxUser;
        this.roomStandard = roomStandard;
        this.otherDescription = otherDescription;
        this.poolArea = poolArea;
        this.floorNumber = floorNumber;
        this.freeService = freeService;
        this.rentalTypeCode = rentalTypeCode;
        this.facilityTypeCode = facilityTypeCode;
    }

    public Facility(int id, String name, int area, double rentalCost, int maxUser, String roomStandard, String otherDescription, double poolArea, int floorNumber, String freeService, int rentalTypeCode, int facilityTypeCode) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.rentalCost = rentalCost;
        this.maxUser = maxUser;
        this.roomStandard = roomStandard;
        this.otherDescription = otherDescription;
        this.poolArea = poolArea;
        this.floorNumber = floorNumber;
        this.freeService = freeService;
        this.rentalTypeCode = rentalTypeCode;
        this.facilityTypeCode = facilityTypeCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getRentalCost() {
        return rentalCost;
    }

    public void setRentalCost(double rentalCost) {
        this.rentalCost = rentalCost;
    }

    public int getMaxUser() {
        return maxUser;
    }

    public void setMaxUser(int maxUser) {
        this.maxUser = maxUser;
    }

    public String getRoomStandard() {
        return roomStandard;
    }

    public void setRoomStandard(String roomStandard) {
        this.roomStandard = roomStandard;
    }

    public String getOtherDescription() {
        return otherDescription;
    }

    public void setOtherDescription(String otherDescription) {
        this.otherDescription = otherDescription;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    public String getFreeService() {
        return freeService;
    }

    public void setFreeService(String freeService) {
        this.freeService = freeService;
    }

    public int getRentalTypeCode() {
        return rentalTypeCode;
    }

    public void setRentalTypeCode(int rentalTypeCode) {
        this.rentalTypeCode = rentalTypeCode;
    }

    public int getFacilityTypeCode() {
        return facilityTypeCode;
    }

    public void setFacilityTypeCode(int facilityTypeCode) {
        this.facilityTypeCode = facilityTypeCode;
    }

    public String getRentalTypeName() {
        return rentalTypeName;
    }

    public void setRentalTypeName(String rentalTypeName) {
        this.rentalTypeName = rentalTypeName;
    }

    public String getFacilityTypeName() {
        return facilityTypeName;
    }

    public void setFacilityTypeName(String facilityTypeName) {
        this.facilityTypeName = facilityTypeName;
    }
}
