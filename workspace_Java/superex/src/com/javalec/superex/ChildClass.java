package com.javalec.superex;

public class ChildClass extends ParentClass {
	
	public ChildClass() {
		// TODO Auto-generated constructor stub
		System.out.println("ChildClass");
	}
	@Override
	public void method1() {
		// TODO Auto-generated method stub
		super.method1();
		
		System.out.println("ChildClass의 method1() 입니다.");
	}
}
