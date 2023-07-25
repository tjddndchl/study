package pratice.submit01;

import java.security.DrbgParameters.NextBytes;
import java.util.Scanner;

public class example2 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("이름을 입력해주세요");
		System.out.println(">>>");
		String name = scanner.nextLine();
		System.out.println("국어 점수를 입력해주세요");
		System.out.println(">>>");
		int korea = scanner.nextInt();
		System.out.println("영어점수를 입력해주세요");
		System.out.println(">>>");
		int english = scanner.nextInt();
		System.out.println("수학점수를 입력해주세요");
		System.out.println(">>>");
		int math = scanner.nextInt();
		double average = (korea+english+math)/3.0 ;
		System.out.printf("이름:%s\n 국어:%d\n 영어:%d\n 수학:%d\n 평균:%.1f\n"
				,name,korea,english,math,average);
		String grade = (average >= 90)? ("A"):((average>=80)?("B"):("C"));
		System.out.println("등급"+ grade);
		String avcString =scanner.nextLine();
		
		
		System.out.println("주민번호 를 입력해주세요.");
		String idBack= scanner.nextLine();
		System.out.println(idBack.substring(7,8));
		int a = Integer.parseInt(idBack.substring(7,8));
		String check = (a%2==1)?"남자입니다.":"여자입니다.";
		System.out.println(check);
		
		
	}

}
