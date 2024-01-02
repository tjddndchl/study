package com.javalec.singletonex;

public class MainClass {
	public static void main(String[] args) {
		// TODO Auto-generated constructor stub
		FirstClass firstClass = new FirstClass();
		FirstClass secondClass = new FirstClass();
		
		System.out.println(firstClass);
		System.err.println(secondClass);
	
	
	}
}
