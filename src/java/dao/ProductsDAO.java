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
                    product.setProduceID(rs.getString("ProduceID")); 
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

    public static ArrayList<Products> getAllProduct(String sql) {
        ArrayList<Products> products = new ArrayList<>();
        Connection con = Connector.getConnection();
//        String sql = "SELECT * FROM Products ORDER BY ProductName ;";
        try (PreparedStatement pr = con.prepareCall(sql);
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
            System.out.println("query product");
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return products;
    }


    public static ArrayList<Products> getProducts(int start) {
        ArrayList<Products> products = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "SELECT * FROM Products ORDER BY ProductName ASC OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY ";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setInt(1, start);
            try (ResultSet rs = pr.executeQuery()) {
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
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return products;
    }

    public static int getQuantityOfProduct() {
        int quantity = 0;
        Connection con = Connector.getConnection();
        String sql = "SELECT COUNT(*) AS COUNT FROM Products; ";
        try (PreparedStatement pr = con.prepareCall(sql);
                ResultSet rs = pr.executeQuery()) {
            if (rs.next()) {
                quantity = rs.getInt("COUNT");
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }

        return quantity;
    }


    public static void main(String[] args) {

////        ArrayList<Products> productss = ProductsDAO.getAllProduct();
//        productss.forEach((item) -> {
//            System.out.println(item.getProductID() + " | " + item.getProductName());
//        });
//        System.out.println("---------------------------");
//        ArrayList<Products> products = ProductsDAO.getProducts(2);
//        products.forEach((item) -> {
//            System.out.println(item.getProductID() + " | " + item.getProductName());
//        });

//        ProductsDAO dao=new ProductsDAO();
//        for(Products p : dao.getListProductByProduceID(003)){
//            
//            System.out.println(p.getProductID() +" - "+  p.getProductName() );
//
//
//        System.out.println(ProductsDAO.getQuantityOfProduct());
//
//        Products pro = ProductsDAO.getProductByID("QWERTA");
//        if (pro != null) {
//            System.out.println(pro.getProductID() + " | " + pro.getProductName() + " | " + pro.getProductInfo().getModel());
//        } else {
//            System.out.println("null");
//
//        }
        
       // Products pro = ProductsDAO.getProductByID("QWERTA");
      //  if (pro != null) {
       //     System.out.println(pro.getProductID() + " | " + pro.getProductName() + " | " + pro.getProductInfo().getModel());
      //  } else {
      //      System.out.println("null");
      //  }
    }

}
