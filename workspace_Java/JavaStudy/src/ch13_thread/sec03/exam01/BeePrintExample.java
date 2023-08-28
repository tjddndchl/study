package ch13_thread.sec03.exam01;

import java.awt.Toolkit;

public class BeePrintExample {

	public static void main(String[] args) {
		Toolkit toolkit = Toolkit.getDefaultToolkit(); // 툴킷객체얻기
		for (int i = 0; i < 5; i++) {
			toolkit.beep();//비프음 발생
			 try {
				Thread.sleep(500);
			} catch (InterruptedException e) {}
		}
		for (int i = 0; i < 5; i++) {
			System.out.println("띵");
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
