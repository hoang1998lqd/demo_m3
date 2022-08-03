package com.example.demo.DAO;

import com.example.demo.connection.connectMySQL;
import com.example.demo.model.Customer;
import com.example.demo.model.Order;
import com.example.demo.service.CustomerService;

import java.sql.*;
import java.util.ArrayList;

public class OrderDetailRepository {
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    private final connectMySQL connectMySQL = new connectMySQL();
    private final String SELECT_VIEW = "select * from bill";
    private final String SELECT_ORDERS_BY_ID = "select * from order_detail where id_order =?";

    private final CustomerService customerService = new CustomerService();

    private Order getOrderDetail(int id, ResultSet resultSet) throws SQLException {
        int id_customer = resultSet.getInt("id_customer");
        Customer customer = customerService.findById(id_customer);
        Date date_order = resultSet.getDate("date_order");
        Date date_ship = resultSet.getDate("date_ship");
        String address = resultSet.getString("address");
        int status = resultSet.getInt("status");
        String note = resultSet.getString("note");
        return new Order(id,customer,date_order,date_ship,address,status,note);

    }

    public ArrayList<Order> findAll() {
       ArrayList<Order> orders = new ArrayList<>();
       try {
           connection = connectMySQL.getConnection();
           statement = connection.prepareStatement(SELECT_VIEW);
           resultSet = statement.executeQuery();
           while (resultSet.next()) {
               int id = resultSet.getInt("id");
               Order orders1 = getOrderDetail(id, resultSet);
               orders.add(orders1);
           }
       } catch (SQLException e) {
           System.err.println(e.getMessage());
       }
        return orders;
       }


    public Order findById(int id) throws SQLException {
        try {
            Connection connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDERS_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return getOrderDetail(id, resultSet);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
}
