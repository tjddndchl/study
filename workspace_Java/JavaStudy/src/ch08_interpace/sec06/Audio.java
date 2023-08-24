package ch08_interpace.sec06;

import ch08_interpace.sec06.RemoteControl;

public class Audio implements RemoteControl{
	private int volume;

	@Override
	public void turnOn() {
		System.out.println("Audio를 켭니다.");
		
	}

	@Override
	public void turnOff() {
		System.out.println("Audio를 끕니다.");
		
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
		System.out.println("현재 Audio 볼륨:" +  this.volume);
		
	}
}
