package ch10_extends_interface.papacar;

public class Car2 implements Vehicle{

	@Override
	public void start() {
		// TODO Auto-generated method stub
		System.out.println("쓩~~");
	}

	@Override
	public void stop() {
		// TODO Auto-generated method stub
		System.out.println("--");
	}

}
