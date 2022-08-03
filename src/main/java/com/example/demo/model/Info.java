package com.example.demo.model;

public class Info {
    private Customer customer;
    private Order  order;

    public Info() {
    }

    public Info(Customer customer, Order order) {
        this.customer = customer;
        this.order = order;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "InformationRepository{" +
                "customer=" + customer +
                ", order=" + order +
                '}';
    }
}
