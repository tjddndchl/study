package pratice.submit01;

import java.util.Iterator;
import java.util.Scanner;

public class Example4 {

	public static void main(String[] args) {
		Scanner scanner =new Scanner(System.in);
//		System.out.println("각도를 입력해주세요");
//		int gak = Integer.parseInt(scanner.nextLine());
//		while(gak>0) {
//			int a = gak/360;
//			int b = gak%360;
//			if(0<b && b<60) {
//				System.out.println("사탕");
//				
//			}else if (60<=b && b<120) {
//				System.out.println("초콜릿");
//				
//			}else if (120<=b && b<180) {
//				System.out.println("쿠키");
//			}else if (180<=b && b<240) {
//				System.out.println("콜라");
//			}else if (240<=b && b<300) {
//				System.out.println("아이스크림");
//			}else {
//				System.out.println("커피");
//			}
//		  
//			
//			System.out.println("총 돌아간 바퀴수 :"+ a);
//			break;
//			
//		}
//		System.out.println("거꾸로 뒤집을 문자열 입력:");
//		String input = scanner.nextLine();
//		while(input.length()>0) {
//			System.out.println("뒤집은 결과");
//			for(int i =input.length()-1; i>=0;i--) {
//				
//			System.out.print(input.substring(i,i+1));
//			
//			}
//			break;
//		}
//		System.out.println(">>>");
//		System.out.println("입력할 트리 층을 선택하세요");
//		int floor = Integer.parseInt(scanner.nextLine());
//		
//		String star ="*";
//		while(floor>0) {
//			for(int y = 0; y<floor; y++ ) {
//				
//			for(int x =floor-1; x-y>0; x--) {
//				System.out.print(" ");
//				
//				
//				
//				}
//			
//			System.out.println(star);
//			star += "**";
//			}
//
//			
//			break;
//		}
//		
//		String blank="";
//		System.out.println("입력할 트리 층을 선택하세요");
//		int floor2 = Integer.parseInt(scanner.nextLine());
//		while(floor2>0) {
//			
//		for(int i=0; i<floor2; i++) {
//			String star2 ="*";
//			for(int g = 1; g+i<floor2;g++) {
//				
//				
//				
//				star2+="**";
//				
//				}
//			System.out.println(blank+star2);
//			
//			blank +=" ";
//			
//			}
//			
//		
//		
//		break;
//		}
//		
		
		String blank = "";
		for(int i = 0; i <5; i++) {
			if(i>0) {
				blank += " ";
			}
			String star="*";
			for (int j = 0; j <4-i; j++) {
				star += "**";
			}
				System.out.println(blank + star);
			}
		
		//print사용
		
		for(int i =0; i <5 ;i++) {
			//공백
			for(int j =5-i; j>1; j--) {
				System.out.print(" ");
			}
			//별
			for(int j = 0; j<=2*i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		//다이아몬드
		int num=25;
		for(int i=num-2; i>=0; i--) {
			for(int j = num-i; j >1; j--) {
				System.out.print(" ");
			}
			for(int j =0; j<=2*i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
		
		
		
}


