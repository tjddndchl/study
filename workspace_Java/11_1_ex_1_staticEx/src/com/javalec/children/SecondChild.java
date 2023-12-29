package com.javalec.children;

import com.javalec.papa.PapaPouch;

public class SecondChild {
	public SecondChild() {
		System.out.println("둘쨰아이 호출");
	}
	
	public void takeMoney(int money) {
		
		//static으로 생성하면 객체 새로생성하지 않고 바로 접근가능
		PapaPouch.money = PapaPouch.money - money;
		if(PapaPouch.money < 0) System.out.println("둘째는 돈이 없어 못받아요 ㅠㅠ");
	}
}
