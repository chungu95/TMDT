/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.ChartEmployee;
import model.ChartProduce;
import model.Employees;

/**
 *
 * @author DELL
 */
public class ChartEmployeeDAO {

    public static ArrayList<ChartEmployee> getALL() {
        EmployeeDAO emp = new EmployeeDAO();
        OrderDAO pr = new OrderDAO();
        ArrayList<ChartEmployee> list = new ArrayList<>();
        for (Employees pro : emp.getAllEmployees()) {
            list.add(new ChartEmployee(pr.getProductsByProduceID(pro.getEmployeeID()).size(),
                    pro.getName()));

        }
        return list;
    }
    
    public static void main(String[] args) {
//  System.out.println(new ChartProduceDAO().getALL());
       for (ChartEmployee v : new ChartEmployeeDAO().getALL()) {
            System.out.println(v. getEmployeeName() + " - " + v.getValue());
        }
    }
}
