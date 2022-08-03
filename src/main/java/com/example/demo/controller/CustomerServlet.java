package com.example.demo.controller;

import com.example.demo.model.Customer;
import com.example.demo.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CustomerServlet", value = "/web/electro-master/theme/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        HttpSession session = req.getSession(true);
        Customer customer = (Customer) session.getAttribute("customer");
        customer.setName(name);
        customer.setPhone(phone);
        customer.setEmail(email);
        customer.setAddress(address);
        try {
            customerService.update(customer);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("/web/electro-master/theme/logout");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPass = request.getParameter("old-pass");
        String newPass = request.getParameter("new-pass");
        String repeatPass = request.getParameter("repeat-pass");
        HttpSession session = request.getSession(true);
        Customer customer = (Customer) session.getAttribute("customer");
        if (!oldPass.equals(customer.getPassword())){
            request.setAttribute("mess","Mật khẩu nhập vào không chính xác !!!");
            request.getRequestDispatcher("CustomerServlet").forward(request,response);
        }else {
            if (!newPass.equals(repeatPass)){
                request.setAttribute("messRepeat","Mật khẩu nhập vào không chính xác !!!");
                request.getRequestDispatcher("CustomerServlet").forward(request,response);
            }
            else {
                try {
                    customer.setPassword(newPass);
                    customerService.updatePassword(customer);
                    response.sendRedirect("/web/electro-master/theme/logout");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }

    }
}
