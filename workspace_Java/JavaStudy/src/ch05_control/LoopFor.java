package ch05_control;

import java.awt.print.Printable;
import java.util.Iterator;
import java.util.Scanner;

public class LoopFor {

	public static void main(String[] args) throws InterruptedException {
		// 콘솔창에 1 ~ 10 까치 출력하시오 !
		/*
		System.out.println(1);
		System.out.println(1);
		System.out.println(1);
		System.out.println(1);
		System.out.println(1);
		System.out.println(1);
		System.out.println(1);
		System.out.println(1);
		System.out.println(1);
		
		int num = 1;
		System.out.println(num++);
		System.out.println(num++);
		System.out.println(num++);
		System.out.println(num++);
		System.out.println(num++);
		System.out.println(num++);
		System.out.println(num++);
		System.out.println(num++);
		System.out.println(num++);
		System.out.println(num++);
		*/
		//for문
//		for(int i =1; i <= 10; ++i) {
//			System.out.println(i);
//		}
////		System.out.println(i); for문안에서 선언된 i는 for문에서만 사용가능
//		//for문밖에서 쓰고싶다면
//		int one =1 ;
//		for(int i =1; i<= 10;i++) {
//			System.out.println(one++);
//		}
//		System.out.println(one);
//		for(int j =1; j<=10; j++) {
//			System.out.println(j);
//		}
//		//1~20까지 더하기
//		int sum = 0;
//		for(int i =21;i<=45;i++){
//			sum= sum+i;
//		}
//		//21부터 45 까지 더하기
//		System.out.println(sum);
//		//1부터 40까지중에 짝수만 더한 값을 출력하시오
//		//for문와 if문을 사용해서 출력해 보세요
//		int sum3 = 0;
//		System.out.println("======================1부터40까지 짝수 더하기========================");
//		for(int i = 1; i<=40; i++) {
//			//짝수이면 더하기
//			if(i%2==0) {
//				
//				System.out.printf("sum3 +i:%d+%d\n",sum3,i);
//				sum3+=i;
//			}
//		}
//		System.out.println(sum3);
//		
//		//for문을 이용해서 2단을 출력해 보세요
//		//2 x 1 = 2
//		//2 x 2 = 4
//		int dan = 2;
//		System.out.println("=================2단=======================");
//		for(int i = 1; i<=9;i++) {
//			int multi = dan * i;
//			System.out.printf("%d x % d = %d\n",dan,i,multi );
//		}
//	//입력받은 구구단을 출력하시오(ex 2 ->2단, 5 ->5단)
//	Scanner scanner = new Scanner(System.in);
//	System.out.println("몇단을 출력할까요?");
//	int a =Integer.parseInt(scanner.nextLine());
//	for(int i =1; i<=9; i++) {
//			System.out.println(a+" x " + i + "=" +(a*i));
//		}
////위 프린트와 같이 출력되도록 for문을 이용하여 트리를 출력해보세요
//	
//	String star="";
//	for(int i =0; i <=5;i++){
//		star += "*";
//		System.out.println(star);
//		
//		}
//	//10부터 >1까지 출력
//	for(int i = 10; i >= 1; i--){
//		System.out.println(i);
//	}
//	//국수공장에서 면을 100cm 뽑고 있는데 5cm마다 잘라줘야 합니다.
//	for(int i =0; i <20; i++) {
//		System.out.println("||||||||");
//		if(i==4 || i ==9||i==14) {
//			System.out.println("");
//		}
//	}
//	//라면공장에서 30cm마다 면을 뽑고있는데
//	//6cm마다 잘라주어야 한다.
//	for(int i =0;i<30;i++) {
//		if(i%2==0) {
//			System.out.println("/////////");
//		}else if(i%2==1) {
//			System.out.println("\\\\\\\\\\");
//		}
//		//i가 5일때,11일때,17일때...자른다.
//		//규착을 찾아서 조건문을 만들어 라면을 자른다.
//		if((i+1)%6==0) {
//			System.out.println("--------------");
//		}
//		Thread.sleep(400);//thread뒤에서 다룸 400은 400ms 0.4초 멈춤
//	}
//	
//	//해당 숫자의 각자리의 수를 더한값을 출력하시오
//	int example = 478453223;
//	int result = 0;
//	String strNum = example + "";
//	for(int i =0;i< strNum.length(); i++) {
//		result+=Integer.parseInt(strNum.substring(i,i+1));//0,1,1,2,2,3....
//		
//	}
//	System.out.println("각 자리를 더한 값:"+ result);
		/*break a문
		 *반복문 내에서 break 문이 실행되면 해당 반복문을 즉시 종료!!
		 */
		//1~n까지 더한 값이 100 이상이 되는 지점의 n을 구하시오!
		int sum = 0;
		for(int i=1; i<9999; i++) {
			sum += i;
			if(sum >= 100 ) {
				System.out.println("100이상이 되는 n:" + i);
				break;
				
			}
		}
		
		//구구단 출력 2~9단
		int dan = 0;
		int su = 0;
		
		for(int i =2; i<=9; i++) {
			if(i==5 || i ==8) {
				//반복문에서 continue를 만나면 해당
				//반복문의 아래 로직은 건너뛰고 다음 반복으로 넘어감
				continue;
				
			}
			
			System.out.println(i+"단");
			for(int j =1; j<=9; j++) {
				System.out.println( i + "x" + j +"=" + (i*j));
				
			}
		}
		
		
	}
}