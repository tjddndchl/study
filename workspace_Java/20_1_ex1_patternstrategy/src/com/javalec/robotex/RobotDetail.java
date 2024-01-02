package com.javalec.robotex;

public interface RobotDetail {
	
	int price = 3500;
	
	public void sound();
	
	public void move();
	
	public  void fast();
	
	public static void main(String[] args) {
		System.out.println(price);
	}
}
