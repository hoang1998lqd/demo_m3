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


@WebServlet(urlPatterns = {"/web/electro-master/theme/store"})
public class storeServlet extends HttpServlet {

    private final ProductService productService = new ProductService();
    private final BrandService brandService = new BrandService();
    private final CategoryService categoryService = new CategoryService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        displayAllProduct(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        productSearch(req,resp);
    }

    private void displayAllProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Product>  products = productService.findAll();
        ArrayList<Brand>  brands = brandService.findAll();
        ArrayList<Category>  categories = categoryService.findAll();
        ArrayList<Product>  listTop = productService.findProductTop();
        req.setAttribute("categories",categories);
        req.setAttribute("products",products);
        req.setAttribute("brands",brands);
        req.setAttribute("listTop",listTop);
        req.getRequestDispatcher("/web/electro-master/theme/store.jsp").forward(req,resp);

    }

    private void productSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("searchProduct");
        ArrayList<Product>  products = productService.productSearch(search);
        ArrayList<Brand>  brands = brandService.findAll();
        ArrayList<Category>  categories = categoryService.findAll();
        ArrayList<Product>  listTop = productService.findProductTop();
        req.setAttribute("categories",categories);
        req.setAttribute("products",products);
        req.setAttribute("brands",brands);
        req.setAttribute("listTop",listTop);
        req.getRequestDispatcher("/web/electro-master/theme/store.jsp").forward(req,resp);
    }


}

