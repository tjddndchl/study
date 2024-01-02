package com.javalec.ex6;

import java.util.ArrayList;

public class Ex6 {
	public static void main(String[] args) {
		StringBuilder sb = new StringBuilder();
		ArrayList<String> a = new ArrayList<String>();
		ArrayList<String> b = new ArrayList<String>();
		
		a.add("A");
		a.add("A");
		a.add("A");
		a.add("A");
		a.add("A");
		
		b.add("B");
		b.add("B");
		b.add("B");
		b.add("B");
		b.add("A");
		b.add("A");
		b.add("A");
		
		System.out.println(a);
		a.removeAll(b); // 컬렉션에서 중복된 요소 제거할때 사용
		
		System.out.println(a);
		
		System.out.println(sb);
		String sb1 = "AVCV";
			
		sb.append("Hello").append("World!");
		System.out.println(sb);
		
		//sb.deleteAll(); // 안됨
		sb.delete(0, sb.length()); // StringBuilder size사용불가 size는 컬렉션에서 사용함
		
		System.out.println(1);
		System.out.println(sb + "1"); // 아예 빈 객체열이 아니라 " " 이 들어가있음
		sb.setLength(0);
		System.out.println(sb + "1");
	}
}
