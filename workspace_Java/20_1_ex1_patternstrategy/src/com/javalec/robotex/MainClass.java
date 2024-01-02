package com.javalec.robotex;

import com.javalec.robotex.inter.FlyNo;
import com.javalec.robotex.inter.FlyYes;
import com.javalec.robotex.inter.KnifeLazer;
import com.javalec.robotex.inter.MisailYes;

public class MainClass {
	public static void main(String[] args) {
		
		System.out.println("SuperRobot을 만들어 주세요");
		Robot superRobot = new SuperRobot();
		superRobot.shape();
		superRobot.actionWalk();
		superRobot.actionRun();
	//	superRobot.setFly(new FlyYes());
//		superRobot.setFly(new FlyNo());
		superRobot.actionFly();
	//	superRobot.setMisail(new MisailYes());
		superRobot.actionMisail();
	//	superRobot.setKnife(new KnifeLazer());
		superRobot.actionKnife();
		
		
		
		
		
		
	
	}
}
