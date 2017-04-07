/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;

import java.net.MalformedURLException;
import model.Customers;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 *
 * @author ADMIN
 */
public class Email {

    public static final String MY_EMAIL = "tivistoresup@gmail.com";
    public static final String MY_PASSWORD = "deadline";

    public static void sendVerifyEmail(Customers customer, String hash) {
        try {
            HtmlEmail email = new HtmlEmail();

            email.setHostName("smtp.googlemail.com");
            email.setSmtpPort(465);
            email.setAuthenticator(new DefaultAuthenticator(
                    MY_EMAIL, MY_PASSWORD));
            email.setSSLOnConnect(true);
            email.setFrom(MY_EMAIL);
            email.addTo(customer.getEmail());
            email.setSubject("Xác nhận tài khoản TiviStore");
            email.setHtmlMsg("<html><h2>Chào " + customer.getCustomerName() + ",</h2>"
                    + "<div><b>Vui lòng click vào <a href='http://localhost:8084/ThuongMaiDienTu/Verify?u="
                    + customer.getCustomerID() + "&hash="
                    + hash + "'>đây</a> để xác nhận tài khoản...</b></div><br />"
                    + "<b>Cảm ơn bạn đã ủng hộ!!!</b></div>"
                    + "</html>");
            email.setCharset("UTF-8");
            email.setTextMsg("Trình duyệt không hỗ trợ định dạng html!");
            String a = email.send();
            System.out.println(a);
        } catch (EmailException eex) {
            System.err.println(eex);
        }
    }

    public static void main(String[] args) throws EmailException, MalformedURLException {

    }

}
