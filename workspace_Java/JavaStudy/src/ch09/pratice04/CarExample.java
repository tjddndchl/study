package ch09.pratice04;

import ch09.pratice04.Car.Engine;

public class CarExample {

	public static void main(String[] args) {
		Car myCar = new Car();
		Car.Tire tire = myCar.new Tire();
		Car.Engine engine= new Car.Engine();
	}

}
