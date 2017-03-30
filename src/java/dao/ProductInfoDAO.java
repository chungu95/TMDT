/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import function.RandomKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.ProductInfo;

/**
 *
 * @author ADMIN
 */
public class ProductInfoDAO {

    public static boolean insertProductInfo(ProductInfo productInfo) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "INSERT into ProductInfo (ProductID, ProductType, Resolution, HDMI, USB, Model, Size, Warranty) "
                + "VALUES (?,?,?,?,?,?,?,?)";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, productInfo.getProductID());
            pr.setString(2, productInfo.getProductType());
            pr.setString(3, productInfo.getResolution());
            pr.setString(4, productInfo.getHdmi());
            pr.setString(5, productInfo.getUsb());
            pr.setString(6, productInfo.getModel());
            pr.setString(7, productInfo.getSize());
            pr.setString(8, productInfo.getWarranty());
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static boolean updateProductInfo(ProductInfo productInfo) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE ProductInfo SET ProductType = ?, Resolution = ?, HDMI = ?, USB = ?, Model = ?, Size = ?, Warranty = ? WHERE ProductID = ?";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, productInfo.getProductType());
            pr.setString(2, productInfo.getResolution());
            pr.setString(3, productInfo.getHdmi());
            pr.setString(4, productInfo.getUsb());
            pr.setString(5, productInfo.getModel());
            pr.setString(6, productInfo.getSize());
            pr.setString(7, productInfo.getWarranty());
            pr.setString(8, productInfo.getProductID());
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }
    
    

    public static ProductInfo getProductInfo(String productID) {
        ProductInfo productInfo = null;
        Connection conn = Connector.getConnection();
        String sql = "SELECT * FROM ProductInfo WHERE ProductID = ?";
        try (PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, productID);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    productInfo = new ProductInfo();
                    productInfo.setProductID(productID);
                    productInfo.setProductType(rs.getString("ProductType"));
                    productInfo.setModel(rs.getString("Model"));
                    productInfo.setHdmi(rs.getString("HDMI"));
                    productInfo.setResolution(rs.getString("Resolution"));
                    productInfo.setUsb(rs.getString("USB"));
                    productInfo.setSize(rs.getString("Size"));
                    productInfo.setWarranty(rs.getString("Warranty"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(conn);
        }
        return productInfo;
    }

    public static void main(String[] args) {
        ProductInfo pr = ProductInfoDAO.getProductInfo("QWERTA");
        if (pr != null) {
            System.out.println(pr.getProductID() + " | " + pr.getProductType() + " | " + pr.getUsb() + " | " + pr.getModel());
        } else {
            System.out.println("null");
        }
    }

}
