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
//        Brand brand = new Brand(1,"Dell");
//        Brand brand1 = new Brand(2,"Asus");
//        Brand brand2 = new Brand(3,"Acer");
//        Category category = new Category(1,"Máy tính xách tay");
//        Category category1 = new Category(2,"Phụ kiện");
//        Category category2 = new Category(3,"Điện thoại");
//        Product product = new Product(1,"LaptopDell",5000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg",
//                10,category,1,10,brand);
//        Product product1 = new Product(1,"LaptopDell",5000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg",
//                10,category,1,0,brand);
//        Product product2 = new Product(1,"LaptopDell",5000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg",
//                10,category1,1,10,brand);
//        Product product3 = new Product(1,"LaptopDell",5000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg",
//                10,category,1,15,brand);
//        Product product4 = new Product(1,"LaptopDell",5000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg",
//                10,category,1,0,brand);
//        Product product5 = new Product(1,"LaptopDell",5000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg",
//                10,category2,1,10,brand);
//        ArrayList<Product> products = new ArrayList<>();
//        products.add(product);
//        products.add(product1);
//        products.add(product2);
//        products.add(product3);
//        products.add(product4);
//        products.add(product5);
//
//        ArrayList<Category> categories = new ArrayList<>();
//        categories.add(category);
//        categories.add(category1);
//        categories.add(category2);
//
//        ArrayList<Brand> brands = new ArrayList<>();
//        brands.add(brand);
//        brands.add(brand1);
//        brands.add(brand2);
        ArrayList<Product>  products = productService.findAll();
        ArrayList<Brand>  brands = brandService.findAll();
        ArrayList<Category>  categories = categoryService.findAll();
        req.setAttribute("categories",categories);
        req.setAttribute("products",products);
        req.setAttribute("brands",brands);
        req.getRequestDispatcher("/web/electro-master/theme/index.jsp").forward(req,resp);
    }

}
