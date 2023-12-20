package access;

public class Speaker {
    private int volume;

    Speaker(int volume){
        this.volume = volume;
    }

    void volumeUp(){
        if (volume >= 100) {
            System.out.println("음량을 증가할 수 없습니다. 최대 음량입니다.");
        }else {
            volume += 10;
            System.out.println("음량을 10 증가합니다.");
        }
    }

    protected void volumeDown(){
        volume -= 10;
        System.out.println("볼륨다운 호출");
    }

    void showVolume(){
        System.out.println("현재 볼륨은" + volume + "입니다.");
    }
}
