package class1.ex;

public class procudtOrderMain {
    public static void main(String[] args) {
        productOrder[] orders = new productOrder[3];

        productOrder order1 = new productOrder();
        order1.productName = "두부";
        order1.price = 2000;
        order1.quantity = 2;
        orders[0] = order1;

        productOrder order2 = new productOrder();
        order2.productName = "김치";
        order2.price = 5000;
        order2.quantity = 1;
        orders[1] = order2;

        productOrder order3 = new productOrder();
        order3.productName = "콜라";
        order3.price = 1500;
        order3.quantity = 2;
        orders[2] = order3;

        int totalAmount = 0;

        for (productOrder order : orders) {
            System.out.println("상품명 :" + order.productName + "가격 :" + order.price + "수량 : " + order.quantity);
            totalAmount += order.price * order.quantity;
        }

        System.out.println("총 결재금액 :" + totalAmount);




    }
}
