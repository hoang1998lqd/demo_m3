package com.example.demo.service;

import com.example.demo.DAO.BrandRepository;
import com.example.demo.DAO.ICRUD;
import com.example.demo.model.Brand;

import java.sql.SQLException;
import java.util.ArrayList;

public class BrandService implements ICRUD<Brand> {
    private final BrandRepository brandRepository = new BrandRepository();

    @Override
    public ArrayList<Brand> findAll() {
        return brandRepository.findAll();
    }

    @Override
    public void create(Brand brand) {
        brandRepository.create(brand);
    }

    @Override
    public void update(Brand brand) throws SQLException {
        brandRepository.update(brand);
    }

    @Override
    public void deleteById(int id) throws SQLException {
        brandRepository.deleteById(id);
    }

    @Override
    public Brand findById(int id) throws SQLException {
        return brandRepository.findById(id);
    }


}
