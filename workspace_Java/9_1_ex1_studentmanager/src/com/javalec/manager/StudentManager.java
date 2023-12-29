package com.javalec.manager;

import java.util.ArrayList;

public class StudentManager {
	
	ArrayList<Student> students =  new ArrayList<Student>();
	StudentExpel studentExpel = new StudentExpel();
	
	public static void main(String[] args) {
		
		StudentManager manager = new StudentManager();
		manager.addStudent("홍길동", 22, 201234867,"영극연화");
		manager.addStudent("홍길순", 23, 201034867,"수학과");
		manager.addStudent("이은경", 24, 201134867,"국문과");
		manager.addStudent("김철수", 21, 201334867,"체육학과");
		
		System.out.println(manager.students.get(0).getName());
		System.out.println(manager.students.get(0).getAge());
		System.out.println(manager.students.get(0).getStudentNum());
		System.out.println(manager.students.get(0).getMajor());
		
		manager.students.get(0).updateInfo(1, "홍길똥");
		
		System.out.println(manager.students.get(0).getName());
	
		 manager.studentExpel.addExpelStudent("이호재", 26, 201719844, "호텔경영학과");
		 manager.students.get(3).setName("티발");
		 
		System.out.println( manager.students.get(3).getName());
		 
	}
	
	private void addStudent(String name, int age, int studentNum, String major) {
		// TODO Auto-generated method stub
		students.add(new Student(name, age, studentNum, major));
		System.out.println(name + "  학생 정보 입력 성공!!");
	}
}
