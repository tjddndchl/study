package ch13_thread.sec05;

import ch13_thread.sec05.exam02.SumThread;

public class JoinExample {

	public static void main(String[] args) {
		SumThread sumThread = new SumThread();
		sumThread.start();
		
		try {
			sumThread.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("1~100까지의합" + sumThread.getSum());

	}

}
