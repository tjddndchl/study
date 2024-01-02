package com.javalec.ex1;

public class SwitchClass {
	public static void main(String[] args) {
		
		int choice = 2;
		switch (choice) {
		case 1:
			System.out.println("Case 1");
			break;
		case 2:
			System.out.println("Case 2");

			break;
			
			//기본 섹션 생략해도됨
			//기본 섹션이란 스위치문의 일치하는 case 레이블을 찾지 못하였을때 실행되는 부분
			//스위치 문에 포함 하지 않을수도있음
			
			
			
		}
		
		
/*
		int constantValue = 42;
		int choice1 = 43;
		switch (choice1) {
		    case constantValue: // case expressions must be constant expressions 상수사용라하는 오류 발생
		        System.out.println("Constant case");
		        break;
		    // 런타임에서 변경된 값이 사용될 수 없음
		}
		
*/
		
	 int x = 3;
	 int y = 3;
		
		switch (x + y, x-y) { //여러개 평가 못함 단 한가지만 평가할수 있음
		case 4:
			System.out.println("Case 5");
			break;

		case 7,6,9 ,10:
			System.out.println("Case 6 or 7");
			break;
		}
		
		

		
	}

}
