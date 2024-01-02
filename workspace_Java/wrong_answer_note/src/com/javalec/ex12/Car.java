package com.javalec.ex12;

public class Car extends Vehicle {
	int y;
	public Car() {
		super(10);
		// TODO Auto-generated constructor stub
	}
	public Car(int y) {
		super(y);
		this.y = y;
	}
	
	
	public String toString() {
		return super.x + ":" + this.y;
	}
	
	public static void main(String[] args) {
		
		Vehicle y1 = new Car();
		Vehicle y = new Car(20);
		System.out.println(y);
		System.out.println(y1);
		
		
		
	}
	
	
	
}
