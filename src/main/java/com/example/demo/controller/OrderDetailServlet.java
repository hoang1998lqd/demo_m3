package com.example.demo.controller;

import com.example.demo.DAO.InformationRepository;
import com.example.demo.model.Info;
import com.example.demo.service.InfoService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "OrderDetailServlet", urlPatterns = "/orderdetailssss")
public class OrderDetailServlet extends HttpServlet {

    private final InfoService infoService = new InfoService();
    private final InformationRepository informationRepository = new InformationRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":{
                deleteOrders(request,response);
                break;
            }
            default:
                displayAllOrder(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void displayAllOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Info> infos = infoService.findAll();
        request.setAttribute("infos", infos);
        request.getRequestDispatcher("/web/electro-master/theme/orderdetail.jsp").forward(request, response);
    }
    private void deleteOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int result = JOptionPane.showConfirmDialog(null,
                "Bạn có muốn xóa không?",
                "Xác nhận",
                JOptionPane.YES_NO_OPTION,
                JOptionPane.QUESTION_MESSAGE);
        if (result == JOptionPane.YES_OPTION) {
            informationRepository.deleteOrder(id);
            ArrayList<Info> infos = infoService.findAll();
            request.setAttribute("infos", infos);
            request.getRequestDispatcher("/web/electro-master/theme/orderdetail.jsp").forward(request, response);
            JOptionPane.showMessageDialog(null, "Xóa hóa đơn thành công!", "Hủy hóa đơn",
                    JOptionPane.INFORMATION_MESSAGE);
        }

    }


}
