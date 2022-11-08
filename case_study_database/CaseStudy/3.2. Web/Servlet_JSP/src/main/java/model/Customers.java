package model;

import java.sql.Date;

public class Customers {
    private int id;
    private String name;
    private java.sql.Date birthday;
    private boolean gender;
    private String idNumber;
    private String phoneNumber;
    private String email;
    private String address;
    private int customerTypeCode;

    public Customers() {
    }

    public Customers(String name, Date birthday, boolean gender, String idNumber, String phoneNumber, String email, String address, int customerTypeCode) {
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.idNumber = idNumber;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.customerTypeCode = customerTypeCode;
    }

    public Customers(int id, String name, Date birthday, boolean gender, String idNumber, String phoneNumber, String email, String address, int customerTypeCode) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.idNumber = idNumber;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.customerTypeCode = customerTypeCode;
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

    public java.sql.Date getBirthday() {
        return birthday;
    }

    public void setBirthday(java.sql.Date birthday) {
        this.birthday = birthday;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCustomerTypeCode() {
        return customerTypeCode;
    }

    public void setCustomerTypeCode(int customerTypeCode) {
        this.customerTypeCode = customerTypeCode;
    }
}
