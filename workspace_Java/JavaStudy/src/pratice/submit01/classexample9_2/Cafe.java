package pratice.submit01.classexample9_2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;
import java.util.jar.Attributes.Name;

public class Cafe {
	private String name;//카페이름
	private ArrayList<Coffe> menuList;//메뉴판
	
	
	public Cafe(String name) {
		
		this.name = name;
		this.menuList = new ArrayList<Coffe>();
	}
	
	public void addCoffee(Coffe cf) {
		menuList.add(cf);
	}
	
	public void showMenu() {
		System.out.println("어서오세요"+ name + "입니다." );
		for(Coffe cf : menuList) {
			System.out.println(cf.getName()+ ":" + cf.getPrice());
			
		}
	}
	
	//커피구매
	public void buyCoffe(int num) {
		Coffe cf = menuList.get(num);
		System.out.println(cf.getName()+"을"+cf.getPrice()+"에 구매하였습니다.");
		
			}
	
}
