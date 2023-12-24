package com.javalec.ex;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class HeightAve {
	public static void main(String[] args) {
		String[] iArrName = {"영희","철수","길동","영수","말자"};
		
		int[] iArr = new int[5];
		int totalHeight = 0;
		int maxH = 0;

		int minH = Integer.MAX_VALUE;

		
		Scanner scanner = new Scanner(System.in);
		
		for (int i = 0; i < iArr.length; i++) {
			System.out.println(iArrName[i] + "키를 입력하세요. : " );
			iArr[i] = scanner.nextInt();
			totalHeight += iArr[i];
			
			//최대 키 업데이트
			if(iArr[i] > maxH) {
				maxH = iArr[i];
			}
			
			//최소 키 업데이트
			if(iArr[i] < minH) {
				minH = iArr[i];
			}
			
		}
		
		List<String> maxHstudents = new ArrayList<String>();
		List<String> minHstudents = new ArrayList<String>();
		
		for (int i = 0; i < iArr.length; i++) {
			if(iArr[i] == maxH) {
				maxHstudents.add(iArrName[i]);
			}
			
			if(iArr[i] == minH) {
				minHstudents.add(iArrName[i]);
			}
		}
	
		System.out.println("학생들의 평균 신장은 " + (totalHeight/5) + " 입니다.");
		System.out.println("가장 큰 학생:" + String.join(", ", maxHstudents));
		System.out.println("가장 작은 학생:" + String.join(", ", minHstudents));
		
	}
}
