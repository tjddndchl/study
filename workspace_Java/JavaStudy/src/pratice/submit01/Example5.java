package pratice.submit01;

import java.util.Random;
import java.util.Scanner;

public class Example5 {
		
	public static void main(String[] args) {
		Random random = new Random();
		Scanner scanner = new Scanner(System.in);
		int a= random.nextInt(49)+1;
		int num=0;
		int count = 0;	
		do {
			num++;
		} 
	
		
		while (num<9);{
			
			for(int i=4; i>=0; i--) {
				
				
				System.out.println("숫자를입력해주세요");
				int b = Integer.parseInt(scanner.nextLine());
				
				
			
			if(i>0 && a>b) {
				System.out.printf("업!! 기회가 %d번 남았습니다.\n",i);
				System.out.println(num);
			}else if(i>0 &&  a<b){
				System.out.printf("다운!! 기회가 %d번 남앗습니다.\n",i);
				System.out.println(num);
			}else if(a==b){
				System.out.println("정답입니다.\n");
				System.out.println(num);
				break ;
			}else if (i==0 || a!=b) {
				System.out.printf("틀렸습니다. 정답은 %d입니다.",a);
				System.out.println(num);
				break ;
			
			}
			
			
			
			}
			
			
			
			
			}
		

	int elevatorA = 10;//엘리베이터 A의 위치
	int elevatorB = 4;//엘리베이터 B의 위치
	
	//움직인 엘리베이터가 A이면 1, B이면 2
	final int ACTIVE_ELEVATOR_A =1;
	final int ACTIVE_ELEVATOR_B = 2;
	int activeELevator = 0;
	
	while(true) {
		System.out.println("\n=========미래융합 엘리베이터 ========\n");
		System.out.println("승강기 A의 현재 위치:"+ elevatorA);
		System.out.println("승강기 B의 현재위치:"+ elevatorB);
		System.out.println("몇층에 계시나요?[종료하려면 q or exit 입력]");
		
		String inputText = scanner.nextLine();
		if(inputText.equals("q") ||
				inputText.equalsIgnoreCase("exit")) {
			System.out.println("프로그램이 종료되었습니다.");
			break;
		}
		//사용자가 입력한 층수
		int custFloor = Integer.parseInt(inputText);
		System.out.println(custFloor + "층에서 엘리베이터 호출");
		//사용자의 위치와 각 층수의 차이 계산
		int diffFloorA = (custFloor > elevatorA)?(custFloor-elevatorA)
				:(elevatorA-custFloor);
		int diffFloorB = Math.abs(custFloor - elevatorB);
		
		//위치 차이에 따른 엘리베이터 이동
		//A승강기가 더 멀때
		if(diffFloorA > diffFloorB) {
			
			System.out.println("승강기 B가" + custFloor + "층으로 이동하였습니다.");
			elevatorB = custFloor;
			activeELevator = ACTIVE_ELEVATOR_B;
			//B승강기가 더 멀때
		}else if (diffFloorA<diffFloorB) {
			System.out.println("승강기 A가 " + custFloor + "층으로 이동하였습니다.");
			elevatorA = custFloor;
			activeELevator = ACTIVE_ELEVATOR_A;
			//같을때
		}else {
			if(elevatorA>elevatorB) {
			System.out.println("승강기 A가" + custFloor + "층올 이동하였습니다.");
			elevatorA = custFloor;
			activeELevator =ACTIVE_ELEVATOR_A;
			}else {
				System.out.println("승강기 B가" + custFloor + "층으로 이동하였습니다.");
				elevatorB =custFloor;
				activeELevator =ACTIVE_ELEVATOR_B;
			}
		
	
		
		
	}
		
		
		System.out.println("어느 층으로 이동하시겠습니까? :");
		inputText = scanner.nextLine();
		
		int goToFloor = Integer.parseInt(inputText);
		if(activeELevator == ACTIVE_ELEVATOR_A) {
			System.out.println("승강기 A가" + goToFloor + "층으로 이동하였습니다.");
			elevatorA =goToFloor;
		}else {
			System.out.println("승강기 B가" + goToFloor + "층으로 이동하였습니다.");
			elevatorB =goToFloor;
		}
		
		break;
		
		
	}
	

}
}

