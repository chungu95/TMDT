/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DELL
 */
public class ChartEmployee {
     private int value;
    private String employeeName;

    public ChartEmployee() {
    }

    public ChartEmployee(int value, String employeeName) {
        this.value = value;
        this.employeeName = employeeName;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    @Override
    public String toString() {
        return  employeeName;
    }
    
}
