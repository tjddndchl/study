package ch09.sec07.exam01;

public class CarExample {
	public static void main(String[] args) {
		
	
	
	//카 객체 생성
	Car car = new Car();
	
	//익명 자식 객체가 대입된 로컬변수 사용
	car.run1();
	
	//익명 자식 객체가 대입된 로컬변수 사용
	car.run2();
	
	
	car.run3(new Tire() {

		@Override
		public void roll() {
			System.out.println("익명 자식 타이어 객체3이 굴러갑니다.");
			
		}
		
		
		
	});

		
		
		
	
	
	}
}
