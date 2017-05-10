/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.ChartOrder;
import model.Oders;

/**
 *
 * @author DELL
 */
public class ChartOrderDAO {

    public static ArrayList<ChartOrder> getAll() {
        OrderDAO order = new OrderDAO();
        ArrayList<ChartOrder> list = new ArrayList<>();
        for (String t : OrderDAO.getOrderStatus()) {
            list.add(new ChartOrder(order.getOrderByStatus(t.toString()).size(),
                    t.toString()));
        }
        return list;
    }

    public static void main(String[] args) {
        for (ChartOrder v : new ChartOrderDAO().getAll()) {
            System.out.println(v.getOrderStatus() + "- " + v.getValue());
        }
    }
}
