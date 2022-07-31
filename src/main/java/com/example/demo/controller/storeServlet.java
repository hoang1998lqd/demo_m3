package com.example.demo.controller;

import com.example.demo.model.Brand;
import com.example.demo.model.Category;
import com.example.demo.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(urlPatterns = {"/web/electro-master/theme/store"})
public class storeServlet extends HttpServlet {

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
//        Product product = new Product(1,"Laptop Dell",500000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
//                ,50,"Còn hàng",30,category);
//        Product product1 = new Product(2,"Laptop Dell",1000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
//                ,50,"Còn hàng",0,category);
//        Product product2 = new Product(3,"Laptop Dell",2000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
//                ,50,"Còn hàng",10,category);
//        Product product3 = new Product(4,"Laptop Dell",500000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
//                ,50,"Còn hàng",30,category);
//        Product product4 = new Product(5,"Laptop Dell",500000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
//                ,50,"Còn hàng",20,category);
//        Product product5 = new Product(6,"Laptop Dell",500000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
//                ,50,"Còn hàng",15,category);
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
//
//        req.setAttribute("categories",categories);
//        req.setAttribute("products",products);
//        req.setAttribute("brands",brands);
        req.getRequestDispatcher("/web/electro-master/theme/store.jsp").forward(req,resp);

    }

    private ArrayList<Product> getProductByCategory(HttpServletRequest req, HttpServletResponse resp){
        ArrayList<Product> products = new ArrayList<>();

        // Duyệt database gốc và tìm theo id category. Video phần 2
//        class : active HTML sẽ giúp tích vào chân đỏ trang mình chọn

        return products;
    }

}

