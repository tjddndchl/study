package ch11_java_api;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class ApiData {

	public static void main(String[] args) throws ParseException {
		//1.Date클래스
		//1970년 1월 1일 자정(UTC)이후의 시간을 밀리초 단위로 표현
		
		Date dateToday = new Date();
		System.out.println(dateToday);
		//2023년 08월 02일 09시 분 초
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		String strToday = sdf.format(dateToday);
		System.out.println(strToday);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String strToday2 = sdf2.format(dateToday);
		System.out.println(strToday2);
		//현재 미국 날짜
		sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss",Locale.US);
		TimeZone timeZone = TimeZone.getTimeZone("America/New_York");
		sdf.setTimeZone(timeZone);
		String newYork = sdf.format(dateToday);
		System.out.println(newYork);
		
		System.out.println("=======================\n");
		//날짜(Date 타입) <- ->문자열(String 타입)
		String strDinner = "2023-08-07 18:00:00";
		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date datedinner = sdf.parse(strDinner);
		System.out.println(datedinner);
		System.out.println(dateToday.getTime());
		System.out.println(datedinner.getTime());
		long diffMillSec =datedinner.getTime()-dateToday.getTime();
		System.out.println(diffMillSec+"밀리초 차이");
		long diffSec = diffMillSec/60 ;
		System.out.println(diffSec + "초 차이");
		long diffMin = diffSec/60;
		System.out.println(diffMin + "분 차이");
		long diffHour = diffMin/60;
		System.out.println(diffHour + "시간 차이");
		long diffDate = diffHour / 24;
		System.out.println(diffDate + "일 차이");
		long diff = diffMillSec/(1000*60*60*24);
		System.out.println(diff + "일 차이");
		String strEnd = "2023-12-26 12:00:00";
		
		Date dateEnd = sdf.parse(strEnd);
		System.out.println(dateEnd);
		long diffMillSec2 =dateEnd.getTime()-dateToday.getTime();
		long diff2 = diffMillSec2/(1000*24*60*60);
		System.out.println(diff2 +"일 남았습니다.");
		
		//2.Calendar 클래스 (Year, Month, Day_Of_MONETH와  같은 필트 제공)
		//					특정 시간을 계산하거나 조작할 때 유용함 +1일 +한달...
		// 					new Date처럼 실행되는 시간을 가진 객체가 생성됨
		Calendar calToday = Calendar.getInstance();
		System.out.println(calToday.getTime());
		String today = sdf.format(calToday.getTime());
		//년
		System.out.println(calToday.get(Calendar.YEAR));
		System.out.println(calToday.get(Calendar.MONTH));
		System.out.println(calToday.get(Calendar.DATE));
		System.out.println(calToday.get(Calendar.HOUR_OF_DAY));
		System.out.println(calToday.get(Calendar.MINUTE));
		System.out.println(calToday.get(Calendar.SECOND));
		// 3일뒤
		calToday.add(Calendar.DATE, 3);
		System.out.println(sdf.format(calToday.getTime()));
		//10일전
		calToday.add(Calendar.DATE, -10);
		System.out.println(sdf.format(calToday.getTime()));
		//11달 뒤
		calToday.add(Calendar.MONTH, 11);
		System.out.println(sdf.format(calToday.getTime()));
		//달력 만들기
		Calendar calendar = Calendar.getInstance();
		int year =2023;
		int month = 8;
		calendar.set(year, month-1,1);//1해당일 1일 날짜
		System.out.println(sdf.format(calendar.getTime()));
		//해당 월의 마지막 일자(date)얻기
		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println(lastDay);
		//해당 월의 시작요일
		//1.일요일, 2:월요일...7:토요일
		int startDay = calendar.get(Calendar.DAY_OF_WEEK);
		System.out.println(year + "년" + month + "월 달력" );
		System.out.println("일\t월\t화\t수\t목\t금\t토");
		int currentDay =1;
		for(int i=1; i <=42; i++) {
			if(i < startDay) {
				System.out.print("\t");
			}else {
				System.out.printf("%2d\t", currentDay);
				currentDay++;
				if(currentDay > lastDay) {
					break;
				}
			}
			if(i%7 ==0) {
				System.out.println();
			}
		}
		makeCalender(2023, 9);
		workCalendar(2023, 12);
	}
	public static void makeCalender(int year,int month) {
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(year, month-1,1);//1해당일 1일 날짜
		
		//해당 월의 마지막 일자(date)얻기
		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println(lastDay);
		//해당 월의 시작요일
		//1.일요일, 2:월요일...7:토요일
		int startDay = calendar.get(Calendar.DAY_OF_WEEK);
		System.out.println(year + "년" + month + "월 달력" );
		System.out.println("일\t월\t화\t수\t목\t금\t토");
		int currentDay =1;
		for(int i=1; i <=42; i++) {
			if(i < startDay) {
				System.out.print("\t");
			}else {
				if(!(i%7==1 || i%7==0)) {
					
				System.out.printf("%d\t", currentDay);
				}else {
					System.err.printf("%d\t", currentDay);
				}
				currentDay++;
				if(currentDay > lastDay) {
					break;
				}
			}
			
			if(i%7 ==0) {
				
				System.out.println();
			}
		}

	}
	public static void workCalendar(int year,int month) {
	Calendar calendar = Calendar.getInstance();
		
		calendar.set(year, month-1,1);//1해당일 1일 날짜
		
		//해당 월의 마지막 일자(date)얻기
		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println(lastDay);
		//해당 월의 시작요일
		//1.일요일, 2:월요일...7:토요일
		int startDay = calendar.get(Calendar.DAY_OF_WEEK);
		System.out.println(year + "년" + month + "월 달력" );
		System.out.println("mon\t tue\t wen\t thu\t fri");
		int currentDay =1;
		for(int i=1; i <=42; i++) {
			if(i < startDay) {
				System.out.print("\t");
			}else {
				if(!(i%7==1 || i%7==0)) {
					System.out.printf("%2d\t", currentDay);
				
				}
				currentDay++;
				if(currentDay > lastDay) {
					break;
				}
			}
			
			if(i%7 ==1) {
				
				System.out.println();
			}
		}
	}
}
