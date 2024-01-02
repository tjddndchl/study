import java.util.Calendar;

public class MainClass {
	public static void main(String[] args) {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		int day1 = calendar.get(Calendar.DAY_OF_WEEK);
		int day2 = calendar.get(Calendar.DAY_OF_WEEK_IN_MONTH);
		
		int hour = calendar.get(Calendar.HOUR);
		int hour2 = calendar.get(Calendar.HOUR_OF_DAY);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		
		int[] all = {year, month, day, day1, day2, hour, hour2, minute, second};
		
		for (int i = 0; i < all.length; i++) {
			System.out.println(all[i]);
		}
		
		System.out.println(System.currentTimeMillis());
		
//		String str = "A";
//		long startNum = System.currentTimeMillis();
//		
//		for (int i = 0; i < 50000; i++) {
//			str += str + "A";
//		}
//		
//		long endNum = System.currentTimeMillis();
//		System.out.println(" 경과시간 :" + (endNum - startNum));
		
		
		StringBuilder stringBuilder = new StringBuilder();
		long startNum1 = System.currentTimeMillis();
		
		for (int i = 0; i < 50000; i++) {
			stringBuilder = stringBuilder.append("A");
		}
		
		long endNum1 = System.currentTimeMillis();
		System.out.println("경과시간 :" + (endNum1 - startNum1));
		
		
		String str1 = "abcdefg";
		String str2 = "HIJKLMN";
		String str3 = "opqrstuv";
		
		System.out.println(str1.concat(str2));
		System.out.println(str1.substring(3));
		System.out.println(str1.substring(0, 3));
		System.out.println(str1.charAt(1));
		System.out.println(str1.indexOf("c")); //위치 인덱스
		System.out.println(str1.indexOf("a"));
		
		
	}
}
