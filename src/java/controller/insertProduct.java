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
@WebServlet(name = "insertProduct", urlPatterns = {"/insertProduct"})
public class insertProduct extends HttpServlet {

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

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String productType = null;
        String resolution = null;
        String hdmi = null;
        String usb = null;
        String model = null;
        String size = null;
        String warranty = null;

        String productName = null;
        int price = 0;
        String description = null;
        Integer quantity = null;
        String produceID = null;
        String image = null;

        String uploadDirectory = "/Product/Images";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
        File uploadDir;
        File storeFile;
        try {
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadDirectory + File.separator + fileName;
                        storeFile = new File(filePath);
                        item.write(storeFile);
                        image = produceID + "/" + fileName;
                        System.out.println(storeFile.getPath());
                    } else {
                        switch (item.getFieldName()) {
                            case "productName":
                                productName = item.getString("UTF-8");
                                break;
                            case "produceID": {
                                produceID = item.getString("UTF-8");
                                uploadDir = new File(uploadPath + uploadDirectory + "/" + produceID);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdir();
                                }
                                uploadDirectory = uploadPath + uploadDirectory + "/" + produceID;
                                break;
                            }
                            case "price":
                                price = (Integer.parseInt(item.getString("UTF-8")));
                                break;
                            case "quantity":
                                quantity = (Integer.parseInt(item.getString("UTF-8")));
                                break;
                            case "productType":
                                productType = item.getString("UTF-8");
                                break;
                            case "resolution":
                                resolution = item.getString("UTF-8");
                                break;
                            case "hdmi":
                                hdmi = item.getString("UTF-8");
                                break;
                            case "usb":
                                usb = item.getString("UTF-8");
                                break;
                            case "Model":
                                model = item.getString("UTF-8");
                                break;
                            case "size":
                                size = item.getString("UTF-8");
                                break;
                            case "warranty":
                                warranty = item.getString("UTF-8");
                                break;
                            case "description": {
                                description = item.getString("UTF-8");
                                System.out.println(description);
                                break;
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }

        @SuppressWarnings("null")
        ProductInfo prinfo = new ProductInfo(productType, resolution, hdmi, usb, model, size, warranty);
        Products product = new Products(productName, price, description, quantity, image, prinfo, produceID);

        if (ProductsDAO.insertProduct(product)) {
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        insertProduct(request, response);
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
