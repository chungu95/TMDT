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
import model.Produce;

/**
 *
 * @author ADMIN
 */
public class ProduceDAO {

    public static Produce getProduceByID(String id) {
        Produce produce = null;
        Connection conn = Connector.getConnection();
        String sql = "select * from Produce WHERE ProduceID = ?;";
        try (PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, id);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    produce = new Produce(rs.getString("ProduceID"), rs.getString("ProduceName"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(conn);
        }
        return produce;
    }

    public static Produce getProduce(String Name) {
        Produce produce = null;
        Connection conn = Connector.getConnection();
        String sql = "select * from Produce WHERE ProduceName = ?;";
        try (PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, Name);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    produce = new Produce(rs.getString("ProduceID"), rs.getString("ProduceName"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(conn);
        }
        return produce;
    }

    public static ArrayList<Produce> getProduce() {
        ArrayList<Produce> produce = new ArrayList<>();
        Connection conn = Connector.getConnection();
        String sql = "select * from Produce;";
        try (PreparedStatement pr = conn.prepareStatement(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                produce.add(new Produce(rs.getString("ProduceID"), rs.getString("ProduceName")));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(conn);
        }
        return produce;
    }

    public static boolean insertProduce(Produce pro) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "INSERT into Produce "
                + "(ProduceID, ProduceName) "
                + "VALUES (?,?)";
        pro.setProduceID(RandomKey.randomKey());
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, pro.getProduceID());
            pr.setString(2, pro.getProduceName());
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);

    }

    public static void main(String[] args) {
//        ArrayList<Produce> produce = ProduceDAO.getProduce();
//        produce.forEach((item) -> {
//            System.out.println(item.getProduceID() + " | " + item.getProduceName());
//        });
//        System.out.println(ProduceDAO.getProduceByID("12345678").getProduceName());
        if (insertProduce(new Produce("018", "Trinh"))) {
            System.out.println("thành công!");
        } else {
            System.out.println("Thất bại!");
        }
    }

}
