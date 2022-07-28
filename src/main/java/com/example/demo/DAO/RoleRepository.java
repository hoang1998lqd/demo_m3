package com.example.demo.DAO;

import com.example.demo.connection.connectMySQL;
import com.example.demo.model.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RoleRepository implements ICRUD<Role> {
    private final connectMySQL mySQL = new connectMySQL();
    private final String SELECT_ALL_ROLE =  "select * from role";
    private final String SELECT_ROLE_BY_ID =  "select * from role where id = ?";



    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    @Override
    public ArrayList<Role> findAll() {
        ArrayList<Role> roles = new ArrayList<>();
        try{
            connection = mySQL.getConnection();
            statement = connection.prepareStatement(SELECT_ALL_ROLE);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                roles.add(new Role(id,name));
            }
        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return roles;
    }

    @Override
    public void create(Role role) {

    }

    @Override
    public void update(Role role) {

    }

    @Override
    public void deleteById(int id) {

    }

    @Override
    public Role findById(int id) {
        try{
            connection = mySQL.getConnection();
            statement = connection.prepareStatement(SELECT_ROLE_BY_ID);
            statement.setInt(1,id);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                return new Role(id,name);
            }
        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return null;
    }
}
