package oop.ex;

public class Rectangle {
    int width;
    int height;



    int calculateArea(){
       int area = width * height;
        System.out.println("넓이:" + area);
        return area;

    }

    int calculaterPerimeter(){
        int perimeter =( width *2) + (height * 2);
        System.out.println("둘레 길이:" + perimeter);
        return 2*(width)*(height);
    }

    boolean isSquare(){
        System.out.println(width==height);
        return width == height;
    }
}
