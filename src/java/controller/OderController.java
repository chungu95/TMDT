/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OderDAO;
import function.DateConverter;
import function.RandomKey;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.function.Consumer;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Customers;
import model.OderDetails;
import model.Oders;
import model.Products;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "OderController", urlPatterns = {"/OderController"})
public class OderController extends HttpServlet {

    private void saveCart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        System.out.println("abc");
        Cart cart = (Cart) session.getAttribute("cart");
        Customers customer = (Customers) session.getAttribute("customer");
        String OderID = RandomKey.randomKey();
        Date oderDate = DateConverter.getCurrentDate();
        request.getParameter("name");
        System.out.println(request.getParameter("shipDate"));
        Date shipDate = DateConverter.date(request.getParameter("shipDate"));
        System.out.println(shipDate+ " | "+ request.getParameter("shipDate"));
        String deliveryPhone = request.getParameter("phone"); 
        String deliveryAddress = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");
        int price = cart.getTotalPrice();
        String customerID = customer.getCustomerID();
        String employeeID = "12345678";
        String status = "Chưa thanh toán";
        System.out.println(OderID);
        ArrayList<OderDetails> orderDetails = new ArrayList<>();
//        cart.getListProduct().forEach((item) -> {  
//            orderDetails.add(new OderDetails(OderID, item.getProductID(), item.getQuantity(), item.getQuantity() * item.getPrice()));
//            System.out.println(item.getOderDetailsList().get(0).getOderID());
//        }); 
        for(int i=0;i<cart.getListProduct().size();i++){
            orderDetails.add(new OderDetails(OderID, cart.getListProduct().get(i).getProductID(), cart.getListProduct().get(i).getQuantity(), cart.getListProduct().get(i).getQuantity() * cart.getListProduct().get(i).getPrice()));
            System.out.println(orderDetails.get(0).getOderID());
        }
        
        Oders oder = new Oders(OderID, oderDate, shipDate, price, paymentMethod, deliveryAddress, deliveryPhone, status, customerID, employeeID);
        oder.setOderDetailsList(orderDetails);
        System.out.println(oder.getOderID());
        if (OderDAO.insertOder(oder)) {
            if (paymentMethod.equals("cart")) {
                session.removeAttribute("cart"); 
                response.sendRedirect("./payment.jsp");
            } else if (paymentMethod.equals("delivery")) {
                session.removeAttribute("cart"); 
                response.sendRedirect("./checkorders.jsp");
            }
        }
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        saveCart(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        saveCart(request, response);
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
