package programmers.levle01;

import java.util.HashMap;
import java.util.Map;

public class Kakao2021 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	    Kakao2021 solution3 = new Kakao2021();

	        String s1 = "one4seveneight";
	        System.out.println(solution3.solution3(s1)); // 출력: 1478

	        String s2 = "23four5six7";
	        System.out.println(solution3.solution3(s2)); // 출력: 234567

	        String s3 = "2three45sixseven";
	        System.out.println(solution3.solution3(s3)); // 출력: 234567

	        String s4 = "123";
	        System.out.println(solution3.solution3(s4)); // 출력: 123
	}
    public int solution3(String s) {
        int answer = 0;
        Map<String, String> wordToNumber = new HashMap<>();
        wordToNumber.put("zero", "0");
        wordToNumber.put("one", "1");
        wordToNumber.put("two", "2");
        wordToNumber.put("three", "3");
        wordToNumber.put("four", "4");
        wordToNumber.put("five", "5");
        wordToNumber.put("six", "6");
        wordToNumber.put("seven", "7");
        wordToNumber.put("eight", "8");
        wordToNumber.put("nine", "9");
        
        for(String word : wordToNumber.keySet()) {
        	s = s.replace(word, wordToNumber.get(word));
        }
        
        
        return Integer.parseInt(s);
    }
}
