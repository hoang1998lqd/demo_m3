package com.example.demo.controller;

import com.example.demo.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/web/electro-master/theme/home"})
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String action =  req.getParameter("action");
        displayAllProduct(req,resp);
    }

    private void displayAllProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product product = new Product(1,"Laptop Dell",500000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
                ,50,"Còn hàng",30);
        Product product1 = new Product(2,"Laptop Dell",1000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
                ,50,"Còn hàng",0);
        Product product2 = new Product(3,"Laptop Dell",2000000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
                ,50,"Còn hàng",10);
        Product product3 = new Product(4,"Laptop Dell",500000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
                ,50,"Còn hàng",30);
        Product product4 = new Product(5,"Laptop Dell",500000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
                ,50,"Còn hàng",20);
        Product product5 = new Product(6,"Laptop Dell",500000,"Đắt","https://i.9mobi.vn/cf/Images/huy/2021/12/6/anh-gai-xinh-3.jpg"
                ,50,"Còn hàng",15);
        ArrayList<Product> products = new ArrayList<>();
        products.add(product);
        products.add(product1);
        products.add(product2);
        products.add(product3);
        products.add(product4);
        products.add(product5);

        req.setAttribute("products",products);
        req.getRequestDispatcher("/web/electro-master/theme/index.jsp").forward(req,resp);

    }

}
