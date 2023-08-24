package ch08_interpace.sec04;

public interface RemoteControl {
	//상수필드
	int MAX_VALUME =10;
	int MIN_VOLUME =0;
	//추상메소드
	void turnOn();
	void turnOff();
	void setVolume(int volume);
}
