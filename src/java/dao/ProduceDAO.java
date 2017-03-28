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

    public static void main(String[] args) {
        ArrayList<Produce> produce = ProduceDAO.getProduce();
        produce.forEach((item) -> {
            System.out.println(item.getProduceID() + " | " + item.getProduceName());
        });
        System.out.println(ProduceDAO.getProduceByID("12345678").getProduceName());
    }

}
