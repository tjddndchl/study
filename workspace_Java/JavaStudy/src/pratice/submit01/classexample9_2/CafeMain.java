package pratice.submit01.classexample9_2;

import java.util.ArrayList;
import java.util.Scanner;

public class CafeMain {

	public static void main(String[] args) {
	Cafe cafe1 = new Cafe("스타벅스");
	Cafe cafe2 = new Cafe("아카");
	cafe1.addCoffee("아메리카노", 7000);
	cafe1.addCoffee("아메리카노", 7000);
	cafe1.addCoffee("아메리카노", 7000);
	Scanner scanner = new Scanner(System.in);
	
	while(true) {
		System.out.println("1. 스타벅스 방분|2. 아까 방문| 3. 사무실 복귀..");
		int b = Integer.parseInt(scanner.nextLine());
		if(b==1) {
			System.out.println("어서오세요"+cafe1 + "입니다.");
			System.out.println(cafe1.menulist);
		}
	}
	
	
	}

}
