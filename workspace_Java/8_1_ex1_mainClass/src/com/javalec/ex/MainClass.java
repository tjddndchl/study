package com.javalec.ex;

import com.javalec.human.WomanClass;

public class MainClass {
	public static void main(String[] args) {
		
		ManClass mc = new ManClass();
		ManClass mc1 =new ManClass(15, 180, 900000, "010-4552-6593");
		
		mc.setAge(17);
		System.out.println(mc.getAge());
		
		mc.getAge();
		
		double d = mc1.calculateBMI();
		
		
		System.out.println(d);
	}
}
