package pratice.ex;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Solution {

	public static void main(String[] args) {

	}
    boolean solution(String s) {
        boolean answer = true;
        int count = 0;
        
        for(char c: s.toCharArray()) {
        	if (c== '(') {
				count++;
			}else {
				count--;
			}
        }
        
        if (count == 0) {
			answer = true;
		}else {
			answer = false;
		}
		
		
        

        return answer;
    }
}
