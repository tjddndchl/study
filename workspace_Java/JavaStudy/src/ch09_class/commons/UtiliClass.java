package ch09_class.commons;

/**
 * @파일명   	:UtiliClass.java
 * @프로젝트명 	:JavaStudy
 * @작성일    	:2023. 7. 27.
 * @작성자   	:sungWoong
 * @프로그램설명	:소수 n번째 자리까지 리턴
 * @변경이력  	:반올림된 소수를 리턴
 */
public class UtiliClass {
	public static double weRound(double num, int n) {
		//10의n 제곱 구하기
		int ten = 1;
		for (int i = 0; i < n; i++) {
			ten*=10;
		}
		num*=ten;
		long temp = Math.round(num);
		double result = (double)temp/ten;
		return result;
	
	

	}
	 
		
	public static void main(String[] args) {
		System.out.println(weRound(75.12311422, 5));
	}

}
