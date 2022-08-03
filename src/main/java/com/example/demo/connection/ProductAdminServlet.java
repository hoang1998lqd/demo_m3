package com.example.demo.connection;

import com.example.demo.model.Product;
import com.example.demo.service.InfoService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;
import com.sun.org.apache.xpath.internal.operations.Or;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "OrderDetailServlet", value = "/productAdmin")
public class ProductAdminServlet extends HttpServlet {
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":{
                try {
                    delete(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
            default:
                displayProduct(request,response);
                break;
        }
    }

    private void displayProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> products =  productService.findAll();
        request.setAttribute("products",products);
        request.getRequestDispatcher("/web/electro-master/theme/productAdmin.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteById(id);
        ArrayList<Product> products = productService.findAll();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/web/electro-master/theme/productAdmin.jsp").forward(request, response);
    }
}

