package com.javalecextemp;

public class ThrowExClass {
	
	public ThrowExClass() {
		// TODO Auto-generated constructor stub
		actionC();
	}
	
	
	private void actionA() throws Exception{
		// TODO Auto-generated method stub
		System.out.println("actionA");
		
		int[] iArr = {1, 2, 3, 4};
		System.out.println(iArr[4]);
		System.out.println("actionAA");
	}
	
	
	private void actionB() {
		// TODO Auto-generated method stub
		System.out.println("actionB");
		try {
			actionA();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("예외는 여기서 처리 할게요. ^^");
			System.out.println(e.getMessage());
		}
		
		System.out.println("actionBB");
	}
	
	private void actionC() {
		System.out.println("actionC");
		actionB();
		System.out.println("actionCC");
	}
}
