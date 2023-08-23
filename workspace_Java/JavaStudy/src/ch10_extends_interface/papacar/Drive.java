package ch10_extends_interface.papacar;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Drive {

	public static void main(String[] args) {
		Vehicle Car1 = new Car();
		Vehicle Car2 = new Car2();
		Car1.start();
		Car2.start();
		
		//List라는 동일한 인터페이스를 구현한 클래스
		//동일한 인터페이스를 구현했기때문에 동일한 메서드가 있음.
		
		List list = new ArrayList();
		List list2 = new LinkedList();
		
	}

}
