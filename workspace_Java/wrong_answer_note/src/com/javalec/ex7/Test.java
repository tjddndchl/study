package com.javalec.ex7;

import java.util.Date;

public class Test {
	public static void main(String[] args) {
		System.out.println("Hello  " + new StringBuilder("Java SE 8")); //생성자를 통해 문자열 받아서 사용
		
		//toString을 만들시 Java SE 8 값이 출력됨 설정 안할시 주소값 출력
		System.out.println("Hello " + new MyString("Java SE 8"));
		
		
		Date date= new Date(122, 6, 25);
		System.out.println(date);
		
		
		
		
		System.out.println(new Date(122, 6, 25)); // 생성자를 통해 객체 초기화
		
		
	}


}
