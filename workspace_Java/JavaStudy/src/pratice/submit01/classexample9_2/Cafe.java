package pratice.submit01.classexample9_2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;
import java.util.jar.Attributes.Name;

public class Cafe {
	private String name;//카페이름
	private String enNm;
	private ArrayList<Coffe> menuList;//메뉴판
	
	
	public Cafe(String name) {
		
		this.name = name;
		this.menuList = new ArrayList<Coffe>();
	}
	
	
	@Override
	public String toString() {
		return "Cafe [name=" + name + ", enNm=" + enNm + ", menuList=" + menuList + "]";
	}


	public void addCoffee(Coffe cf) {
		menuList.add(cf);
	}
	
	//메뉴판 출력 메소드
	public void showMenu() {
		System.out.println("어서오세요"+ name + "입니다." );
		for(Coffe cf : menuList) {
			System.out.println(cf.getName()+ ":" + cf.getPrice());
	}
	System.out.println("메뉴를 선택해주세요");
//		for(int i=0; i< menuList.size();i++) {
//			System.out.println((i+1)+ "." + menuList.get(i));
//		}
			
		
	}
	
	//커피구매
	public void buyCoffe(int num) {
		Coffe cf = menuList.get(num);
		System.out.println(cf.getName()+"을"+cf.getPrice()+"에 구매하였습니다.");
		
			}
	
}
