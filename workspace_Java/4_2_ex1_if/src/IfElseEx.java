
public class IfElseEx {

	public static void main(String[] args) {
		
		int i = 10;
		int j = 20;
		int h = 30;
		int k = 40;
		
		if (i > j) {
			System.out.println("i는 j 보다" + (i - j)+ "만큼 더 큽니다.");
		} else {
			System.out.println("j 는 i 보다" + (j - i) + "만큼 더 큽니다.");
		}
		
		if (i + j == h) {
			System.out.println("i 하고 j 의 합은 h 입니다.");
		} else {
			System.out.println("i 하고 j 의 합은 h 가 아닙니다.");
		}

	}

}
