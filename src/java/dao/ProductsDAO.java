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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ProductInfo;
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

    @SuppressWarnings("null")
    public static Products getProductByID_Cart(String productID) {
        Products product = null;
        Connection conn = Connector.getConnection();
        String sql = "SELECT ProductID, ProductName, Price FROM Products WHERE ProductID = ?";
        try (PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, productID);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    product = new Products(productID);
                    product.setProductID(rs.getString("ProductID"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setPrice(rs.getInt("Price"));
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

    public static ArrayList<Products> getProductsByProduceID(String ProduceID) {
        ArrayList<Products> products = new ArrayList<>();
        Connection con = Connector.getConnection();
//        String sql = "SELECT * FROM Products WHERE ProduceID = " + ProduceID + "'";
        String sql = "SELECT * FROM Products WHERE ProduceID = ?";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, ProduceID);
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

    // insertProduct: 
    // Cai nay ham khoi tao ba cho no khoi tao ten sp, ma nsx, gia tien, mota, so luong,linkanh, voi 1 cai nua la Product info nha
    public static boolean insertProduct(Products product) {
        int result1 = 0;
        boolean result = false;
        Connection con = Connector.getConnection();
        String sql = "INSERT into Products (ProductID, ProductName, ProduceID, Price, Description, Quantity, ProductImg) "
                + "VALUES (?,?,?,?,?,?,?)";
        product.setProductID(RandomKey.randomKey()); //day la cho gan masp
        product.getProductInfo().setProductID(product.getProductID()); // cai  nay cho productInfo
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, product.getProductID());
            pr.setString(2, product.getProductName());
            pr.setString(3, product.getProduceID());
            pr.setInt(4, product.getPrice());
            pr.setString(5, product.getDescription());
            pr.setInt(6, product.getQuantity());
            pr.setString(7, product.getProductImg());
            result1 = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        if (result1 != 0) {
            if (ProductInfoDAO.insertProductInfo(product.getProductInfo())) {
                result = true;
            } else {
                deleteProduct(product.getProductID()); // Neu them sp xong ma khong them dc info thi xoa  luon cai sp vua them.
            }
        }
        return result;
    }

    public static boolean updateProduct(Products product) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE Products SET ProductName = ?, ProduceID = ?, Price = ?, Description = ?, Quantity = ? WHERE ProductID = ?";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, product.getProductName());
            pr.setString(2, product.getProduceID());
            pr.setInt(3, product.getPrice());
            pr.setString(4, product.getDescription());
            pr.setInt(5, product.getQuantity());            
            pr.setString(6, product.getProductID());
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        if (product.getProductInfo() != null) {
            ProductInfoDAO.updateProductInfo(product.getProductInfo());
        }
        return (result != 0);
    }

    public static boolean deleteProduct(String productID) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "DELETE FROM Products WHERE ProductID = ?";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, productID);
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static ArrayList<Products> search_SanPham(String s) {
        ArrayList<Products> list = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "select * from Products where ProductName like '%" + s + "%'";
        try (PreparedStatement ps = con.prepareCall(sql);
                ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                Products sanpham = new Products();
                sanpham.setProductID(rs.getString("ProductID"));
                sanpham.setProductName(rs.getString("ProductName"));
                sanpham.setPrice(rs.getInt("Price"));
                sanpham.setDescription(rs.getString("Description"));
                sanpham.setQuantity(rs.getInt("Quantity"));
                list.add(sanpham);
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        } finally {
            Connector.close(con);
        }
        return list;
    }

    public static ArrayList<Products> getProductsByProduceslocsp(String ProduceID, String Price1, String Size) {
        ArrayList<Products> products = new ArrayList<>();
        Connection con = Connector.getConnection();
//        String sql = "SELECT * FROM Products WHERE ProduceID = " + ProduceID + "'";
        String sql = "";
        if (ProduceID.equals("") && Price1.equals("") && Size.equals("")) {
            sql = "SELECT* FROM Products ";
        } else if (!ProduceID.equals("") && Price1.equals("") && Size.equals("")) {
            sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  ProduceID ='" + ProduceID + "'";
        } else if (ProduceID.equals("") && !Price1.equals("") && Size.equals("")) {
            if (Integer.parseInt(Price1) == 1) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  Price <5000000";
            } else if (Integer.parseInt(Price1) == 2) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  Price >= 5000000 and Price <= 7000000";
            } else if (Integer.parseInt(Price1) == 3) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  Price >7000000 and Price <= 10000000";
            } else if (Integer.parseInt(Price1) == 4) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where   Price >10000000";
            }

        } else if (ProduceID.equals("") && Price1.equals("") && !Size.equals("")) {
            sql = "SELECT *"
                    + "FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID"
                    + " where  Size='" + Size + "'";
        } else if (!ProduceID.equals("") && !Price1.equals("") && Size.equals("")) {
            if (Integer.parseInt(Price1) == 1) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  ProduceID ='" + ProduceID + "' and Price <5000000";
            } else if (Integer.parseInt(Price1) == 2) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  ProduceID ='" + ProduceID + "' and  Price >= 5000000 and Price <= 7000000";
            } else if (Integer.parseInt(Price1) == 3) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  ProduceID ='" + ProduceID + "' and  Price >7000000 and Price <= 10000000";
            } else if (Integer.parseInt(Price1) == 4) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  ProduceID ='" + ProduceID + "' and   Price >10000000";
            }

        } else if (!ProduceID.equals("") && Price1.equals("") && !Size.equals("")) {

            sql = "SELECT *"
                    + "FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID"
                    + " where  Size='" + Size + "' and ProduceID='" + ProduceID + "'";
        } else if (ProduceID.equals("") && !Price1.equals("") && !Size.equals("")) {
            if (Integer.parseInt(Price1) == 1) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  Size ='" + Size + "' and Price <5000000";
            } else if (Integer.parseInt(Price1) == 2) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  Size  ='" + Size + "' and  Price >= 5000000 and Price <= 7000000";
            } else if (Integer.parseInt(Price1) == 3) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  Size  ='" + Size + "' and  Price >7000000 and Price <= 10000000";
            } else if (Integer.parseInt(Price1) == 4) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where  Size  ='" + Size + "' and   Price >10000000";
            }

        } else if (!ProduceID.equals("") && !Price1.equals("") && !Size.equals("")) {

            if (Integer.parseInt(Price1) == 1) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where ProduceID ='" + ProduceID + "' and Size ='" + Size + "' and Price <5000000";
            } else if (Integer.parseInt(Price1) == 2) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where ProduceID ='" + ProduceID + "' and Size  ='" + Size + "' and  Price >= 5000000 and Price <= 7000000";
            } else if (Integer.parseInt(Price1) == 3) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where ProduceID ='" + ProduceID + "' and Size  ='" + Size + "' and  Price >7000000 and Price <= 10000000";
            } else if (Integer.parseInt(Price1) == 4) {
                sql = "SELECT * FROM Products as sp INNER JOIN ProductInfo as inf on sp.ProductID=inf.ProductID where ProduceID ='" + ProduceID + "' and Size  ='" + Size + "' and   Price >10000000";
            }
        }

        try (PreparedStatement pr = con.prepareCall(sql)) {

            try (ResultSet rs = pr.executeQuery()) {
                while (rs.next()) {
                    String ProductID = rs.getString("ProductID");
                    String productName = rs.getNString("ProductName");
                    String produceID = rs.getString("ProduceID");
                    int Price = rs.getInt("Price");
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


    public static void main(String[] args) {
        System.out.println(ProductsDAO.getProductsByProduceslocsp("002", "", "").toString());
//=======
////        // day la cai chay thu. Ba dua vao 2 cai ham khoi tao  nay de lay du lieu cho hop ly nha.
//
////        ProductInfo prinfo = new ProductInfo("Smart TV", "FULL HD", "CÓ", "3.0 5.0", "WTF?", "300x400", "5 tháng"); // khong them masp
////        Products product = new Products("Led 2", 50000000, "hihi", 50, "002/t1.jpg", prinfo, "56723456"); //ko khoi tao masp.
////        if (ProductsDAO.insertProduct(product)) { 
////            System.out.println("thêm thành công");
////        } else {
////            System.out.println("thêm thất bại");
////        }
//        ArrayList<Products> product = ProductsDAO.getProductsByProduceID("008");
//        product.forEach((item) -> {

//            System.out.println(item.getProductID() + " | " + item.getProductName());
//        });
////        System.out.println("---------------------------");
////        ArrayList<Products> products = ProductsDAO.getProducts(2);
////        products.forEach((item) -> {
////            System.out.println(item.getProductID() + " | " + item.getProductName());
////        });
////        ProductsDAO dao=new ProductsDAO();
////        for(Products p : dao.getListProductByProduceID(003)){
////            
////            System.out.println(p.getProductID() +" - "+  p.getProductName() );
////
////
////        System.out.println(ProductsDAO.getQuantityOfProduct());
////
////        Products pro = ProductsDAO.getProductByID("QWERTA");
////        if (pro != null) {
////            System.out.println(pro.getProductID() + " | " + pro.getProductName() + " | " + pro.getProductInfo().getModel());
////        } else {
////            System.out.println("null");
////
////        }
//        // Products pro = ProductsDAO.getProductByID("QWERTA");
//        //  if (pro != null) {
//        //     System.out.println(pro.getProductID() + " | " + pro.getProductName() + " | " + pro.getProductInfo().getModel());
//        //  } else {
//        //      System.out.println("null");
//        //  }
//>>>>>>> dev
    }

}
