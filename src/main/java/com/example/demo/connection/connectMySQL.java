package com.example.demo.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectMySQL {
    private final String DB_URL = "jdbc:mysql://localhost:3306/store?useSSL=false";
    private final String DB_USERNAME = "root";
    private final String DB_PASSWORD = "12345678";

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e.getMessage());
        }
        return connection;
    }
}
