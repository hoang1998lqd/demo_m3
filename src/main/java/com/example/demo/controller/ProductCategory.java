package com.example.demo.controller;


import com.example.demo.DAO.BrandRepository;
import com.example.demo.DAO.CategoryRepository;
import com.example.demo.model.Brand;
import com.example.demo.model.Category;
import com.example.demo.model.Product;
import com.example.demo.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/web/electro-master/theme/store/category"})
public class ProductCategory extends HttpServlet {

    private final ProductService productService = new ProductService();
    private final CategoryRepository categoryRepository = new CategoryRepository();
    private final BrandRepository brandRepository = new BrandRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action =  req.getParameter("action");
        switch (action) {
            case "category":
                displayProductByCategory(req, resp);
                break;
            case "brand":
                displayProductByBrand(req, resp);
        }
    }

    public ArrayList<Product> getProductByCategory(int id){
        return productService.findProductByCategory(id);
    }

    private ArrayList<Product> getProductByBrand(int id){
        return productService.findProductByBrand(id);
    }
    public void displayProductByCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Category> categories = categoryRepository.findAll();
        ArrayList<Brand> brands = brandRepository.findAll();
        int Cid = Integer.parseInt(req.getParameter("Cid"));
        ArrayList<Product> list = getProductByCategory(Cid);
        req.setAttribute("products",list);
        req.setAttribute("brands",brands);
        req.setAttribute("categories",categories);
        req.getRequestDispatcher("/web/electro-master/theme/store.jsp").forward(req,resp);
    }

    public void displayProductByBrand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        ArrayList<Category> categories = categoryRepository.findAll();
        ArrayList<Brand> brands = brandRepository.findAll();
        int Bid = Integer.parseInt(req.getParameter("Bid"));
        ArrayList<Product> list = getProductByBrand(Bid);
        req.setAttribute("products",list);
        req.setAttribute("brands",brands);
        req.setAttribute("categories",categories);
        req.getRequestDispatcher("/web/electro-master/theme/store.jsp").forward(req,resp);
    }
}
