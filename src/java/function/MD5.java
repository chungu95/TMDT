/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author ADMIN
 */
public class MD5 {

    public static String encryptMD5(String input) throws NoSuchAlgorithmException {
        MessageDigest MD = MessageDigest.getInstance("MD5");
        byte[] messageDigest = MD.digest(input.getBytes());
        BigInteger number = new BigInteger(1, messageDigest);
        String outPut = number.toString(16);
        while (outPut.length() < 32) {
            outPut = "0" + outPut;
        }
        return outPut;
    }
}
