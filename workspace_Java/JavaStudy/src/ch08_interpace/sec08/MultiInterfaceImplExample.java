package ch08_interpace.sec08;

public class MultiInterfaceImplExample {

	public static void main(String[] args) {
		RemoteControl rc = new SmartTelevision();
		rc.turnOff();
		rc.turnOn();
		
		Searchable searchable = new SmartTelevision();
		
		searchable.search("https://www.tourube.com");

	}

}
