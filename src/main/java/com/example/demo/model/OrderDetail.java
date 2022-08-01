package com.example.demo.model;

public class OrderDetail {
    private Order order;
    private Product product;
    private int quantity;
    private int total_price;

    public OrderDetail() {
    }


    // Dùng để tạo đối tượng là gồm có thông tin sản phẩm, số lượng và tổng giá tiền cho sản phẩm đó
    public OrderDetail(Order order, Product product, int quantity, int total_price) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.total_price = total_price;
    }


    // Đẩy dữ liệu vào database
    public OrderDetail(Order order, Product product, int quantity) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
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

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }
}
