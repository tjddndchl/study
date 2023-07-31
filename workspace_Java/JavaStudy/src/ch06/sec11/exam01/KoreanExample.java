package ch06.sec11.exam01;

public class KoreanExample {

	public static void main(String[] args) {
		//객체 생성시 주민번호 이름 전달
		Korean k1 = new Korean("123456-1234567", "김자바");
		
		//필드값 읽기
		System.out.println(k1.nation);
		System.out.println(k1.ssn);
		System.out.println(k1.name);
		
		//final필드는 값을 변경할 수 없음
		//k1.nation = usa
		//k1.ssn = 123 12 1234
		
		k1.name = "최성웅";
		System.out.println(k1.name);
	}

}
