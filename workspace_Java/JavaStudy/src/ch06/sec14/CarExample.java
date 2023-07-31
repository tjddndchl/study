package ch06.sec14;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.IconifyAction;

public class CarExample {

	public static void main(String[] args) {
		// 객체 생성
		Car myCar = new Car();
		
		myCar.setSpeed(-50);
		System.out.println("현재속도" + myCar.getSpeed());
		
		//올바른 속도변경
		myCar.setSpeed(60);
		System.out.println("현재속도" + myCar.getSpeed());
		
		if(!myCar.isStop()) {
			myCar.setStop(true);
		}
System.out.println("현재속도:" + myCar.getSpeed());
	}
	
	

}
