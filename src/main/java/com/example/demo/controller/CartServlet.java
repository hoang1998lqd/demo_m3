package com.example.demo.controller;


import com.example.demo.DAO.BrandRepository;
import com.example.demo.DAO.CategoryRepository;
import com.example.demo.DAO.OrderRepository;
import com.example.demo.model.*;
import com.example.demo.service.BrandService;
import com.example.demo.service.CategoryService;
import com.example.demo.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/web/electro-master/theme/cart"})
public class CartServlet extends HttpServlet {

    private final ProductService productService = new ProductService();
    private final BrandService brandService = new BrandService();
    private final CategoryService categoryService = new CategoryService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null){
            // Đã có
            cart = (Cart) o;
        }else {
//            chưa có
            cart = new Cart();
        }
        int product_id = Integer.parseInt(req.getParameter("id"));
        try {
            cart.removeItem(product_id);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }
        ArrayList<Item> items = cart.getItems();
        session.setAttribute("cart",cart);
        session.setAttribute("size",items.size());
        ArrayList<Product>  products = productService.findAll();
        ArrayList<Brand>  brands = brandService.findAll();
        ArrayList<Category>  categories = categoryService.findAll();
        req.setAttribute("categories",categories);
        req.setAttribute("products",products);
        req.setAttribute("brands",brands);
        req.getRequestDispatcher("/web/electro-master/theme/store.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null){
            // Đã có
            cart = (Cart) o;
        }else {
//            chưa có
            cart = new Cart();
        }
            int quantity = 1;
            int product_id = Integer.parseInt(req.getParameter("Pid"));
            try {
                Product product = productService.findById(product_id);
                int price = product.getPrice() * quantity;
                Item item = new Item(product,quantity,price);
                cart.addItem(item);
            }catch (NumberFormatException e){
                e.printStackTrace();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            ArrayList<Item> items = cart.getItems();
            session.setAttribute("cart",cart);
            session.setAttribute("size",items.size());
            ArrayList<Product>  products = productService.findAll();
            ArrayList<Brand>  brands = brandService.findAll();
            ArrayList<Category>  categories = categoryService.findAll();
            req.setAttribute("categories",categories);
            req.setAttribute("products",products);
            req.setAttribute("brands",brands);
            req.getRequestDispatcher("/web/electro-master/theme/store.jsp").forward(req,resp);
    }


}


