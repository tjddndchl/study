package com.javalec.childlunch;

public class child1 extends LunchMenu{
	
	
	
	public child1(int rice, int bulgogi, int banana, int milk, int almond) {
		super(rice, bulgogi, banana, milk, almond);
		
	}

	@Override
	public int calculating() {
		// TODO Auto-generated method stub
		return rice + bulgogi + banana;
	}
	
	
}
