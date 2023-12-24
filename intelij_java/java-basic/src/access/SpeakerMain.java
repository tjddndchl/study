package access;

public class SpeakerMain {
    public static void main(String[] args) {
        Speaker speaker = new Speaker(90);
        //좋은 프로그램은 무한한 자유도가 주어지는 프로그램이아니라
        //적적한 제약을 제공하는 프로그램이다.

        speaker.volumeDown();

        speaker.volumeUp();

        speaker.volumeDown();

        speaker.showVolume();

        speaker.volumeUp();
        speaker.volumeUp();
        speaker.volumeUp();
        speaker.showVolume();

        speaker.showVolume();

        //필드에 직접 접근
        System.out.println("volume 필드에 직접 접근 수정");

        speaker.showVolume();

    }
}
