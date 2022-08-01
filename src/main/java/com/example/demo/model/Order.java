package com.example.demo.model;

import java.sql.Date;
import java.time.LocalDate;

public class Order {
    private int id;
    private  Customer customer;
    private Date date_order;
    private Date date_ship;
    private String address;
    private int status;
    private String note;
    private int total_price;

    public Order() {
    }


    // Full tham số để đón giá trị trả về từ database

    public Order(int id, Customer customer, Date date_order, Date date_ship, String address, int status, String note) {
        this.id = id;
        this.customer = customer;
        this.date_order = date_order;
        this.date_ship = date_ship;
        this.address = address;
        this.status = status;
        this.note = note;
    }

    // chức năng chính là để hiển thị thay cho class Bill mà k cẩn phải khởi tạo nó.
    public Order(int id, Customer customer, Date date_order, Date date_ship,
                 String address, int status, String note, int total_price) {
        this.id = id;
        this.customer = customer;
        this.date_order = date_order;
        this.date_ship = date_ship;
        this.address = address;
        this.status = status;
        this.note = note;
        this.total_price = total_price;
    }

    // Không có: ID, và total_price có chức năng dùng để đẩy dữ liệu vào database
    public Order(Customer customer, Date date_order, Date date_ship,
                 String address, int status, String note) {
        this.customer = customer;
        this.date_order = date_order;
        this.date_ship = date_ship;
        this.address = address;
        this.status = status;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getDate_order() {
        return date_order;
    }

    public void setDate_order(Date date_order) {
        this.date_order = date_order;
    }

    public Date getDate_ship() {
        return date_ship;
    }

    public void setDate_ship(Date date_ship) {
        this.date_ship = date_ship;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }
}
