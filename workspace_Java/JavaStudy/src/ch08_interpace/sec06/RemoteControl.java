package ch08_interpace.sec06;

public interface RemoteControl {
	int MAX_VALUME =10;
	int MIN_VOLUME =0;
	//추상메소드
	void turnOn();
	void turnOff();
	void setVolume(int volume);
	
	default void setMute(boolean mute) {
		if (mute) {
			System.out.println("무음처리합니다.");
			
			setVolume(MIN_VOLUME);
		} else {
			System.out.println("무음 헤제합니다.");
		}
	}
	
	static void changeBattery() {
		System.out.println("리모콘 건전지를 교환합니다.");
	}
}
