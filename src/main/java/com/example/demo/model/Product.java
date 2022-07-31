package com.example.demo.model;


public class Product {
    private int id;
    private String name;
    private int price;
    private String description;
    private String img;
    private int amount;
    private Category category;
    private int status;
    private int discount;
    private Brand brand;

    public Product() {
    }

    public Product(int id, String name, int price, String description, String img,
                   int amount, Category category, int status, int discount, Brand brand) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.img = img;
        this.amount = amount;
        this.category = category;
        this.status = status;
        this.discount = discount;
        this.brand = brand;
    }

    public Product(String name, int price, String description, String img, int amount, Category category, int discount, Brand brand) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.img = img;
        this.amount = amount;
        this.category = category;
        this.discount = discount;
        this.brand = brand;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }
}