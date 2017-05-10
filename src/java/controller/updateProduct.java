/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductsDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductInfo;
import model.Products;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author DELL
 */
@WebServlet(name = "updateProduct", urlPatterns = {"/updateProduct"})
public class updateProduct extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 5;

    private static final String uploadPath = "E:\\Documents\\thuongmaidientu\\CODE\\TMDT\\web";

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

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String produceID = request.getParameter("produceID");
        String price = request.getParameter("price");
        int pri = Integer.parseInt(price);
        String description = request.getParameter("description");
        String quantity = request.getParameter("quantity");
        int quant = Integer.parseInt(quantity);
        String type = request.getParameter("productType");
        String resolution = request.getParameter("resolution");
        String hdmi = request.getParameter("hdmi");
        String usb = request.getParameter("usb");
        String model = request.getParameter("Model");
        String size = request.getParameter("size");
        String warranty = request.getParameter("warranty");
        ProductInfo prinfo = new ProductInfo(productID, type, resolution, hdmi, usb, model, size, warranty);
        Products product = new Products(productID, productName, pri, description, quant, prinfo, produceID);

        if (ProductsDAO.updateProduct(product)) {
            out.print("<center><b><font color='red'>sửa thành công! </font> <a href = './WEB/admin/updateProduct.jsp'>quay về</a></b></center>");
        } else {
            out.print("<center><b><font color='red'>thất bại! </font> <a href = './WEB/admin/updateProduct.jsp'>quay về</a></b></center>");
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
        request.setCharacterEncoding("UTF-8");
        String cmd = request.getParameter("sub");
        switch (cmd) {
            case "update":
                updateProduct(request, response);
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
