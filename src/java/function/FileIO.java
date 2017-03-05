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

    private static final String FILE_PATH = ".\\src\\java\\Logs\\";

    public static void writeLog(String logName, String content) {
        Calendar date = Calendar.getInstance();
        File file = new File(FILE_PATH + getFileName());
        String log = "---> At: "
                + date.get(Calendar.HOUR) + ":"
                + date.get(Calendar.MINUTE) + ":"
                + date.get(Calendar.SECOND)
                + "\n\n *** " + logName + " *** \n\n"
                + content
                + "\n\n ----------------------------------------------\n\n";

        try (FileWriter fw = new FileWriter(file, true);
                BufferedWriter bw = new BufferedWriter(fw)) {
            if (!file.exists()) {
                file.createNewFile();
            }
            bw.write(log);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private static String getFileName() {
        Calendar date = Calendar.getInstance();
        return "Log_"
                + date.get(Calendar.DATE) + "-"
                + date.get(Calendar.MONTH) + "-"
                + date.get(Calendar.YEAR)
                + ".txt";
    }
}
