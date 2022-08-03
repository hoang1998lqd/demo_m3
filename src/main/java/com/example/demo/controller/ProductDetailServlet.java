package com.example.demo.controller;

import com.example.demo.model.Product;
import com.example.demo.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "PRServlet", urlPatterns = {"/web/electro-master/theme/products"})
public class ProductDetailServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int idProduct = Integer.parseInt(request.getParameter("Pid"));
        Product product = null;
        try {
            product = findProductById(idProduct);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("product",product);
        request.getRequestDispatcher("/web/electro-master/theme/product.jsp").forward(request,response);

    }
    private Product findProductById(int id) throws SQLException {
        return productService.findById(id);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
