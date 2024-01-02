package com.javalec.ex13;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ISO {
	public static void main(String[] args) {
		LocalDateTime time = LocalDateTime.now();
		String a = "2014-05-04T00:59:59";
		
		String date = LocalDate.parse("2014-05-04").format(DateTimeFormatter.ISO_DATE);
		String date1 = LocalDateTime.parse(a).format(DateTimeFormatter.ISO_DATE_TIME);
		System.out.println(date);
		System.out.println(date1);
	}
}
