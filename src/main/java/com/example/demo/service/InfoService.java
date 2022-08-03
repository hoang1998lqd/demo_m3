package com.example.demo.service;

import com.example.demo.DAO.ICRUD;
import com.example.demo.DAO.InformationRepository;
import com.example.demo.model.Info;

import java.sql.SQLException;
import java.util.ArrayList;

public class InfoService  implements ICRUD<Info> {

    InformationRepository repository = new InformationRepository();


    @Override
    public ArrayList<Info> findAll() {
        try {
            return repository.findAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void create(Info info) {

    }

    @Override
    public void update(Info info) throws SQLException {

    }

    @Override
    public void deleteById(int id) throws SQLException {

    }

    @Override
    public Info findById(int id) throws SQLException {
        return null;
    }
}
