package com.javalec.inex;

public class MainClass {
	public static void main(String[] args) {
		
		ChildClass childClass = new ChildClass();
		
		System.out.println(childClass.cStr);
		
		System.out.println(childClass.getPapaName());
		System.out.println(childClass.getMamiName());
		
		
		
	}
}
