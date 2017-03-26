/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Products;

/**
 *
 * @author ADMIN
 */
public class ProductsDAO {

    @SuppressWarnings("null")
    public static Products getProductByID(String productID) {
        Products product = null;
        Connection conn = Connector.getConnection();
        String sql = "SELECT * FROM Products WHERE ProductID = ?";
        try (PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, productID);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    product = new Products(productID);
                    product.setProductName(rs.getString("ProductName"));
                    product.setProductImg(rs.getString("ProductImg"));
                    product.setPrice(rs.getInt("Price"));
                    product.setDescription(rs.getString("Description"));
                    product.setQuantity(rs.getInt("Quantity"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(conn);
        }
        product.setProductInfo(ProductInfoDAO.getProductInfo(productID));
        return product;
    }

    public static ArrayList<Products> getAllProduct() {
        ArrayList<Products> products = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "SELECT * FROM Products;";
        try (PreparedStatement pr = con.prepareStatement(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                String ProductID = rs.getString("ProductID");
                String productName = rs.getNString("ProductName");
                String produceID = rs.getString("ProduceID");
                int Price = (rs.getInt("Price"));
                String Description = rs.getString("Description");
                int quantity = rs.getInt("Quantity");
                String ProductImg = rs.getString("ProductImg");
                products.add(new Products(ProductID, productName, Price, Description, quantity, ProductImg, produceID));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return products;
    }

    public static void main(String[] args) {
//        ArrayList<Products> products = ProductsDAO.getAllProduct();
//        products.forEach((item) -> {
//            System.out.println(item.getProductID() + " | " + item.getProductName());
//        });

        Products pro = ProductsDAO.getProductByID("QWERTA");
        if (pro != null) {
            System.out.println(pro.getProductID() + " | " + pro.getProductName() + " | " + pro.getProductInfo().getVideoFormat());
        } else {
            System.out.println("null");
        }
    }

}
