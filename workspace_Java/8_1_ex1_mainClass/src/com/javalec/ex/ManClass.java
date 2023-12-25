package com.javalec.ex;

public class ManClass {
	private int age;
	private int height;
	private int weight;
	private String phoneNum;
	
	public ManClass() {
		System.out.println("1");
	}

	public ManClass(int age, int height, int weight, String phoneNum) {
		super();
		System.out.println("2");
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.phoneNum = phoneNum;
	}

	public double calculateBMI() {
		
		double result = weight / (height * height);
		return result;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	
	
	
	


	
	
	
}
