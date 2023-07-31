package ch06.sec10.exam03;

public class Car {
	
	int speed;
	
	void run() {
		System.out.println(speed + "으로 달립니다.");
	}
	static void simulate() {
		Car mycar = new Car();
		
		mycar.speed = 200;
		mycar.run();
	}
	
	public static void main(String[] args) {
		//정적 메소드 호출
		simulate();
		
		Car myCar = new Car();
		
		//인스턴스 멤버 사용
		myCar.speed = 60;
		myCar.run();
	}

}
