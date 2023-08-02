package pratice.submit01.classexample9_2;

import java.util.ArrayList;
import java.util.Scanner;



public class CafeMain {
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Cafe starbucks = new Cafe("스타벅스");
		starbucks.addCoffee(new Coffe("1.아메리카노", 5000));
		starbucks.addCoffee(new Coffe("2.카푸치노", 6000));
		starbucks.addCoffee(new Coffe("3.오곡라뗴", 7000));
		Cafe akaCafe = new Cafe("아카");
		akaCafe.addCoffee(new Coffe("1.아메리카노", 2500));
		akaCafe.addCoffee(new Coffe("2.바닐라라떼", 3000));
		akaCafe.addCoffee(new Coffe("3.아이스티", 3500));
		int choice;
		boolean flag =true;
		while(flag) {
			System.out.println("1.스타벅스 방문|2. 아카 방문 |3.사무실");
			choice=scanner.nextInt();
			switch(choice) {
			case 1:
				starbucks.showMenu();
				System.out.println("메뉴를 선택해주세요");
				int coffeChoice1 = scanner.nextInt();
				
				starbucks.buyCoffe(coffeChoice1-1);
				break;
				
			case 2:
				akaCafe.showMenu();
				System.out.println("메뉴를 선택해주세요");
				int coffeChoice2 = scanner.nextInt();
				akaCafe.buyCoffe(coffeChoice2-1);
				break;
			}
			if(choice==3){
				System.out.println("사무실로 복귀합니다....");
				flag = false;
			}
				
			}
			
			
		}
	
	
	}


