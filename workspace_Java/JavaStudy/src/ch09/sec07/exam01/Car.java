package ch09.sec07.exam01;

public class Car {
	//필드에 타이어 객체 대입
	private Tire tire1 = new Tire();
	
	private Tire tire2 = new Tire() {
		public void roll() {
			System.out.println("익명 자식 타이어 객체 1이 굴러갑니다.");
		}
	};
	
	
	public void run1() {
		tire1.roll();
		tire2.roll();
	}
	
	
	public void run2() {
		Tire tire = new Tire() {

			@Override
			public void roll() {
				System.out.println("익명 자식 타이어 객체 2가 굴러갑니다.");
			}
			
		};
		
		 tire.roll();
	}


	public void run3(Tire tire) {
		
		tire.roll();
	}
	
}
