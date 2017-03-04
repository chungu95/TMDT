/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

/**
 *
 * @author ADMIN
 */
public class FileIO {

    private static final String filePath = ".\\src\\java\\Logs\\";

    /**
     * @param logName
     * @param content
     */
    public static void writeLog(String logName, String content) {
        Calendar date = Calendar.getInstance();
        String log = "---> At: " + date.get(Calendar.HOUR) + ":" + date.get(Calendar.MINUTE) + ":" + date.get(Calendar.SECOND)
                + "\n\n *** " + logName + " *** \n\n"
                + content + "\n\n -----------------------------------------------------------------------------------\n\n";
        try {
            File file = new File(".\\src\\java\\Logs\\" + getFileName());
            if (!file.exists()) {
                file.createNewFile(); 
            }
            FileWriter fw = new FileWriter(file, true);
            try (BufferedWriter bw = new BufferedWriter(fw)) {
                bw.write(log);
            }
            System.out.println("done");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String getFileName() {
        String fileName = "";
        Calendar date = Calendar.getInstance();
        fileName = "Log_"+date.get(Calendar.DATE)+"-"+date.get(Calendar.MONTH)+"-"+date.get(Calendar.YEAR)+".txt";  
        return fileName;
    }

    public static void main(String[] args) {
        Calendar date = Calendar.getInstance();
        System.out.println(date.get(Calendar.HOUR) + ":" + date.get(Calendar.MINUTE) + ":" + date.get(Calendar.SECOND));
    }
}
