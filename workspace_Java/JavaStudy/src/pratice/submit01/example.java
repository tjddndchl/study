package pratice.submit01;

public class example {

	public static void main(String[] args) {

		String name = "홍길동";
		int age = 26;
		double height = 177.9;
		String phone = "010-7398-7332";
		String email = "gildong@gmail.com";
		System.out.println("이름:" + name);
		System.out.println("나이:" + age);
		System.out.println("키:" + height);
		System.out.println("연락처:" + phone);
		System.out.println("이메일:" + email);
		// 문자 편집 shift+alt+A
		// 자동 정렬 ctrl+shift+f

		int example = 278;
		String strEx = example + "";
		String str1 = strEx.substring(0, 1);
		String str2 = strEx.substring(1, 2);
		String str3 = strEx.substring(2, 3);
		// int result = Integer.parseInt(str1)
		// +Integer.parseInt(str2)+Integer.parseInt(str3);
		System.out.println(str1 + str2 + str3);
	}

}
