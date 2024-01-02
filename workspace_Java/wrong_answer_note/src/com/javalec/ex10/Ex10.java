package com.javalec.ex10;

public class Ex10 {
	public static void main(String[] args) {
		double y1 = 2023.22;
		//float fit = y1; //에라발생
		float fit = (float)y1;
		
		float fit1 = (float)1_11.00; //_ 숫자리터럴표시
		System.out.println(fit1);
		int a = 075_46; 
		System.out.println(a);
		
		int y2 = 100;
		float fit2 = (float)y2;
		
		float fit3 = 100.12132F; 
		System.out.println(fit3);
		
	}
}
