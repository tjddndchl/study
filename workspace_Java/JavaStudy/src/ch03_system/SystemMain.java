package ch03_system;

import java.util.Scanner;

public class SystemMain {

	public static void main(String[] args) { // 표준 출력
		// 콘솔장애 텍스트 출력
		// println() 출력 후 줄바꿈(개행) 해준다.
		System.out.println("start");
		System.out.println();// 줄바꿈 일어남 System.out.println("end");

		// 단축키 ctrl + shift + f 자동정렬
		//print() 내용물 출력만 함.
		System.out.print("줄바꿈 안됨");
		System.out.print("보기 불편...");
		
		//문자열 내에 역슬래시(\) [엔터키 위에 있음] 은 특정 기능을 사용할 수 있음
		System.out.print("println 처럼 \n");
		System.out.println("중간에 \n을 넣어 보세요");
		// \t 탭
		System.out.println("월\t화\t수\t목\t금");
		//일부 특수 문자를 출력하고 싶을때
		System.out.println("오늘은 \"금요일\" ^^ ");
		System.out.println("오늘은 \\");
		System.out.println("★ ");
		
		//printf() 포멧 문자열 형태로 내용을 출력
		System.out.printf("원주율을 %.2f\n", 3.141592);
		System.out.printf("%d명이 수업을 듣고 있습니다.\n", 23);
		System.out.printf("%d명이 %s을 듣고 있습니다.\n", 23, "수업" );
		System.out.printf("%d명이 수업을 듣고 있습니다.\n", 23);
		
		System.out.println("======표준 입력 ======");
		//Scanner 클래스로부터 객체 설정(클래스 객체 생성은 new 사용) 뒤에서 자세히함.
		Scanner scan = new Scanner(System.in);//입력이 들어올때까지 대기
		System.out.println("이름을 입력해주세요");
		System.out.print(">>>");
		//키보드 입력내용 가져오기
		String name = scan.nextLine();
		System.out.println(name + "님 환영합니다. ^^");
		
		System.out.println("에어컨의 희망온도를 입력해주세요.");
		System.out.print(">>>");
		int temper = Integer.parseInt(scan.nextLine());
//		int temper = scan.nextInt();
		System.out.printf("희망온도는 %d이군요", temper);
		
		//취미는 어떤가요?
		// >>>
		// 취미가 [입력받은값]이군요. 를 출력해 주세요
		System.out.println("취미는 어떤건가요");
		System.out.print(">>>");
		String hobby = scan.nextLine();
		System.out.printf("취미가 %s이군요.",hobby);
		
		System.out.printf("%s", scan);
	
		
		scan.close();
		
		

	}

}
