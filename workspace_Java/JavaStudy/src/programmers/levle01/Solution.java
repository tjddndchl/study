package programmers.levle01;

import java.util.ArrayList;
import java.util.List;

import pratice.submit01.result01;

public class Solution {

	public static void main(String[] args) {
		int[] arr = {1,1,3,3,3,3,4,4,4,5,5,};
		Solution solution = new Solution();
		int[] result = solution.solution(arr);
		for(int num: result) {
			System.out.printf(num + " ");
		}
		
	}
    public int[] solution(int []arr) {
       ArrayList<Integer> answer = new ArrayList<>();
       
       for (int i = 0; i < arr.length; i++) {
		if (i == 0 || arr[i] != arr[i - 1]) {
			// 현재 원소가 이전 원소와 다를 때만 result 에 추가
			answer.add(arr[i]);
		}
	}
       
       //ArrayList를 int 배열로 변환
      
    int[] result = new int[answer.size()];
    for (int i = 0; i < result.length; i++) {
		result[i] = answer.get(i);
	}
        
        
        
     

        return result;
    }
}
