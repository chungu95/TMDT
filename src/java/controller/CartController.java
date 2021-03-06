/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductsDAO;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Products;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
    }

    private void addProductToCart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart());
        }
        int productLocation = -1;
        Cart cart = (Cart) session.getAttribute("cart");
        String productID = request.getParameter("productID");
        Products product = ProductsDAO.getProductByID_Cart(productID);
        for (int i = 0; i < cart.getListProduct().size(); i++) {
            if (product.getProductID().equals(cart.getListProduct().get(i).getProductID())) {
                productLocation = i;
                System.out.println("xxx");
                break;
            }
        }
        if (productLocation == -1) {
            product.setQuantity(1);
            cart.getListProduct().add(product);
            System.out.println(cart.getListProduct().size());
            cart.updateTotalPrice();
            cart.updateTotalQuantity();
        } else {
            cart.getListProduct().get(productLocation).setQuantity(cart.getListProduct().get(productLocation).getQuantity() + 1);
            cart.updateTotalPrice();
            cart.updateTotalQuantity();
        }
        response.sendRedirect("./WEB/cart.jsp");
    }

    @SuppressWarnings("null")
    private void updateCart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String productID = request.getParameter("productID");
        if (cart == null) {
            response.sendRedirect("./WEB/cart.jsp");
        }
        for (int i = 0; i < cart.getListProduct().size(); i++) {
            if (productID.equals(cart.getListProduct().get(i).getProductID())) {
                cart.getListProduct().remove(i);
                cart.updateTotalPrice();
                cart.updateTotalQuantity();
                break;
            }
        }

    }

    @SuppressWarnings("null")
    private void deleteProductFormCart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            response.sendRedirect("./WEB/cart.jsp");
        }
        String productID = request.getParameter("productID");
        for (int i = 0; i < cart.getListProduct().size(); i++) {
            if (productID.equals(cart.getListProduct().get(i).getProductID())) {
                cart.getListProduct().remove(i);
                cart.updateTotalPrice();
                cart.updateTotalQuantity();
                break;
            }
        }
        response.sendRedirect("./WEB/cart.jsp");
    }

    @SuppressWarnings("null")
    private void subtractProductFormCart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            response.sendRedirect("./WEB/cart.jsp");
        }
        String productID = request.getParameter("productID");
        for (int i = 0; i < cart.getListProduct().size(); i++) {
            if (productID.equals(cart.getListProduct().get(i).getProductID())) {
                if (cart.getListProduct().get(i).getQuantity() == 1) {
                    deleteProduct(cart, productID); 
                } else {
                    cart.getListProduct().get(i).setQuantity(cart.getListProduct().get(i).getQuantity() - 1);
                    cart.updateTotalPrice();
                    cart.updateTotalQuantity();
                }
                break;
            }
        }
        response.sendRedirect("./WEB/cart.jsp");
    }

    private void deleteProduct(Cart cart, String productID) {
        for (int i = 0; i < cart.getListProduct().size(); i++) {
            if (productID.equals(cart.getListProduct().get(i).getProductID())) {
                cart.getListProduct().remove(i);
                cart.updateTotalPrice();
                cart.updateTotalQuantity();
                break;
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
        String cmd = request.getParameter("cmd");
        switch (cmd) {
            case "add":
                addProductToCart(request, response);
                break;
            case "update":
                updateCart(request, response);
                break;
            case "delete":
                deleteProductFormCart(request, response);
                break;
            case "subtract":
                subtractProductFormCart(request, response);
                break;
            // to do
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
