package org.yes.cart.payment.impl;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import org.yes.cart.payment.service.CustomerOrderPaymentService;
import org.yes.cart.payment.persistence.entity.PaymentGatewayParameter;
import org.yes.cart.payment.dto.Payment;
import org.yes.cart.payment.PaymentGateway;
import org.yes.cart.domain.entity.CustomerOrder;
import org.yes.cart.domain.entity.CustomerOrderDelivery;

import java.util.UUID;
import java.util.Iterator;

/**
 *
 * PayFlow payment gateway test.
 *
 * User: Igor Azarny iazarny@yahoo.com
 * Date: 09-May-2011
 * Time: 14:12:54
 */
public class PayflowPaymentGatewayImplTest extends CappPaymentModuleDBTestCase {
    
    private PaymentProcessorSurrogate paymentProcessor = null;
    private PayflowPaymentGatewayImpl payflowPaymentGateway = null;
    private CustomerOrderPaymentService customerOrderPaymentService = null;

    private boolean isTestAllowed() {
        return "true".equals(System.getProperty("testPgPayFlow"));
    }

    @Before
    public void setUp() throws Exception {
        if (isTestAllowed()) {
            super.setUp();
            customerOrderPaymentService = (CustomerOrderPaymentService) ctx.getBean("customerOrderPaymentService");
            payflowPaymentGateway = (PayflowPaymentGatewayImpl) ctx.getBean("payflowPaymentGateway");
            paymentProcessor = new PaymentProcessorSurrogate(customerOrderPaymentService, payflowPaymentGateway);
        }
    }

    @After
    public void tearDown() throws Exception {
        if (isTestAllowed()) {
            paymentProcessor = null;
            payflowPaymentGateway = null;
            customerOrderPaymentService = null;
            super.tearDown();

        }
    }

     public String getVisaCardNumber() {
        /*
        from     http://wiki.avectra.com/PayFlow_Pro
Visa: 4111111111111111
MasterCard: 5555555555554444
AmEx: 378282246310005
Discover: 6011111111111117
*/
         return "4111111111111111";
     }


    @Test
    public void testGetPaymentGatewayParameters() {
        if (isTestAllowed()) {
            for (PaymentGatewayParameter parameter : payflowPaymentGateway.getPaymentGatewayParameters()) {
                assertEquals("payflowPaymentGateway", parameter.getPgLabel());
            }
        }
    }

    @Test
    public void testAuthPlusReverseAuthorization() {
        if (isTestAllowed()) {


            try {
               final String orderNum = UUID.randomUUID().toString();


            final CustomerOrder customerOrder = createCustomerOrder(orderNum);

            // The whole operation is completed successfully
            assertEquals
                    (Payment.PAYMENT_STATUS_OK,
                            paymentProcessor.authorize(
                                    customerOrder,
                                    createCardParameters()));

            assertEquals(
                    2,
                    customerOrderPaymentService.findBy(
                            orderNum,
                            null,
                            Payment.PAYMENT_STATUS_OK,
                            PaymentGateway.AUTH).size());


            //lets perform reverse authorization
            paymentProcessor.reverseAuthorizatios(orderNum);

            //two records for reverse
            assertEquals(
                    2,
                    customerOrderPaymentService.findBy(
                            orderNum,
                            null,
                            Payment.PAYMENT_STATUS_OK,
                            PaymentGateway.REVERSE_AUTH).size());

            //total 54 records
            assertEquals(
                    4,
                    customerOrderPaymentService.findBy(
                            orderNum,
                            null,
                            Payment.PAYMENT_STATUS_OK,
                            null).size());
            } finally {
                dumpDataBase("testAuthPlusReverseAuthorization", new String[]{"TCUSTOMERORDERPAYMENT"});
            }






        }
    }


