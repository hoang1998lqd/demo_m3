package com.example.demo.controller;

import com.example.demo.model.Customer;
import com.example.demo.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/web/electro-master/theme/login")
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
        String action =  request.getParameter("action");
        switch (action) {
            case "sign-in":
                signIn(request, response);
                break;
            case "sign-up":
                signUp(request, response);
        }

    }
    private void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = "Sign in";
        CustomerService customerService = new CustomerService();
        ArrayList<Customer> customers = customerService.findAll();
        String userName = request.getParameter("Username");
        String password = request.getParameter("Password");
        if (checkLogin(userName,password,customers) == 1){
            Customer customer = customerService.findCustomerByAccount(userName,customers);
            HttpSession session = request.getSession();
            session.setAttribute("customer",customer);
            session.setAttribute("messageSignIn",message);
            response.sendRedirect("/web/electro-master/theme/home");
        } else if (checkLogin(userName,password,customers) == 2) {
            HttpSession session = request.getSession();
            Customer customer = customerService.findCustomerByAccount(userName,customers);
            session.setAttribute("customer",customer);
            session.setAttribute("messageSignIn",message);
            response.sendRedirect("/web/electro-master/theme/home");
        }else {
            request.setAttribute("mess","T??i kho???n ho???c m???t kh???u kh??ng ch??nh x??c !!!");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/web/electro-master/theme/login-2.jsp");
            requestDispatcher.forward(request,response);
        }
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String message = "Sign up";
        CustomerService customerService = new CustomerService();
        ArrayList<Customer> customers = customerService.findAll();
        String userName = req.getParameter("Username");
        String password = req.getParameter("Password");
        String repeat = req.getParameter("Repeat");
        String name = req.getParameter("Name");
        String email = req.getParameter("Email");
        String phone = req.getParameter("Phone");
        String address = req.getParameter("Address");
        Customer customer = new Customer(userName,password,name,phone,email,address);
        if (!password.equals(repeat)){
            req.setAttribute("messageSignUp",message);
            req.setAttribute("messRepeat","M???t kh???u nh???p l???i kh??ng tr??ng kh???p !!!");
            req.setAttribute("password",password);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login-2.jsp");
            requestDispatcher.forward(req,resp);
        }  else {
            boolean check = true;
            // Check tr??ng t??i kho???n
            if (customerService.checkTagName(userName,customers) == 1){
                req.setAttribute("messageSignUp",message);
                req.setAttribute("Username",userName);
                req.setAttribute("isSingup",true);
                req.setAttribute("username","T??i kho???n ???? t???n t???i. Vui l??ng t???o t??i kho???n kh??c !!!");
                check =false;
            }
            if (customerService.checkPass(password,customers) == 0 ) {
                req.setAttribute("mesageSingUp",message);
                req.setAttribute("messRepeat","M???t kh???u l?? s??? d??i t??? 6 t???i 8 ch??? s???!!!");
                req.setAttribute("Repeat",password);
                check=false;
            }
            // Check Phone
            if (customerService.checkPhone(phone,customers) == 1){
                req.setAttribute("messageSignUp",message);
                req.setAttribute("phone","S??? ??i???n tho???i ???? ???????c s??? d???ng !!!");
                req.setAttribute("Phone",phone);
                check= false;
            } if (customerService.checkPhone(phone,customers) == 0){
                req.setAttribute("messageSignUp",message);
                req.setAttribute("phone","S??? ??i???n tho???i nh???p v??o kh??ng h???p l??? !!!");
                req.setAttribute("Phone",phone);
                check = false;
            }
            // Check Email
            if (customerService.checkEmail(email,customers) == 1) {
                req.setAttribute("messageSignUp",message);
                req.setAttribute("email","Email ???? ???????c s??? d???ng !!!");
                req.setAttribute("Email",email);
                check = false;
            }  if (customerService.checkEmail(email,customers) == 0) {
                req.setAttribute("messageSignUp",message);
                req.setAttribute("email","Email nh???p v??o kh??ng h???p l??? !!!");
                req.setAttribute("Email",email);
                check = false;
            }
            req.setAttribute("messageSignUp",message);
            if (check){
                customerService.create(customer);
                resp.sendRedirect("/web/electro-master/theme/index.jsp ");
            }else {
                req.setAttribute("isSingup",true);

                req.setAttribute("c",customer);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login-2.jsp");
                requestDispatcher.forward(req,resp);
            }
        }


//    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
//        String message = "Sign up";
//        CustomerService customerService = new CustomerService();
//        ArrayList<Customer> customers = customerService.findAll();
//        String userName = req.getParameter("Username");
//        String password = req.getParameter("Password");
//        String repeat = req.getParameter("Repeat");
//        String name = req.getParameter("Name");
//        String email = req.getParameter("Email");
//        String phone = req.getParameter("Phone");
//        String address = req.getParameter("Address");
//        Customer customer = new Customer(userName,password,name,phone,email,address);
//        if (customerService.checkPassword(password,customers)){
//            req.setAttribute("messageSignUp",message);
//            req.setAttribute("Password","M???t kh???u d??i t??? 6 t???i 8 ch??? s??? !!!");
//            req.setAttribute("password",password);
//            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login-2.jsp");
//            requestDispatcher.forward(req,resp);
//        } else if (!password.equals(repeat)) {
//            req.setAttribute("messageSignUp",message);
//            req.setAttribute("messRepeat","M???t kh???u nh???p l???i kh??ng tr??ng kh???p !!!");
//            req.setAttribute("Repeat",password);
//            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login-2.jsp");
//            requestDispatcher.forward(req,resp);
//        } else {
//            boolean check = true;
//            // Check tr??ng t??i kho???n
//            if (customerService.checkTagName(userName,customers) == 1){
//                req.setAttribute("messageSignUp",message);
//                req.setAttribute("Username",userName);
//                req.setAttribute("isSingup",true);
//                req.setAttribute("username","T??i kho???n ???? t???n t???i. Vui l??ng t???o t??i kho???n kh??c !!!");
//                check =false;
//            }
//            // Check Phone
//            if (customerService.checkPhone(phone,customers) == 1){
//                req.setAttribute("messageSignUp",message);
//                req.setAttribute("phone","S??? ??i???n tho???i ???? ???????c s??? d???ng !!!");
//                req.setAttribute("Phone",phone);
//                check= false;
//            } if (customerService.checkPhone(phone,customers) == 0){
//                req.setAttribute("messageSignUp",message);
//                req.setAttribute("phone","S??? ??i???n tho???i nh???p v??o kh??ng h???p l??? !!!");
//                req.setAttribute("Phone",phone);
//                check = false;
//            }
//            // Check Email
//            if (customerService.checkEmail(email,customers) == 1) {
//                req.setAttribute("messageSignUp",message);
//                req.setAttribute("email","Email ???? ???????c s??? d???ng !!!");
//                req.setAttribute("Email",email);
//                check = false;
//            }  if (customerService.checkEmail(email,customers) == 0) {
//                req.setAttribute("messageSignUp",message);
//                req.setAttribute("email","Email nh???p v??o kh??ng h???p l??? !!!");
//                req.setAttribute("Email",email);
//                check = false;
//            }
//            req.setAttribute("messageSignUp",message);
//            if (check){customerService.create(customer);
//                resp.sendRedirect("/web/electro-master/theme/index.jsp ");
//            }else {
//                req.setAttribute("isSingup",true);
//                req.setAttribute("c",customer);
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/web/electro-master/theme/login-2.jsp");
//                requestDispatcher.forward(req,resp);
//            }
//        }
//
//    }

    }
}

