package ch08_interpace.sec06;

import ch08_interpace.sec06.RemoteControl;

public class Televison implements RemoteControl{
	
		private int volume;

		

			


	@Override
	public void turnOn() {
		System.out.println("Televison를 켭니다.");
		
	}

	@Override
	public void turnOff() {
		System.out.println("Televison를 끕니다.");
		
	}

	@Override
	public void setVolume(int volume) {
		if (volume > RemoteControl.MAX_VALUME) {
			this.volume = RemoteControl.MAX_VALUME;
		} else if(volume < RemoteControl.MIN_VOLUME){
			this.volume = RemoteControl.MIN_VOLUME;
		}else {
			this.volume = volume;
		}
		System.out.println("현재 Television 볼륨:" +  this.volume);
		
	}
	
	
}
