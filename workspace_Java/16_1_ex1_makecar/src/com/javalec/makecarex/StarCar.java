package com.javalec.makecarex;

public class StarCar {
    private String color;
    private String tire;
    private int displacement;
    private String handle;
    private int tax = 1000;

    public StarCar(String color, String tire, int displacement, String handle) {
        this.color = color;
        this.tire = tire;
        this.displacement = displacement;
        this.handle = handle;
       
    }

    public void getSpec() {
        System.out.println("***********");
        System.out.println("색상: " + color);
        System.out.println("타이어: " + tire);
        System.out.println("배기량: " + displacement);
        System.out.println("핸들: " + handle);
        if(displacement > 2000) tax = 1500;
        
        
        System.out.println("세금: " + tax);
        System.out.println("************");
    }
}
