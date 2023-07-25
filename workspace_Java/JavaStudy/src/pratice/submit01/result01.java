package pratice.submit01;

public class result01 {

	public static void main(String[] args) {
	
		String name = "최성웅";
		int age = 28;
		float height = 175.0f;
		String address = "010-4552-6593";
		String email = "tjddndchl134@gmail.com";
		System.out.printf("이름:%s\n나이:%d\n키:%.1f\n연락처:%s\n이메일:%s\n", name,age,height,address,email);
		
		String enigma = "너오구늘리뭐너먹구리지";
		String enigma1 = enigma.replace("너", "");
		String enigma2 = enigma1.replace("구", "");
		String enigma3 = enigma2.replace("리", "");
		System.out.printf("1차 암호 해독[너 제거]:%s\n",enigma1);
		System.out.printf("2차 암호 해독[구 제거]:%s\n",enigma2);
		System.out.printf("3차 암호 해독[리 제거]:%s\n",enigma3);
		System.out.printf("해독 완료!! ->%s\n",enigma3);
		
		int example = 278;
		int a = example /100 ;
		int b =  (example%100)/10;
		int c = (example%100)%10;
		System.out.println(a+b+c);

	}

}
