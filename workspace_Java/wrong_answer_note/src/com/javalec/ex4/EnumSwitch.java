package com.javalec.ex4;

import java.util.ArrayList;

public class EnumSwitch {

	public static void main(String[] args) {
		enum DayofWeek{
			    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
		};
		
		DayofWeek day = DayofWeek.FRIDAY;
		System.out.println(day);
		switch (day) {
        case MONDAY:
            System.out.println("It's Monday");
            break;
        case TUESDAY:
            System.out.println("It's Tuesday");
            break;
        case WEDNESDAY:
            System.out.println("It's Wednesday");
            break;
        case THURSDAY:
            System.out.println("It's Thursday");
            break;
        case FRIDAY:
            System.out.println("It's Friday"); // "It's Friday" 출력
            break;
        case SATURDAY:
            System.out.println("It's Saturday");
            break;
        case SUNDAY:
            System.out.println("It's Sunday");
            break;
        default:
            System.out.println("Unknown day");
            break;
    }
	}

}
