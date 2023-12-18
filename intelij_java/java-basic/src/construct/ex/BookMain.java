package construct.ex;

public class BookMain {
    public static void main(String[] args) {
        //기본 생성자 사용
        Book book1 = new Book();
        book1.displayInfo();

        Book book2 = new Book("자바", "김영한");
        book2.displayInfo();

        Book book3 = new Book("JPA프로그래밍", "KIM", 700);
        book3.displayInfo();
    }
}
