package ch08_interpace.sec11.exam02;

public class DriverExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//드라이버 객체 생성
		Driver driver = new Driver();
		
		//Vehicle구현 객체 생성
		Bus bus = new Bus();
		Taxi taxi = new Taxi();
		
		//매개값으로 구현 객체 대입(다형성: 실행 결과가 다름)
		driver.drive(taxi);
		driver.drive(bus);
	}

}
