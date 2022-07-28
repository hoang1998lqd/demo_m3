package com.example.demo.controller;

import com.example.demo.model.Customer;
import com.example.demo.service.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/web/electro-master/theme/sign-up")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerService customerService = new CustomerService();
        ArrayList<Customer> customers = customerService.findAll();
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String repeat = req.getParameter("repeat");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");

        if (!password.equals(repeat)){
            req.setAttribute("messRepeat","Mật khẩu nhập lại không trùng khớp !!!");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login.jsp");
            requestDispatcher.forward(req,resp);
        }else {
            // Check trùng tài khoản
            if (customerService.checkTagName(userName,customers) == 1){
                req.setAttribute("username","Tài khoản đã tồn tại. Vui lòng tạo tài khoản khác !!!");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login.jsp");
                requestDispatcher.forward(req,resp);
            }
            // Check Phone
            else if (customerService.checkPhone(phone,customers) == 1){
                req.setAttribute("phone","Số điện thoại đã được sử dụng !!!");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login.jsp");
                requestDispatcher.forward(req,resp);
            }else if (customerService.checkPhone(phone,customers) == 2){
                req.setAttribute("phone","Số điện thoại nhập vào không hợp lệ !!!");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login.jsp");
                requestDispatcher.forward(req,resp);
            }
            // Check Email
            else if (customerService.checkEmail(email,customers) == 1) {
                req.setAttribute("email","Email đã được sử dụng !!!");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login.jsp");
                requestDispatcher.forward(req,resp);
            } else if (customerService.checkEmail(email,customers) == 2) {
                req.setAttribute("email","Email nhập vào không hợp lệ !!!");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login.jsp");
                requestDispatcher.forward(req,resp);
            }
            else {
                Customer customer = new Customer(userName,password,name,phone,email,address);
                customerService.create(customer);
                resp.sendRedirect("/web/electro-master/theme/index.jsp ");
            }

        }

    }
}
