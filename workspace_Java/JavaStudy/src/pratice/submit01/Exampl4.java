package pratice.submit01;

import java.util.Scanner;

public class Exampl4 {

	public static void main(String[] args) {
		
		Scanner scanner =new Scanner(System.in);
		
		System.out.println("국어 점수를 입력해주세요.\n>>>");
		int kor = Integer.parseInt(scanner.nextLine());
		
		System.out.println("영어 점수를 입력해주세요.\n>>>");
		int english = Integer.parseInt(scanner.nextLine());
		
		System.out.println("수학 점수를 입력해주세요.\n>>>");
		int math = Integer.parseInt(scanner.nextLine());
		
		double average = (kor + english +math)/3.0 ;
		System.out.println("평균:"+average);
		if(average>=90) {
		   System.out.println("등급: A 등급");
		}else if(average >=80) {
			System.out.println("등급: B 등급");
		}else if(average >= 70) {
			System.out.println("등급: C 등급");
		}else {
			System.out.println("등급: D 등급");
		}
		
		//팩토리얼
		System.out.println("입력받을 팩토리얼 수");
		int f = scanner.nextInt();
		int a =1;
		for(int i =1; i <= f; i++) {
			a=a*i;
		
		}
		System.out.println("결과:"+a);
		
		
		
	    String findwally ="윌리울리일리울리울리일리월리일리윌리월리울리일리일리월리일리윌리일리윌리일리월리월리윌리울리윌리울리일리울리울리윌리일리";
	    int all =findwally.length();
	    int after = findwally.replaceAll("월리", "").length();
	    System.out.println((all-after)/2);
	    
	    //
	    int count = 0;
	    for(int i=0; i<findwally.length(); i++) {
	    	String subwally = findwally.substring(i, i+2);
	    	if(subwally.equals("월리")) {
	    		count +=1;
	    	}
	    }
	    
	    System.out.println("월리는 총:" + count);
	    
	    System.out.println("+++++++++++++++++++++++++++++++");
	    
//	    String star="*";
//		for(int i = 4; i >=1;i--){
//			for(int d =1; d <= i; d++) {
//				
//				System.out.print(star);
//			}
//			System.out.println();
//			
//			}
	    String star ="*****";
	    String b = star;
	    for(int i =4; i>0;i--) {
	    	System.out.println(star.substring(i));
	    }
			
			
			}

		
		
}

