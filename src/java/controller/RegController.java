/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDAOs;
import function.DateConverter;
import function.MD5;
import function.RandomKey;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customers;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RegController", urlPatterns = {"/RegController"})
public class RegController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    public void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String customerID = RandomKey.randomKey();
        String username = request.getParameter("username");
        String customerName = request.getParameter("firstname")
                + " "
                + request.getParameter("lastname");
        String dateString = request.getParameter("DoB");
        Date DoB = DateConverter.date(dateString);
        String gender = request.getParameter("sex");
        String email = request.getParameter("youremail");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("Phone");
        String password = MD5.encryptMD5(request.getParameter("password"));
        Customers customer = new Customers(customerID, customerName, DoB,
                address, email, phoneNumber, username, password, gender);

        if (CustomerDAOs.getCustomer(username) != null) {
            response.sendRedirect("./WEB/reg.jsp?error=existed");
        } else if (CustomerDAOs.insertCustomer(customer)) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("./WEB/regsuccess.jsp");
        } else {
            response.sendRedirect("./WEB/reg.jsp");
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
        register(request, response);
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
