/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EmployeeDAO;
import function.RandomKey;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customers;
import model.Employees;

/**
 *
 * @author DELL
 */
@WebServlet(name = "employeeControl", urlPatterns = {"/employeeControl"})
public class employeeControl extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
       // updateInfo(request, response);

    }

    private void updateInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String employeeID = request.getParameter("employeeID");
        String employeeName = request.getParameter("employeeName");
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        Employees emp = new Employees(employeeID, username, pass, role, employeeName);
        if (EmployeeDAO.updateEmployee(emp)) {
            out.print("<center><b><font color='red'>sửa thành công! </font> <a href = './WEB/admin/employee.jsp'>quay về</a></b></center>");
        } else {
            out.print("<center><b><font color='red'>thất bại! </font> <a href = './WEB/admin/employee.jsp'>quay về</a></b></center>");
        }
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String employeeID = request.getParameter("employeeID");
        String password = request.getParameter("pass");
        if (EmployeeDAO.updatePass(employeeID, password)) {
            out.print("<center><b><font color='red'>sửa thành công! </font> <a href = './WEB/admin/employee.jsp'>quay về</a></b></center>");
        } else {
            out.print("<center><b><font color='red'>thất bại! </font> <a href = './WEB/admin/employee.jsp'>quay về</a></b></center>");
        }
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String employeeID = RandomKey.randomKey();
        String employeeName = request.getParameter("employeeName");
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        Employees emp = new Employees(employeeID, username, pass, role, employeeName);
        if(EmployeeDAO.getEmployees(username)!=null){
             response.sendRedirect("./WEB/admin/insertEmployee.jsp?error=existed");
        } else if(EmployeeDAO.insertEmployee(emp)){
            out.print("<center><b><font color='red'>Thêm thành công! </font> <a href = './WEB/admin/insertEmployee.jsp'>quay về</a></b></center>");
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
        //  processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        String cmd = request.getParameter("sub");
        switch (cmd) {
            case "updateInfo":
                updateInfo(request, response);
                break;
            case "pass":
                changePassword(request, response);
                break;
            case "insert" :
                insertEmployee(request,response);
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
