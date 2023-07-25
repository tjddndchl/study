package ch02_variable;

import java.awt.image.SampleModel;

public class VariableMain {
	
	public static void main(String[] args) {
		/*
		 * 객체 지향 프로그램
		 * 객체 : 데이터(속성)과 그 데이터를 조직하는 방법(메서드)를 함께 캡슐화한 겄을 가르침.
		 * 객체는 실제 세계의 물체나 개념을 모델링하는데 사용됨.
		 * 예를 들어 "자동차" 라는 객체를 만든다면
		 * 그 속성으로는 색상, 브랜드, 최대 속도..이 올수 있고
		 * 메서드로는 가속, 정지, 방향 전환과 같은 동작이 포함될 수 있음.
		 * 
		 * 객체는 클래스라는 "틀"을 바탕으로 생산됨.
		 * 클래스는 객체의 구조와 동작을 정의하며, 동일한 유형의 여러 객체들이 동일한 클래스를
		 * 공유할 수 있음.
		 * 객체 지향 프로그래밍의 핵심적인 장점은 코드의 재사용성과 확장성을 증가시키는 것.
		 * 잘 설계하면 동일한 유형의 새로운 객체를 쉽게 생성하고, 기존 객체를 재사용하거나
		 * 확장하여 프로그램의 복잡성을 관리할 수 있음.
		 * 
		 */
		
		int myMoney; //변수선언
		myMoney = 10000; //값 할당
		System.out.println(myMoney);
		
		int myAge = 20; //변수 초기화(initialization = init)
						//초기화 동시에 값 할당
		System.out.println(myAge);
		
		myMoney = 20000; //수정
		System.out.println(myMoney);
			
		//상수(Constant)의 선언
		//값이 변경되면 안되는 
		final double MATH_PI =3.14;	//상수는 대문자로 많이 사용
		System.out.println(MATH_PI);
		
		System.out.println("string 내장 메소드");
		String fruits ="Apple, Banana, Cherry";
		int len = fruits.length();
		System.out.println("fruits 길이는:" + len);
		//string.charAt(인덱스)
		//인덱스 위치를 의미함
		//0 부터 시작
		char alpha = fruits.charAt(3);
		System.out.println(alpha);//App 1
		
		//string.indexOf(문자열)
		//해당 문자열의 인덱스 리턴
		System.out.println(fruits.indexOf("Banana"));
		System.out.println(fruits.indexOf("banana"));// 존재하지 않으면 -1
		
		//string.substring(시작인덱스, 끝 인덱스)
		//해당 문자열을 시작 인덱스부터 끝인덱스 전까지 자름.
		System.out.println(fruits.substring(7, 13));
		
		//string.substring(시작인덱스)입력값이 1개만 들어오면
		//시작인덱스부터 끝까지 자름
		System.out.println(fruits.substring(15));
		
		//sting.replace(바뀔문자, 바꾸고 싶은 문자)
		System.out.println(fruits.replace("Cherry", "pizza"));
		String world = "  The   New   World!!  ";
		System.out.println(world.replace("  ", ""));
		
		String name = "Sam Kim";
		//name문자열의 공백을 찾아서
		//Sam이라는 문자열만 출력하시오.
		int nmLen = name.indexOf(" ");
		System.out.println(nmLen);
		String last = name.substring(0, nmLen);
		System.out.println(name.substring(0,nmLen));
		String first = name.substring(nmLen +1);
		System.out.println("성은:" + first + " 이름은:" + last);
		
		System.out.println("======형변환=========");
		
		//자동 변환
		//큰범위 = 작은 범위
		// char < int < long < float < double
		int intVal = 15;
		double doubVal = 1.23;
		
		long longVal = intVal ;
		System.out.println(longVal);
		int intVal2 = (int) longVal;//ctrl+1 가이드가 나옴
		System.out.println(intVal2);
		double doubleVal = 10.33333;
		int intVal3 = (int) doubleVal;
		System.out.println(intVal3); //주의해야할 소수점 손실
		
		//문자열을 정수 타입으로 형변환
		String strNum = "1234";
		int intNum = Integer.parseInt(strNum);
		System.out.println(intNum);
		System.out.println(strNum + 100);
		System.out.println(intNum + 100);
		//정수 타입을 문자열과 더하면 문자열이 됨.
		String strCaSt = intNum + "";
		System.out.println(strCaSt + 100);
		//toString를 사용해도 문자열이 됨./
		String strCaSt2 = Integer.toString(intNum);
		System.out.println(strCaSt2+100);
		
	}

}
