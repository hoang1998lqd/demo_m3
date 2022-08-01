package com.example.demo.service;

import com.example.demo.DAO.CategoryRepository;
import com.example.demo.DAO.ICRUD;
import com.example.demo.model.Category;

import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryService implements ICRUD<Category> {
    private final CategoryRepository categoryService = new CategoryRepository();

    public static void main(String[] args) {

    }
    @Override
    public ArrayList<Category> findAll() {
        return categoryService.findAll();
    }

    @Override
    public void create(Category category) {
        categoryService.create(category);
    }

    @Override
    public void update(Category category) throws SQLException {
        categoryService.update(category);
    }

    @Override
    public void deleteById(int id) throws SQLException {
        categoryService.deleteById(id);
    }

    @Override
    public Category findById(int id) throws SQLException {
        return categoryService.findById(id);
    }
}
