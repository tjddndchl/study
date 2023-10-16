package programmers.levle01;

import java.util.ArrayList;

public class Solution1 {

	public static void main(String[] args) {
		
		int n = 45;
		System.out.println(solution(n));
		
		StringBuilder anS = new StringBuilder();
		anS.append(1);
		anS.append(2);
		anS.append(3);
		anS.append(4);
		anS.reverse();
		System.out.println(anS);

	}
    public static int solution(int n) {
    	int answer = 0;
    	StringBuilder base3 = new StringBuilder();
    	
    	while (n > 0) {
			base3.append(n % 3); // insert 와 차이 append 는 끝에 추가함
			n /= 3;
		}
    
    	
    	
    	int power = 1;
    	System.out.println(base3);
    	for (int i = base3.length() -1; i >= 0; i--) {
			answer += (base3.charAt(i)-'0') * power;
			System.out.println(answer);
			power *= 3;
			
		}
    	
    	
        return answer;
    }
}
