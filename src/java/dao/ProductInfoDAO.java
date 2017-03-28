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
import model.ProductInfo;

/**
 *
 * @author ADMIN
 */
public class ProductInfoDAO {

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
        }else{
            System.out.println("null");
        }
    }

}
