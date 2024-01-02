package excom.javalec.ex;

public class MainClass {
	public static void main(String[] args) {
		
		int i = 10;
		int j = 0;
		
		System.out.println(j * i);
		try {
			System.out.println(j / j);
		} catch (Exception e) {
			e.printStackTrace(); //좀더 자세히 에러메세지를 보고자할때 씀
		}
		
		System.out.println(j + i);
		System.out.println(j - i);
		
		int[] iArr = {1, 2, 3};
		
		try {
			System.out.println("*********************");
			System.out.println(iArr[3]);
			System.out.println("============================");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("무조건 실행합니다.");
		}
		
	}
}
