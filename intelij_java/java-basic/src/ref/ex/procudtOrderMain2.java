package ref.ex;

public class procudtOrderMain2 {
    public static void main(String[] args) {
        productOrder[] orders = new productOrder[3];

      orders[0] = createOrder("두부", 2000, 2);
      orders[1] = createOrder("김치", 5000, 1);
      orders[2] = createOrder("콜라", 1500, 2);

      printOrders(orders);


      int totalAmount = getTotalAmount(orders);



      System.out.println("총 결재금액 :" + totalAmount);

    }

    static productOrder createOrder(String productName, int price, int quantity){
        productOrder order = new productOrder();
        order.productName = productName;
        order.price = price;
        order.quantity = quantity;
        return order;
    }

    static void printOrders(productOrder[] orders){
        for (productOrder order : orders) {
            System.out.println("상품명 :" + order.productName + "가격 :" + order.price + "수량 : " + order.quantity);
        }
    }

    static int getTotalAmount(productOrder[] orders){
        int totalAmount = 0;
        for (productOrder order : orders) {
            totalAmount += order.price * order.quantity;
        }
        return totalAmount;
    }
}