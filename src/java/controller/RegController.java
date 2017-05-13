/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDAOs;
import function.DateConverter;
import function.Email;
import function.MD5;
import function.RandomKey;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "RegController", urlPatterns = {"/RegController", "/Verify", "/SendVerify"})
public class RegController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
        String password = request.getParameter("password");
        Customers customer = new Customers(customerID, customerName, DoB,
                address, email, phoneNumber, username, password, gender);
        if (CustomerDAOs.getCustomer(username) != null) {
            response.sendRedirect("./WEB/reg.jsp?error=existed");
        } else if (CustomerDAOs.insertCustomer(customer)) {
            customer.setStatus("NotActive");
            customer.setAccumulatedScore(0); 
            String hash = MD5.encryptMD5(customerID + username);
            Email.sendVerifyEmail(customer, hash);
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("./WEB/regsuccess.jsp");
        } else {
            response.sendRedirect("./WEB/reg.jsp");
        }
    }

    private void sendVerifyEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Customers cus = (Customers) session.getAttribute("customer");
        if (cus == null) {
            response.sendRedirect("./WEB/index.jsp");
        } else {
            String hash = MD5.encryptMD5(cus.getCustomerID() + cus.getUsername());
            Email.sendVerifyEmail(cus, hash);
            out.print("<br /><center><b style='color:red'>Đã gửi email xác nhận </b>"
                    + "<b><a href='./WEB/formcustomer.jsp'>Quay về</a></b></center>");
        }
    }

    @SuppressWarnings("null")
    private void verify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String hash = request.getParameter("hash");
        String customerID = request.getParameter("u");
        Customers cus = CustomerDAOs.getCustomer(customerID);
        if (cus != null) {
            if (hash.equals(MD5.encryptMD5(cus.getCustomerID() + cus.getUsername()))) {
                if (CustomerDAOs.activeAccount(cus.getCustomerID())) {
                    HttpSession session = request.getSession();
                    Customers customer = (Customers) session.getAttribute("customer");
                    if (customer != null) {
                        customer.setStatus("Activated");
                        response.sendRedirect("./WEB/formcustomer.jsp");
                    }
                } else {
                    out.print("<br /><center><b style='color:red'>Tài khoản đã được kích hoạt, mời bạn </b><b><a href='./WEB/login.jsp'>đăng nhập</a></b></center>");
                }
            } else {
                response.sendRedirect("./WEB/reg.jsp");
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
        String servletPath = request.getServletPath();
        switch (servletPath) {
            case "/Verify":
                verify(request, response);
                break;
            case "/SendVerify":
                sendVerifyEmail(request, response);
                break;
            default:
                response.sendRedirect("./WEB/index.jsp");
        }
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
