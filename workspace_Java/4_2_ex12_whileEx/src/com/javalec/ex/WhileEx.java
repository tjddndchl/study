package com.javalec.ex;

public class WhileEx {
	public static void main(String[] args) {
		int i =0;
		int a = 0;
		while (i <= 100) {
			if(i % 3 == 0) {
				a += i;
			}
			i++;
			
		}
		System.out.println(a);
	}
}
