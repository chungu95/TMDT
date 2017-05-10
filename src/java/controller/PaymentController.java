/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OderDAO;
import static dao.OderDAO.getOrderByID;
import function.PaymentModule;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Oders;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Payment", urlPatterns = {"/PaymentController"})
public class PaymentController extends HttpServlet {

    private void pay(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String orderID = request.getParameter("OrderID");
        System.out.println(orderID); 
        String remitterID = request.getParameter("ID").trim();
        String password = request.getParameter("pwd").trim();
        Oders order = getOrderByID(orderID); 
        String receiverID = "1234567890123";  
        System.out.println(order.getCustomerID());
        BigInteger amount = new BigInteger(order.getPrice() + "");
        String result = PaymentModule.payment(remitterID, receiverID, amount, orderID, password);
        if (result.equals(order.getOderID())) {    
            result = "Thanh toán thành công đơn hàng " + order.getOderID();
            OderDAO.updateOrder(order.getOderID(), "B76PL10N", "Đang giao hàng");
        } else if (result == null || result.equals("")) {
            result = "Có lỗi xảy ra!";
        }
        out.print("<center><b style='color:red'>" + result + "</b></center>");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        pay(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        pay(request, response);
    }
 
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
