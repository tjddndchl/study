package com.javalec.ex4;

public class Ex4 {
	public static void main(String[] args) {
		String opt = "true";
		int x =1;
		int y = 1;
		String a= "ABC";
		switch ("ABC") {
		case "AVC":
			System.out.println("AVC");
			break;

		case "ABC":
			System.out.println("ABC");
			break;
		}
		
		
		
		
		
		
		//스위치 문에서 boolean 값에 대하 작동하지 않음 스위치 문은 java에서 int, String, 또는 열거형 변수와 같은 특정유형의 값을 허용
		switch (opt) {
		case "true":
			System.out.println("True");
			break;

		default:
			System.out.println("***");
		}
		
		System.out.println("Done");
	}
}
