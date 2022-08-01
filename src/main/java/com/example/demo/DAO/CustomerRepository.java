package com.example.demo.DAO;

import com.example.demo.connection.connectMySQL;
import com.example.demo.model.Customer;
import com.example.demo.model.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomerRepository implements ICRUD<Customer> {
    private  final RoleRepository roleRepository = new RoleRepository();
    private final connectMySQL  mySQL = new connectMySQL();
    private final String SELECT_ALL_CUSTOMER =  "select * from customer";
    private final String SELECT_CUSTOMER_BY_ID =  "select * from customer where id = ?";
    private final String DELETE_CUSTOMER_BY_ID =  "delete * from customer where id = ?";
    private final String INSERT_CUSTOMER  =  "insert into customer(account, password, name, phone, email, address)" +
            "value(?,?,?,?,?,?)";
    private final String INSERT_CUSTOMER_ADMIN  =  "insert into customer(account, password, name, phone, email, address,role_id)" +
            "value(?,?,?,?,?,?,?)";
    private final String UPDATE_CUSTOMER_BY_ID  = "update customer set password = ?, name = ?, phone = ?," +
            "email = ?, address = ? where id = ?";
    private final String SELECT_ACCOUNT =  "  select * from customer where account = ?";
    private final String SELECT_EMAIL =  "  select * from customer where email = ?";
    private final String SELECT_PHONE =  "  select * from customer where phone = ?";

    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    @Override
    public ArrayList<Customer> findAll() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            connection = mySQL.getConnection();
            statement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                // truyền giá trị vào dấu ? trong câu lệnh SQL
                int id = resultSet.getInt("id");
                Customer customer = getCustomer(id,resultSet);
                customers.add(customer);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return customers;
    }


    // Tạo thông tin cho người dùng
    @Override
    public void create(Customer customer) {
        try {
            getStatement(customer, INSERT_CUSTOMER);
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    // Tạo thông tin cho admin
    public void createAdmin(Customer customer, Role role){
        try {
            getStatement(customer, INSERT_CUSTOMER_ADMIN);
            statement.setString(6,customer.getAddress());
            statement.setInt(7,customer.getRole_id().getId());
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    // Tránh trùng lặp code nên đã dùng Refactor để tạo ra các dòng code giống nhau
    private void getStatement(Customer customer, String insert_customer_admin) throws SQLException {
        connection = mySQL.getConnection();
        statement = connection.prepareStatement(insert_customer_admin);
        statement.setString(1,customer.getAccount());
        statement.setString(2,customer.getPassword());
        statement.setString(3,customer.getName());
        statement.setString(4,customer.getPhone());
        statement.setString(5,customer.getEmail());
        statement.setString(6,customer.getAddress());
    }

    @Override
    public void update(Customer customer) throws SQLException {
        connection = mySQL.getConnection();
        statement = connection.prepareStatement(UPDATE_CUSTOMER_BY_ID);
//        "update customer set password = ?, name = ?, phone = ?," + "email = ?, address = ? where id = ?";
        statement.setString(1,customer.getPassword());
        statement.setString(2,customer.getName());
        statement.setString(3,customer.getPhone());
        statement.setString(4,customer.getEmail());
        statement.setString(5,customer.getAddress());
        statement.setInt(6,customer.getId());
        statement.executeUpdate();
    }

    @Override
    public void deleteById(int id) throws SQLException {
        connection = mySQL.getConnection();
        statement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
        try {
            statement.setInt(1,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public Customer findById(int id) throws SQLException {
        connection = mySQL.getConnection();
        statement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
        // dòng lệnh đó được truyền vào dấu ? trong câu lệnh SQL
        statement.setInt(1,id);
        resultSet = statement.executeQuery();
        while (resultSet.next()){
            return getCustomer(id,resultSet);
        }
        return null;
    }

    private Customer getCustomer(int id, ResultSet resultSet) throws SQLException {
         String account = resultSet.getString("account");
         String password = resultSet.getString("password");
         String name = resultSet.getString("name");
         String phone = resultSet.getString("phone");
         String email = resultSet.getString("email");
         String address = resultSet.getString("address");
         int role_id = resultSet.getInt("role_id");
         Role role = roleRepository.findById(role_id);
         return new Customer(id,account,password,name,phone,email,address,role);
    }

    public Customer getCustomerByAccount(String account){
        return getCustomerByTagName(account, SELECT_ACCOUNT);
    }

    public Customer getCustomerByEmail(String email){
        return getCustomerByTagName(email, SELECT_EMAIL);
    }

    public Customer getCustomerByPhone(String phone){
        return getCustomerByTagName(phone, SELECT_PHONE);
    }

    private Customer getCustomerByTagName(String phone, String select_phone) {
        try {
            connection = mySQL.getConnection();
            statement = connection.prepareStatement(select_phone);
            statement.setString(1,phone);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                return getCustomer(id,resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
