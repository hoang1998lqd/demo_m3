package com.example.demo.model;

public class Item {
    private static int ID_ITEM = 1;
    private int id;
    private Product product;
    private int quantity;
    private int price;

    public Item() {
    }

    public Item(int id, Product product, int quantity, int price) {
        this.id = ID_ITEM++;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
