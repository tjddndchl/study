package ch06.sec08.exam01;

public class CalculatorExample {

	public static void main(String[] args) {
		//calculator 객체 생성
		Calculator mycalc = new Calculator();
		
		mycalc.powerOn();
		
		int result1 = mycalc.plus(5, 6);
		System.out.println("result1=" + result1);
		
		int x =10;
		int y = 4;
		
		double result2 = mycalc.divide(x, y);
		System.out.println("result2:"+result2);
		
		mycalc.powerOff();

	}

}
