package ch08_collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class CollectionList {

	public static void main(String[] args) {
		/*
		 * 컬렉션 프레임워크는 데이터를 보다 쉽게 다를 수 있도록
		 * 재사용 가능한 컬렉션 클래스를 제공함
		 * List, Set, Map
		 * 1.List : 순서대로 객체를 저장하는 구조, 중복된 원소를 허용
		 * 			원소에 접근하기 위해 인덱스를 사용
		 * 			대표적인 ArrayList, LinkedList
		 * 2.Set  :중복을 허용하지 않는 객체의 모음
		 * 		   원소의 순서는 보장되지 않음
		 * 		   대표 :HashSet, TreeSet
		 * 1.Map  :키와 값의 쌍으로 이루어진 객체를 저장하는 구조
		 * 		   키는 중복될 수 없으며
		 * 		   각 키는 하나의 값을 가리킴.
		 * 		   대표 : HashMap, TreeMap
		 * 
		 */
		
		//ArrayList(동적 배열형태)
		ArrayList<String> student = new ArrayList<String>();
		//<> <--이부분을 제네릭(Generic)이라고함.
		//코드에서 타입의 안정성을 보장할 수 있으며 불필요한 타입 캐스팅을 줄일 수 있음.
		//제네릭 객체(참조타입)만 담을 수 있음.
		//Wrapper Class (기본타입을 객체로 만든 클래스)
		ArrayList<Integer> intList = new ArrayList<Integer>();
		//래퍼클래스는 (byte, short, int, long, float, double, char, boolean)
		//의 기본 타입이름의 앞글자 대문자로 되어있음.
		//list 기본 메서드 .add(요소) 요소 추가시 사용
		intList.add(5);
		intList.add(1);
		intList.add(2);
		intList.add(4);
		System.out.println(intList);
		
		student.add("팽수");
		student.add("길동");
		student.add("동길");
		System.out.println(student);
		
		//.get(인덱스) 해당 인덱스 값을 리턴
		System.out.println(intList.get(0));
		//.set(인덱스, 값)요소 변경
		student.set(0, "팽귄");
		System.out.println(student);
		//.contains(값) 리스트 안에 해당 값이 존재하면 true리턴, 아닐경우 false
		System.out.println(student.contains("길동"));
		//.indexof(값)리스트 안에 해당 값이 몇번에 존재하는지 리턴 없으면 -1
		System.out.println(student.indexOf("팽귄"));
		//.isEmpty()리스트 비어있는지 체크(true/false)
		System.out.println(student.isEmpty());
		//.size()리스트의 요소 수
		System.out.println(student.size());
		//.remove(값) 해당값이 있으면 삭제 없으면 아무일 안일어남.
		student.remove("팽귄");
		System.out.println(student);
		//.clear()리스트 비움(size 0됨)
		student.clear();
		System.out.println(student);
		intList = new ArrayList<>();//clear() 처럼 비워짐
		System.out.println(intList);
		System.out.println("\n=============================");
		
		student.add("김규영");
		student.add("김동현");
		student.add("김상준");
		student.add("김성윤");
		student.add("김세준");
		System.out.println(student);
		for(int i=0; i<student.size();i++) {
			student.set(i,(i+1) + "." + student.get(i));
		}
		System.out.println(student);
		//리스트 복사
		ArrayList<String> copyList = new ArrayList<String>();
		copyList.addAll(student);
		System.out.println(copyList);
		//리스트 복사2
		ArrayList<String> copyList2 = (ArrayList<String>) copyList.clone();
		System.out.println(copyList2);
		//리스트 복사3(특정작업 처리 후 복사할떄 많이 사용)
		ArrayList<String> copyList3 = new ArrayList<String>();
		for(int i =0; i<student.size();i++) {
			copyList3.add(student.get(i));
		}
		System.out.println(copyList3);
		
		//항상된 for문
		for(String str: student) {
			System.out.println(str);
		}
		String[] strArr = {"1", "2", "3"};
		for(String str: strArr) {
			System.out.println(str);
		}
		
		//값을 주면서 선언
		ArrayList<Integer> numbers =
		new ArrayList<Integer>(Arrays.asList(30, 23, 1, 44, 52));
		System.out.println(numbers);
		
		//정렬 오름차순
		Collections.sort(numbers);
		System.out.println(numbers);
		//정렬 내림차순
		Collections.sort(numbers, Collections.reverseOrder());
		System.out.println(numbers);
		
	}

}
