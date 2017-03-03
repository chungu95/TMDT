/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connector;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *
 * @author ADMIN
 */
public class FileReader {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            String input = ".\\src\\java\\Logs\\test.txt";
            FileInputStream fis = new FileInputStream(new File(input));
            BufferedReader br = new BufferedReader(new InputStreamReader(fis));
            String line;
            while ((line = br.readLine()) != null) {
                line = line.trim();
                if (line != null && !line.isEmpty()) {
                    System.out.println("line data: " + line);
                }
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    }
    

