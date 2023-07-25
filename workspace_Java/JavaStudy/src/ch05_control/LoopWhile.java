package ch05_control;

import java.util.Scanner;

public class LoopWhile {

	public static void main(String[] args) {
		int i = 1;
		while(i <= 10) {
			System.out.println(i);
			i++;
		}
		int j =1;
		
//		조건이 true이면 반복(무한루프 조심해야함)
		while (true) {
			System.out.println(j);
			j++;
			if(j==10) {
				break;
			}
			
		}
		
		
		boolean flag =true;
		while (flag) {
			j++;
			System.out.println(j);
			if(j==20) {
				flag = false;
			}
		}
		
		Scanner scanner = new Scanner(System.in);
		boolean isRun = true;
		while (isRun) {
			System.out.println("이름을 입력하세요(종료 q or Q)");
			System.out.println(">>>");
			String input = scanner.nextLine();
			if(input.equals("q") || input.equals("Q")){
				isRun = false;
				System.out.println("종료 하겠습니다.");
			}else {
				System.out.println(input + "님 환영합니다.^^");
			}
			System.out.println("+++++++++++++++++++++++++++");
		}
		//do-while문
		//최소 한번은 실행해야할때
	
		isRun =false;
		do {
			System.out.println("hi");
		} while (isRun);
		//while 구구단 출력 2~9단
		//증가값을 만들어줘야함
		
		int dan =2;
		
		while(dan <=9) {
			int su =1;
			System.out.println(dan + "단");
			outer : while(su <=9) {
				System.out.printf("%d x %d = %d\n",dan,su,(dan*su));
				su++;
				if (su==5) {
					break;
				}
				if(dan==3) {
					//outer 하위 내용 멈춤
					break outer;
				}
				
			}
			
			
			dan++;
			
		}
		//label 특정시점까지 break를 하고싶을때
		//단순 break는 해당 반복문만 탈출하게됨.
		out1 : for(int x =0; x<5;x++) {
			out2 : for(int y =0; y<5; y++) {
				out3: for(int z =0; z<5; z++) {
					if (x * y * z > 10) {
						break out2;
						
					}
					System.out.println(x + "" + y + ""+ z);
				}
			}
		}

		
	}
	
	

}
