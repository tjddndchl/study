package ch08_interpace.sec06;



public class RemoteControlExample {

	public static void main(String[] args) {
		RemoteControl rc;
		
		
		rc =new Televison();
		rc.turnOff();
		rc.setVolume(5);
		
		
		rc.setMute(true);
		rc.setMute(false);
		
		System.out.println();
		
		
		rc = new Audio();
		rc.turnOn();
		rc.turnOff();
		
		rc.setMute(true);
		rc.setMute(false);
		
		System.out.println();
		
		
		RemoteControl.changeBattery();

	}

}
