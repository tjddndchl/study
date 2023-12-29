package com.javalec.makecarex;

public class MainClass {
	public static void main(String[] args) {
		
		StarCar starCarLowGrade = new StarCarLowGrade(CarSpecs.COLOR_BLUE, CarSpecs.TIRE_NORMAL, CarSpecs.DISPLACEMENT_2000, CarSpecs.HANDLE_NORMAL);
		StarCar starCarHighGrade = new StarCarHighGrade(CarSpecs.COLOR_RED, CarSpecs.TIRE_WILD, CarSpecs.DISPLACEMENT_2200, CarSpecs.HANDLE_POWER);
		
		starCarLowGrade.getSpec();
		starCarHighGrade.getSpec();
	}
}
