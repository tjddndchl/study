package ch06_Method;

public class Recursion {

	public static void main(String[] args) {
		Func(5);
		long no =factorial(5);
		
		System.out.println(no);
		no = reFactorial(5);
		System.out.println(no);

	}
	
	public static void Func(int num) {
		if(num ==0 ) {
			return;
		}else {
			System.out.println("hi");
			//자신을 호출
			Func(num-1);
		}
	}
	
	public static long reFactorial(int num) {
		if(num ==1) {
			return 1;
		}
		//3을 넣었다면
		//3* reFactorial(2)
		//3* 2 * reFactorial(1)....
		return num * reFactorial(num-1);
	}
	public static long factorial(int num) {
		long sum = 1;
		for(int i =1; i<= num; i++) {
			sum *= i;
		}
		return sum ;
	}
	
}
