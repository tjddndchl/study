package programmers.levle02;

import oracle.net.aso.a;

public class Solution {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		   Solution solution = new Solution();
		    String s = "1001001";
		    int[] result = solution.solution(s);
		    System.out.println("이진 변환 횟수: " + result[0]);
		    System.out.println("제거된 0의 개수: " + result[1]);
		

	}
	public int[] solution(String s) {
	    int[] answer = new int[2]; // 결과를 담을 배열 [이진 변환 횟수, 제거된 0의 개수]

	    while (!s.equals("1")) {
	        int originalLength = s.length(); // 원래 문자열의 길이
	        s = s.replaceAll("0", ""); // 0을 제거
	        int newLength = s.length(); // 0을 제거한 후의 길이

	        // 제거된 0의 개수를 누적
	        int removedZeros = originalLength - newLength;
	        answer[1] += removedZeros;

	        // 이진 변환 횟수를 증가
	        answer[0]++;
	        
	        // 새로운 이진 변환 대상 문자열 생성
	        s = Integer.toBinaryString(newLength);
	    }

	    return answer;
	}
}
