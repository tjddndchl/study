package programmers.levle02;

public class Solution01 {

	public static void main(String[] args) {
		
		
		
		
		int n = 14;
		System.out.println(solution(n));
		

	}
    public static int solution(int n) {
    	
    	
        int answer = 0, cnt = 0;
        
        n =n -  cnt;
        while (n > 0) {
			cnt ++;				//cnt 나누는 횟수 
			n = n - cnt;
			if (n % cnt ==0) answer++;
		}
        
        return answer ;
    }
}
