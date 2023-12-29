package com.javalec.calssImport;

import com.javalec.cal.PlusClass;

public class MainClass {
	
	public static void main(String[] args) {
		PlusClass plusClass = new PlusClass();
		int result = plusClass.plus(3, 7);
		
		System.out.println(result);
		
		System.out.println( plusClass.getA());
		System.out.println( plusClass.getB());
	}

}
