package pratice.submit01.classexample9_2;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.jar.Attributes.Name;

public class Cafe {
	int price;
	 String name;
	 ArrayList<Coffe> menulist = new ArrayList<Coffe>();
	public Cafe(String name) {
		
		this.name = name;
	}
	public void showMenu() {
		this.menulist = menulist;
	}
	 
	public void addCoffee(String name,int price) {
		Coffe cf = new Coffe(name, price);
		menulist.add(cf);
	
	}
	public Cafe(String name, ArrayList<Coffe> menulist) {
		
		this.name = name;
		this.menulist = menulist;
	}
	
	public void buyCoffee() {
		Scanner scanner = new Scanner(System.in);
		
	}
	
}