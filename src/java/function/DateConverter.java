/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author ADMIN
 */
public class DateConverter {

    public static Date date(String dateString) {
        Date sqlDate = null;
        try {
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date startDate = df.parse(dateString);
            sqlDate = new Date(startDate.getTime());
            System.out.println(sqlDate); 
        } catch (ParseException ex) {
            System.out.println(ex);
        }
        return sqlDate;
    }
    
    public static void main(String[] args) {
        Date date = date("10-02-1995"); 
        Calendar car = Calendar.getInstance();
        car.setTime(date); 
        System.out.println(car.get(Calendar.YEAR));  
    }

}
