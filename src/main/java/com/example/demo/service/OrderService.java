package com.example.demo.service;

import com.example.demo.DAO.ICRUD;
import com.example.demo.DAO.OrderRepository;
import com.example.demo.model.Cart;
import com.example.demo.model.Customer;
import com.example.demo.model.Order;

import java.sql.SQLException;
import java.util.ArrayList;

public class OrderService implements ICRUD<Order> {
    private final OrderRepository orderRepository = new OrderRepository();
    @Override
    public ArrayList<Order> findAll() {
        return orderRepository.findAll();
    }

    @Override
    public void create(Order order) {
        orderRepository.create(order);
    }

    @Override
    public void update(Order order) throws SQLException {
        orderRepository.update(order);
    }

    @Override
    public void deleteById(int id) throws SQLException {
        orderRepository.deleteById(id);
    }

    @Override
    public Order findById(int id) throws SQLException {
        return orderRepository.findById(id);
    }

    //Create kèm theo người dùng và sản phẩm
    public void addOrder(Customer customer, Cart cart, String note){
        orderRepository.addOrder(customer,cart,note);
    }
}