    @Test
    public void testAuthPlusCapture() {
        if (isTestAllowed()) {

            try {
                final String orderNum = UUID.randomUUID().toString();


            final CustomerOrder customerOrder = createCustomerOrder(orderNum);

            // The whole operation is completed successfully
            assertEquals
                    (Payment.PAYMENT_STATUS_OK,
                            paymentProcessor.authorize(
                                    customerOrder,
                                    createCardParameters()));

            assertEquals(
                    2,
                    customerOrderPaymentService.findBy(
                            orderNum,
                            null,
                            Payment.PAYMENT_STATUS_OK,
                            PaymentGateway.AUTH).size());

            //capture on first completed shipment
            Iterator<CustomerOrderDelivery> iter = customerOrder.getDelivery().iterator();

            assertEquals
                    (Payment.PAYMENT_STATUS_OK,
                            paymentProcessor.shipmentComplete(customerOrder, iter.next().getDevileryNum()));
            assertEquals(
                    1,
                    customerOrderPaymentService.findBy(
                            orderNum,
                            null,
                            Payment.PAYMENT_STATUS_OK,
                            PaymentGateway.CAPTURE).size());

            //capture on second completed shipment
            assertEquals
                    (Payment.PAYMENT_STATUS_OK,
                            paymentProcessor.shipmentComplete(customerOrder, iter.next().getDevileryNum()));
            assertEquals(
                    2,
                    customerOrderPaymentService.findBy(
                            orderNum,
                            null,
                            Payment.PAYMENT_STATUS_OK,
                            PaymentGateway.CAPTURE).size());
            } finally {
                dumpDataBase("testAuthPlusCapture", new String[]{"TCUSTOMERORDERPAYMENT"});
            }





        }
    }


    @Test
    public void testAuthPlusCapturePlusVoidCapture() {
        if (isTestAllowed()) {

            try {
                orderCancelationFlow(false);
            } finally {
                dumpDataBase("void", new String[]{"TCUSTOMERORDERPAYMENT"});
            }

        }
    }

    @Test
    public void testAuthPlusCapturePlusRefund() {
        //??? how to submit settlement
        if (isTestAllowed()) {

            try {
                orderCancelationFlow(true);
            } finally {
                dumpDataBase("refund", new String[]{"TCUSTOMERORDERPAYMENT"});
            }

        }
    }

    private void orderCancelationFlow(boolean useRefund) {
        final String orderNum = UUID.randomUUID().toString();


        final CustomerOrder customerOrder = createCustomerOrder(orderNum);

        // The whole operation is completed successfully
        assertEquals
                (Payment.PAYMENT_STATUS_OK,
                        paymentProcessor.authorize(
                                customerOrder,
                                createCardParameters()));

        assertEquals(
                2,
                customerOrderPaymentService.findBy(
                        orderNum,
                        null,
                        Payment.PAYMENT_STATUS_OK,
                        PaymentGateway.AUTH).size());

        //capture on first completed shipment
        Iterator<CustomerOrderDelivery> iter = customerOrder.getDelivery().iterator();

        paymentProcessor.shipmentComplete(customerOrder, iter.next().getDevileryNum());
        assertEquals(
                1,
                customerOrderPaymentService.findBy(
                        orderNum,
                        null,
                        Payment.PAYMENT_STATUS_OK,
                        PaymentGateway.CAPTURE).size());

        //capture on second completed shipment
        paymentProcessor.shipmentComplete(customerOrder, iter.next().getDevileryNum());
        assertEquals(
                2,
                customerOrderPaymentService.findBy(
                        orderNum,
                        null,
                        Payment.PAYMENT_STATUS_OK,
                        PaymentGateway.CAPTURE).size());

        //lets void capture

        assertEquals
                (Payment.PAYMENT_STATUS_OK,
                        paymentProcessor.cancelOrder(customerOrder, useRefund));
        assertEquals(
                2,
                customerOrderPaymentService.findBy(
                        orderNum,
                        null,
                        Payment.PAYMENT_STATUS_OK,
                        useRefund? PaymentGateway.REFUND: PaymentGateway.VOID_CAPTURE).size());

        assertEquals(
                6,
                customerOrderPaymentService.findBy(
                        orderNum,
                        null,
                        Payment.PAYMENT_STATUS_OK,
                        null).size());
    }
}
