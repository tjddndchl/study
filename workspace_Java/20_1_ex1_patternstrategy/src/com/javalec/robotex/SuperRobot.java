package com.javalec.robotex;

import com.javalec.robotex.inter.FlyYes;
import com.javalec.robotex.inter.KnifeLazer;
import com.javalec.robotex.inter.MisailYes;

public class SuperRobot extends Robot{
	
//	IFly fly = new FlyYes();
//	IMisail misail = new MisailYes();
//	IKnife knife = new KnifeLazer();
	

	
	public SuperRobot() {
		System.out.println("로봇 하위 클래스 슈퍼로봇 호출");
		fly = new FlyYes();
		misail = new MisailYes();
		knife = new KnifeLazer();
	}

	@Override
	public void shape() {
		// TODO Auto-generated method stub
		System.out.println("Super로봇입니다.");
	}


	

	

}
