package com.example.demo.service;

import com.example.demo.DAO.ICRUD;
import com.example.demo.DAO.ProductRepository;
import com.example.demo.model.Product;

import java.sql.SQLException;
import java.util.ArrayList;

public class ProductService implements ICRUD<Product> {
    private final ProductRepository productRepository = new ProductRepository();
    @Override
    public ArrayList<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void create(Product product) {
        productRepository.create(product);
    }

    @Override
    public void update(Product product) throws SQLException {
        productRepository.update(product);
    }

    @Override
    public void deleteById(int id) throws SQLException {
        productRepository.deleteById(id);
    }

    @Override
    public Product findById(int id) throws SQLException {
        return productRepository.findById(id);
    }

    public ArrayList<Product> findProductByCategory(int id) {
        return productRepository.findProductByCategory(id);
    }
    public ArrayList<Product> findProductByBrand(int id) {
        return productRepository.findProductByBrand(id);
    }

    public ArrayList<Product> findProductByCategory(int category, int brand) {
        return productRepository.findProductByBrandCategory(category,brand);
    }

    public ArrayList<Product> findProductTop(){
        return productRepository.findProductTop();
    }

    public static void main(String[] args) {
        ProductService productService = new ProductService();
        ArrayList<Product> products = productService.findProductByBrand(3);
        System.out.println(products.size());
    }


}
