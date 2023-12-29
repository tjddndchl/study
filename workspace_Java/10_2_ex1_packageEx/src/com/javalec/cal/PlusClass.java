package com.javalec.cal;

public class PlusClass {
	private int a;
	private int b;
	
	public PlusClass() {
		System.out.println("plusClass 생성");
	}
	
	
	public int getA() {
		return a;
	}




	public void setA(int a) {
		this.a = a;
	}




	public int getB() {
		return b;
	}




	public void setB(int b) {
		this.b = b;
	}




	public int plus(int a, int b) {
		this.a = a;
		this.b = b;
		
		return a + b;
	}
}


