package com.example.demo.DAO;

import com.example.demo.connection.connectMySQL;
import com.example.demo.model.Brand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BrandRepository {
    private final com.example.demo.connection.connectMySQL connectMySQL = new connectMySQL();
    private final String SELECT_BRAND_BY_ID = "select * from brand where id = ?;";
    private final String SELECT_ALL_BRAND = "select * from brand;";
    private final String INSERT_BRAND = "insert into brand(name)" + "value(?)";
    private final String UPDATE_BRAND = "update brand set name = ? where id = ?";
    private final String DELETE_BRAND_BY_ID = "delete from brand where id = ?";

    public ArrayList<Brand> findAll() {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            Connection connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BRAND);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Brand brand = new Brand(id, name);
                brands.add(brand);
            }
        }
        catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return brands;
    }

    public Brand findById(int id) {
        try {
            Connection connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BRAND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                return new Brand(id, name);
            }
        }
        catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    private PreparedStatement getPre(String SQL, Brand brand) throws SQLException {
        Connection connection = connectMySQL.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1, brand.getName());
        return preparedStatement;
    }

    public void create(Brand brand) {
        try {
            PreparedStatement preparedStatement = getPre(INSERT_BRAND, brand);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public void update(Brand brand) {
        try {
            PreparedStatement preparedStatement = getPre(UPDATE_BRAND, brand);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public void deleteById(int id) {
        try {
            Connection connection = connectMySQL.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BRAND_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }
}
