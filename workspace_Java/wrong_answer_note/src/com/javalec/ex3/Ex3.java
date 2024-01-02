package com.javalec.ex3;

import java.util.ArrayList;

public class Ex3 {
	public static void main(String[] args) {
		String[] strs = {"A", "B"};
		int idx = 0;
		ArrayList<String> word = new ArrayList<String>();
		
		for (String string : strs) {
		System.out.println(strs[idx].concat("element " + idx)); // 여기서 는 concat이 적용되어서 element 붙여서 나옴
		word.add(strs[idx].concat("element " + idx));
			System.out.println(strs[idx]); //여기서는 a, b 만 출력
			idx++;
		}
		
		for ( idx = 0; idx < strs.length; idx++) {
			System.out.println(strs[idx]); // a, b  만 출력
		}
		
		System.out.println(word); //concat 한것을 값에 넣어주면 붙여서 나옴
	}

}
