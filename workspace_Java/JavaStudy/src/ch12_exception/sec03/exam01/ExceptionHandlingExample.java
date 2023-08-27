package ch12_exception.sec03.exam01;

public class ExceptionHandlingExample {

	public static void main(String[] args) {
		String[] array = {"100","1oo",null,"200"};
		
		for (int i = 0; i <= array.length; i++) {
			
			
			try {
			int value = Integer.parseInt(array[i]);
			System.out.println("array["+i +"]:" + value);
			}
			catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("베열인덱스가 초과됨"+ e.getMessage());
					}
			
			catch (NullPointerException | NumberFormatException e) {
				System.out.println("데이터에 문제가 있음" + e.getMessage());
			}
			
			
			
		}
		
		
		

	}

}
