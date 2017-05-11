/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;

/**
 *
 * @author ADMIN
 */
public class PaymentModule {

    public static String payment(java.lang.String remitterID, java.lang.String receiverID, java.math.BigInteger amount, java.lang.String orderID, java.lang.String password) {
        Payment.Payment_Service service = new Payment.Payment_Service();
        Payment.Payment port = service.getPaymentPort();
        return port.payment(remitterID, receiverID, amount, orderID, password);
    }
    
}
