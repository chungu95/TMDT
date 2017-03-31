/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductInfo;
import model.Products;

/**
 *
 * @author DELL
 */
@WebServlet(name = "insertProduct", urlPatterns = {"/insertProduct"})
public class insertProduct extends HttpServlet {

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
        insertProduct(request,response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
          response.setContentType("text/html;charset=UTF-8");
          request.setCharacterEncoding("UTF-8"); 
          PrintWriter out = response.getWriter();
          String productType = request.getParameter("productType");
          String resolution=request.getParameter("resolution");
          String hdmi = request.getParameter("hdmi");
          String usb= request.getParameter("usb");
          String model = request.getParameter("Model");
          String size = request.getParameter("size");
          String warranty = request.getParameter("warranty");
       
          String productName= request.getParameter("productName");
          String pr = request.getParameter("price");
          int price = Integer.parseInt(pr);
          String description = request.getParameter("description");
          String qua = request.getParameter("quantity");
          Integer quantity = Integer.parseInt(qua);
          String image = request.getParameter("productImg");
          String produceID = request.getParameter("produceID");
          ProductInfo prinfo = new ProductInfo(productType,resolution,hdmi,usb,model,size, warranty);  
          Products product = new Products(productName,price,description,quantity,image,prinfo,produceID);
          if(ProductsDAO.insertProduct(product)){
              out.print("<center><b><font color='red'>thêm thành công! </font> <a href = './WEB/admin/insertProduct.jsp'>quay về</a></b></center>");
          } else {
              out.print("<center><b><font color='red'>Thêm thất bại! </font> <a href = './WEB/admin/insertProduct.jsp'>quay về</a></b></center>");
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
        processRequest(request, response);
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
        processRequest(request, response);
       
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
