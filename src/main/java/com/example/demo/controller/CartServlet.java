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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/web/electro-master/theme/cart"})
public class CartServlet extends HttpServlet {

    private final ProductService productService = new ProductService();
    private final CategoryRepository categoryRepository = new CategoryRepository();
    private final BrandRepository brandRepository = new BrandRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            int idProduct = Integer.parseInt(req.getParameter("Pid"));
            Product product = productService.findById(idProduct);
            session.setAttribute("product",product);
            req.getRequestDispatcher("/web/electro-master/theme/cart.jsp").forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
