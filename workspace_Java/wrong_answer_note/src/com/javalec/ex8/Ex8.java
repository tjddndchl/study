package com.javalec.ex8;

import java.util.ArrayList;
import java.util.List;

public class Ex8 {
	public static void main(String[] args) {
		List<String> arrayList =new ArrayList<String>();
		List<String> ab = new ArrayList<String>();
		
		
		arrayList.add("Tech");
		arrayList.add("Expert");
		arrayList.set(0, "Java");
		System.out.println(arrayList);
		arrayList.forEach(a -> {a.concat("group");
				System.out.println(a);
				}); //이렇게 해도 변경안됨
		arrayList.forEach(a -> {a = a.concat("group");
		System.out.println(a);
		}); //값을 넣어줘야지 변경됨
		
		arrayList.forEach(a -> {
		String abc = a.concat("Forum");
		System.out.println(abc);
		ab.add(abc);
		}); //forEach문은 요소를 직접 변경하지 않음
		System.out.println(ab); //foreach값을 넣어서 사용가능
		System.out.println(arrayList);
		arrayList.replaceAll(s -> s.concat("group"));
		System.out.println(arrayList);
	}
}
