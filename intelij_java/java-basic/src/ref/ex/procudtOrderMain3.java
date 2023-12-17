package ref.ex;

import java.util.Scanner;

public class procudtOrderMain3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("입력할 주문의 개수를 입력하세요");
        int n = scanner.nextInt(); //
        scanner.nextLine();


        productOrder[] orders = new productOrder[n];

        for (int i = 0; i <orders.length ; i++) {
            System.out.println((i+1) + "번째 주문 정보를 입력하세요");
            System.out.println("상품명:");
            String productName = scanner.nextLine();
            
            System.out.println("가격:");
            int price = scanner.nextInt();
            scanner.nextLine();
            System.out.println("수량:");
            int quantity = scanner.nextInt();
            scanner.nextLine(); // 입력버퍼를 비우기 위한 코드

            orders[i] = createOrder(productName, price, quantity);
        }



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