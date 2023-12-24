package oop;

public class MusicPlayerMain4 {
    public static void main(String[] args) {
        MusicPlayer player = new MusicPlayer();
        //음악 플레이어 켜기
        player.on();
        //불륨증가
        player.volumeUp();
        //볼륨감소
        player.volumeDown();
        //볼륨증가
        player.volumeUp();
        //음악 플레이어의 상태
        player.showStatus();

        //음악 플레이어 끄기
        player.off();
    }
}
