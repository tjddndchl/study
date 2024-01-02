package com.javalec.ex19;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Ex19 {
	public static void main(String[] args) {
		String[] arr = {"Hi", "How", "Are", "You"};
		
		
//      에러 발생 타입 미지정 지역변수 전역변수처럼 사용 불가
//		List arrlList = new ArrayList(Arrays.asList(arr));
//		System.out.println(arrlList);
//		
//		if (arrlList.removeIf((String s) -> (s.length() <= 2))) {
//			System.out.println(arrlList);
//			//System.out.println(s + "removed"); // s에서 오류
//		}
		
      	
		List<String> arrlList = new ArrayList<>(Arrays.asList(arr));
		System.out.println(arrlList);
		
		
		
		if (arrlList.removeIf((String s) -> {
			Boolean removed = s.length() <=2;
			if (removed) {
				System.out.println(s + " removed");
			}
			
			return removed;
		})) { //removeIf 원본에 영향 줌
		
			System.out.println(arrlList);

		}		
		
		 System.out.println(arrlList);
		
		
	}
}
