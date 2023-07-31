package ch06.sec07.exam02;

public class KoreanExample {

	public static void main(String[] args) {
		//Korean 객체 생성
		Korean K1 = new Korean("박자바", "011225-1234567");
		//Korean 객체 데이터 읽기
		System.out.println("k1.nation:" + K1.nation);
		System.out.println("k1.name:" + K1.name);
		System.out.println("k1.ssn:" + K1.ssn);
	}

}
