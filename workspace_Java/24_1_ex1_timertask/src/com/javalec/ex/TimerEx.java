package com.javalec.ex;

import java.util.Timer;
import java.util.TimerTask;

public class TimerEx {
	public static void main(String[] args) throws InterruptedException {
		TimerEx timerEx = new TimerEx();
		
	}
	public TimerEx() throws InterruptedException{
		System.out.println("^^");
		
		Timer timer = new Timer(true);
		TimerTask t1 = new ExTimerTask1();
		TimerTask t2 = new ExTimerTask2();
		
		
		timer.schedule(t1, 2000); //2초후 실행
		timer.schedule(t2, 10000); //2초후 실행
		
		Thread.sleep(11000);
		System.out.println("**");
		
	}

}
