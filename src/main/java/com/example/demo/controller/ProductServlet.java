package com.example.demo.controller;

import com.example.demo.model.Brand;
import com.example.demo.model.Category;
import com.example.demo.model.Product;
import com.example.demo.service.BrandService;
import com.example.demo.service.CategoryService;
import com.example.demo.service.ProductService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/web/electro-master/theme/home"})
public class ProductServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final BrandService brandService = new BrandService();
    private final CategoryService categoryService = new CategoryService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        displayAllProduct(req,resp);
    }

    private void displayAllProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Product>  products = productService.findAll();
        ArrayList<Brand>  brands = brandService.findAll();
        ArrayList<Category>  categories = categoryService.findAll();
        req.setAttribute("categories",categories);
        req.setAttribute("products",products);
        req.setAttribute("brands",brands);
        req.getRequestDispatcher("/web/electro-master/theme/index.jsp").forward(req,resp);
    }

}
