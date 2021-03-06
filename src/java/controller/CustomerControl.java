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
 * @author DELL
 */
@WebServlet(name = "CustomerControl", urlPatterns = {"/CustomerControl"})
public class CustomerControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void updateInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String customerID = request.getParameter("customerID");
            String customerName = request.getParameter("Name");
            String dateString = request.getParameter("DoB");
            Date DoB = DateConverter.date(dateString);
            String gender = request.getParameter("sex");
            String addr = request.getParameter("address");
            String email = request.getParameter("youremail");
            String phone = request.getParameter("Phone");
            Customers customer = new Customers(customerID, customerName, DoB, addr, email, phone, gender);
            if (CustomerDAOs.updateCustomer(customer)) {
                HttpSession session = request.getSession();
                Customers cus = (Customers) session.getAttribute("customer");
                cus.setCustomerID(customerID);
                cus.setCustomerName(customerName);
                cus.setDoB(DoB);
                cus.setPhoneNumber(phone);
                cus.setEmail(email);
                cus.setAddress(addr);
                cus.setGender(gender);
                response.sendRedirect("./WEB/formcustomer.jsp?");
            } else {
                response.sendRedirect("./WEB/index.jsp");
            }
        } catch (IOException ex) {
            response.sendRedirect("./WEB/index.jsp");
        }
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
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
            String password = request.getParameter("pass");
            Customers customer = new Customers(customerID, customerName, DoB,
                    address, email, phoneNumber, username, password, gender);
            if (CustomerDAOs.getCustomer(username) != null) {
                response.sendRedirect("'./WEB/admin/insertCustomer.jsp?error=existed");
            } else if (CustomerDAOs.insertCustomer(customer)) {
                String hash = MD5.encryptMD5(customerID + username);
                Email.sendVerifyEmail(customer, hash);
                out.print("<center><b><font color='red'>thêm thành công! </font> <a href = './WEB/admin/insertCustomer.jsp'>quay về</a></b></center>");
            } else {
                out.print("<center><b><font color='red'>thêm thất bại! </font> <a href = './WEB/admin/insertCustomer.jsp'>quay về</a></b></center>");
            }
        } catch (IOException exx) {
            System.out.println(exx);
        }
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();//ghi xuống client
        String oldPassword = request.getParameter("oldPassword");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        Customers cus = (Customers) session.getAttribute("customer");
        if (CustomerDAOs.checkLogin(cus.getUsername(), oldPassword) != null) {
            if (CustomerDAOs.updatePassword(cus.getCustomerID(), password)) {
                out.print("<center><b><font color='red'>Đổi thành công! </font> <a href = './WEB/formcustomer.jsp'>quay về</a></b></center>");
            } else {
                out.print("<center><b><font color='red'>Đổi thất bại! </font> <a href = './WEB/formcustomer.jsp'>quay về</a></b></center>");
            }
        } else {
            out.print("<center><b><font color='red'>Mật khẩu cũ không đúng! </font> <a href = './WEB/formcustomer.jsp'>quay về</a></b></center>");
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
//        processRequest(request, response);
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
        String cmd = request.getParameter("cmd");
        switch (cmd) {
            case "updateInfo":
                updateInfo(request, response);
                break;
            case "changePassword":
                changePassword(request, response);
                break;
            case "insert":
                insert(request, response);
                break;
        }

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
