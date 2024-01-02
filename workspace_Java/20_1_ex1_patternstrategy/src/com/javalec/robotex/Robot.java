package com.javalec.robotex;

import com.javalec.robotex.inter.IFly;
import com.javalec.robotex.inter.IKnife;
import com.javalec.robotex.inter.IMisail;

public abstract class Robot {
	
	
	IFly fly;
	IMisail misail;
	IKnife knife;

	public Robot() {
	System.out.println("Robot상위 클래스 호출");
	}
	
    public void actionWalk() {
		// TODO Auto-generated method stub
		System.out.println("걸을수있습니다.");
	}
	
	public void actionRun() {
		// TODO Auto-generated method stub
		System.out.println("달릴수있습니다.");
	}
	
	public abstract void shape();

	public void setFly(IFly fly) {
		this.fly = fly;
	}

	public void setMisail(IMisail misail) {
		this.misail = misail;
	}

	public void setKnife(IKnife knife) {
		this.knife = knife;
	}
	
	public void actionKnife() {
			// TODO Auto-generated method stub
		this.knife.KNife();
	}
	
	public void actionMisail() {
		// TODO Auto-generated method stub
		this.misail.misail();
	}
	
	public void actionFly() {
		this.fly.fly();
	}


	
	
}
