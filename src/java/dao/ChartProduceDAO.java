/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import model.ChartProduce;
import model.Produce;

/**
 *
 * @author DELL
 */
public class ChartProduceDAO {

    public static ArrayList<ChartProduce> getALL() {
        ProduceDAO produce = new ProduceDAO();
        ProductsDAO pr = new ProductsDAO();
        ArrayList<ChartProduce> list = new ArrayList<>();
        for (Produce pro : ProduceDAO.getProduce()) {
            list.add(new ChartProduce(pr.getProductsByProduceID(pro.getProduceID()).size(),
                    pro.getProduceName()));
           
        }
        return list;
    }

    public static void main(String[] args) {
//  System.out.println(new ChartProduceDAO().getALL());
       for (ChartProduce v : new ChartProduceDAO().getALL()) {
            System.out.println(v.getProductName() + " - " + v.getValue());
        }
    }

}
