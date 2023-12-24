package com.javalec.ifeleif;

import java.util.Scanner;

public class AverageClass {
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("국어 점수를 입력하세요");
		int kor = scanner.nextInt();
		System.out.println("영어 점수를 입력하세요");
		int eng = scanner.nextInt();
		System.out.println("수학 점수를 입력하세요");
		int math = scanner.nextInt();
		
		double avg = (kor + eng + math) / 3;
		
		System.out.println("평균 점수는" + avg + "입니다.");
		
		if (kor > avg) {
			System.out.println("국어점수는 평균보다 높다.");
		}else if (kor < avg) {
			System.out.println("국어 점수는 평균보다 낮다.");
		}else {
			System.out.println("국어 점수는 평균입니다.");
		}
		
		if (eng > avg) {
			System.out.println("영어점수는 평균보다 높다.");
		}else if (eng < avg) {
			System.out.println("영어 점수는 평균보다 낮다.");
		}else {
			System.out.println("영어 점수는 평균입니다.");
		}
		
		if (math > avg) {
			System.out.println("수학점수는 평균보다 높다.");
		}else if (math < avg) {
			System.out.println("수학 점수는 평균보다 낮다.");
		}else {
			System.out.println("수학 점수는 평균입니다.");
		}
	}
}
