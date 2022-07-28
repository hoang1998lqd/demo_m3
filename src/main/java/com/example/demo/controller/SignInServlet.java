package com.example.demo.controller;

import com.example.demo.model.Customer;
import com.example.demo.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/web/electro-master/theme/sign-in")
public class SignInServlet extends HttpServlet {

    public int checkLogin(String user, String password,ArrayList<Customer> customers ){
        for (Customer customer : customers){
            if ((customer.getAccount().equals(user)|| customer.getEmail().equals(user)) && customer.getPassword().equals(password)){
                return customer.getRole_id().getId();
            }
        }
        return 0;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerService customerService = new CustomerService();
        ArrayList<Customer> customers = customerService.findAll();
        String userName = request.getParameter("Username");
        String password = request.getParameter("Password");
        if (checkLogin(userName,password,customers) == 1){
//            response.sendRedirect("/web/electro-master/theme/product.jsp");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/web/electro-master/theme/product.jsp");
            requestDispatcher.forward(request,response);
        } else if (checkLogin(userName,password,customers) == 2) {
            //response.sendRedirect("/web/electro-master/theme/product.jsp");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/web/electro-master/theme/index.jsp");
            requestDispatcher.forward(request,response);
        }else {
            request.setAttribute("mess","Tài khoản hoặc mật khẩu không chính xác !!!");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/web/electro-master/theme/login.jsp");
            requestDispatcher.forward(request,response);
        }

    }
}
