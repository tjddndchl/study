package ch08_interpace.sec04;

public class RemoteControlExample {

	public static void main(String[] args) {
		
		RemoteControl rc;
		rc =new Television();
		rc.setVolume(5);
		rc.turnOff();
		
		rc= new Audio();
		rc.setVolume(5);
		rc.turnOff();

	}

}
