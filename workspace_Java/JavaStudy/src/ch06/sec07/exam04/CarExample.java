package ch06.sec07.exam04;

public class CarExample {

	public static void main(String[] args) {
		Car car1 = new Car(); //1.생성자 호출
		System.out.println("car1.company :" + car1.company);
		
		Car car2 =new Car("자가용");
		System.out.println("car2.company" + car2.company);
		System.out.println("car2.model" + car2.model);
		System.out.println();
		
		Car car3 = new Car("자가용", "빨강");
		Car car4 = new Car("택시", "검정", 200);

	}
	

}
