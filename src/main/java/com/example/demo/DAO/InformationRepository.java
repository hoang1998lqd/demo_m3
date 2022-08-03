package com.example.demo.DAO;

import com.example.demo.connection.connectMySQL;
import com.example.demo.model.Customer;
import com.example.demo.model.Info;
import com.example.demo.model.Order;

import java.sql.*;
import java.util.ArrayList;

public class InformationRepository {
    private final String SELECT_VIEW = "select * from bill";
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    private final com.example.demo.connection.connectMySQL connectMySQL = new connectMySQL();

    private final String DELETE_ORDER = "call deleteOrderById(?)";


    public ArrayList<Info> findAll () throws SQLException {
        ArrayList<Info>  infos = new ArrayList<>();
        connection = connectMySQL.getConnection();
        statement = connection.prepareStatement(SELECT_VIEW);
        resultSet = statement.executeQuery();
        while (resultSet.next()){
            int id_customer = resultSet.getInt(1);
            String name = resultSet.getString(2);
            String phone = resultSet.getString(3);
            String address = resultSet.getString(4);
            String email = resultSet.getString(5);
            int idOrder = resultSet.getInt(6);
            java.sql.Date date_order = resultSet.getDate(7);
            Date date_ship = resultSet.getDate(8);
            String address_ship = resultSet.getString(9);
            int status = resultSet.getInt(10);
            Customer customer = new Customer(id_customer,name,phone,email,address);
            Order order =new Order(idOrder, date_order, date_ship,address_ship,status);
            Info info = new Info(customer,order);
            infos.add(info);
        }
        return infos;
    }

    public void deleteOrder(int id){
        try {
            Connection connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

}
