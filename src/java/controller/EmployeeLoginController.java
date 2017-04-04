/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EmployeeDAO;
import function.RandomKey;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Employees;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EmployeeLoginController", urlPatterns = {"/EmployeeLoginController", "/EmployeeLogout"})
public class EmployeeLoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
     */
    private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(request.getServletPath());
        try {
            Employees employee = EmployeeDAO.checkLoginEmployee(username, password);
            if (employee == null) {
                response.sendRedirect("./WEB/admin/ad_login.jsp?error=" + RandomKey.randomKey(28));
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("Employee", employee);
                response.sendRedirect("./WEB/admin/index.jsp");
            }
        } catch (IOException ex) {
            System.out.println(ex);
            response.sendRedirect("./WEB/404.jsp?error=Connection timeout!");
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Employees employee = (Employees) session.getAttribute("Employee");
        if (employee != null) {
            session.removeAttribute("Employee");
        }
        response.sendRedirect("./WEB/admin/ad_login.jsp");
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
        String servletPath = request.getServletPath();
        switch (servletPath) {
            case "/EmployeeLoginController":
                response.sendRedirect("./WEB/admin/ad_login.jsp");
                break;
            case "/EmployeeLogout":
                logout(request, response);
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
        checkLogin(request, response);
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
