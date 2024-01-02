package com.javalec.ex14;

import javax.swing.plaf.synth.SynthScrollPaneUI;

public class Ex14 {
	public static void main(String[] args) {
		int ans = 0;
		
		
		try {
			int num = 10;
			int div = 0;
			 ans = num / div;
		}catch (ArithmeticException ae) { //정수를 0으로 나눌려고할때 발생하는 예외
			// TODO: handle exception
			System.out.println( ae.getMessage()); // by zero 메세지 출력
			ans= 0;
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Invaild calculation");
		}finally {
			System.out.println("1");
		}
		
		
		System.out.println("Answer = " + ans);
	}
}
