package oop.ex;

public class RectangleOopMain {
    public static void main(String[] args) {
        Rectangle rectangle = new Rectangle();
        rectangle.width =8;
        rectangle.height = 8;

        int area =rectangle.calculateArea();
        System.out.println(area);
        rectangle.calculaterPerimeter();
        rectangle.isSquare();
    }
}
