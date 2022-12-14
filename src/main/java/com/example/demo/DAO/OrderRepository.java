package com.example.demo.DAO;

import com.example.demo.connection.connectMySQL;
import com.example.demo.model.*;
import com.example.demo.service.CustomerService;
import com.example.demo.service.ProductService;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class OrderRepository {
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    private final connectMySQL connectMySQL = new connectMySQL();
    private final String SELECT_ORDERS_BY_ID = "select * from orders where id = ?";
    private final String SELECT_ALL_ORDERS = "select * from orders";
    private final String INSERT_ORDERS = "insert into orders(customer_id, date_order, date_ship, address, status, note)" +
            "value(?,?,?,?,?,?)";

    private final String INSERT_ORDERS_NOT_NOTE = "insert into orders(customer_id, date_order, date_ship, address, status)" +
            "value(?,?,?,?,?)";
    private final String UPDATE_ORDERS = "update orders set date_ship = ?, address = ?, status = ? , note = ?" + " where id = ?";
    private final String DELETE_ORDERS_BY_ID = "delete from orders where id = ?";

    private final String SELECT_ORDER_LAST = "select id from orders where id = (select max(id)from orders)";

    private final String INSERT_ORDER_DETAIL = "INSERT INTO order_detail VALUES (?,?,?)";

    private final CustomerService customerService = new CustomerService();
    private Order getOrders(int id, ResultSet resultSet) throws SQLException {
        int customer_id = resultSet.getInt("customer_id");
        Customer customer = customerService.findById(customer_id);
        Date date_order = resultSet.getDate("date_order");
        Date date_ship = resultSet.getDate("date_ship");
        String address = resultSet.getString("address");
        int status = resultSet.getInt("status");
        String note = resultSet.getString("note");
        return new Order(id,customer,date_order,date_ship,address,status,note);

    }
        public ArrayList<Order> findAll() {
        ArrayList<Order> orders1 = new ArrayList<>();
        try {
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(SELECT_ALL_ORDERS);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Order orders = getOrders(id, resultSet);
                orders1.add(orders);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return orders1;
    }
    public Order findById(int id) {
        try {
            Connection connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDERS_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return getOrders(id, resultSet);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public void create(Order order) {
        try {
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(INSERT_ORDERS);
            statement.setInt(1,order.getCustomer().getId());
            statement.setDate(2,order.getDate_order());
            statement.setDate(3,order.getDate_ship());
            statement.setString(4,order.getAddress());
            statement.setInt(5,order.getStatus());
            statement.setString(6,order.getNote());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public void deleteById(int id) {
        try {
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(DELETE_ORDERS_BY_ID);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());;
        }
    }

    public void update(Order order) {
        try {
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(UPDATE_ORDERS);
            statement.setDate(1,order.getDate_ship());
            statement.setString(2,order.getAddress());
            statement.setInt(3,order.getStatus());
            statement.setString(4,order.getNote());
            statement.setInt(5,order.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    // L???y ra th??ng tin Order v???a m???i ???????c t???o
    // Ngay khi v???a t???o v?? th??m (Click v??o ?????t h??ng th??) Order v??o database th?? m??nh s??? l???y lu??n ID ???? v??o
    // trong order detail.
    public void addOrder(Customer customer, Cart cart, String note){
        LocalDate date = LocalDate.now();
        Date date_order = Date.valueOf(date);
        LocalDate localDate = LocalDate.now();
        LocalDate dateNext = localDate.plusDays(2);
        Date date_ship = Date.valueOf(dateNext);

        try{
            connection = connectMySQL.getConnection();
            statement = connection.prepareStatement(INSERT_ORDERS);
            statement.setInt(1,customer.getId());
            statement.setDate(2,date_order);
            statement.setDate(3,date_ship);
            statement.setString(4,customer.getAddress());
            statement.setInt(5,0);
            statement.setString(6,note);
            statement.executeUpdate();
            statement = connection.prepareStatement(SELECT_ORDER_LAST);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int order_id = resultSet.getInt(1);
                for (Item item : cart.getItems()) {
                    statement = connection.prepareStatement(INSERT_ORDER_DETAIL);
                    statement.setInt(1, order_id);
                    statement.setInt(2,item.getProduct().getId());
                    statement.setInt(3,item.getQuantity());
                    int quantity = item.getQuantity();
                    int amount = item.getProduct().getAmount() - quantity;
                    Product product = item.getProduct();
                    product.setAmount(amount);
                    ProductService productService = new ProductService();
                    productService.update(product);
                    statement.executeUpdate();
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

    }


}
