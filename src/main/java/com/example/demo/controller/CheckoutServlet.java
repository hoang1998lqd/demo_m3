package com.example.demo.controller;

import com.example.demo.DAO.OrderRepository;
import com.example.demo.model.*;
import com.example.demo.service.BrandService;
import com.example.demo.service.CategoryService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/web/electro-master/theme/check-out"})
public class CheckoutServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(true);
        String note = (String) session.getAttribute("note");
        Cart cart = null;
        Object o = session.getAttribute("cart");
        Customer customer = null;
        if (o != null){
            // Đã có
            cart = (Cart) o;
        }else {
//            chưa có
            cart = new Cart();
        }
        try {
            Object o1 = session.getAttribute("customer");
            if (o1 != null){
                customer = (Customer) o1;
                orderService.addOrder(customer,cart,note);
                session.removeAttribute("cart");
                session.setAttribute("size",0);
            }
        }catch (NumberFormatException e){
            e.printStackTrace();
        }
        resp.sendRedirect("/web/electro-master/theme/home");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        String note = (String) session.getAttribute("note");
        Cart cart = null;
        Object o = session.getAttribute("cart");
        Customer customer = null;
        if (o != null){
            // Đã có
            cart = (Cart) o;
        }else {
//            chưa có
            cart = new Cart();
        }
        try {
            Object o1 = session.getAttribute("customer");
            if (o1 != null){
                customer = (Customer) o1;
                ArrayList<Item> items = cart.getItems();
                session.setAttribute("cart",cart);
                session.setAttribute("customer",customer);
                session.setAttribute("size",items.size());
            }
        }catch (NumberFormatException e){
            e.printStackTrace();
        }
        req.getRequestDispatcher("/web/electro-master/theme/check-out.jsp").forward(req,resp);
    }
}
