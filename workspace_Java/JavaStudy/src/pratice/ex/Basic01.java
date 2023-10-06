package pratice.ex;

import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

import javax.management.MBeanServer;

import oracle.net.aso.a;
import oracle.net.aso.b;
import pratice.submit01.result01;

public class Basic01 {

	public static void main(String[] args) {

		
	}
	public static int[] solution(int[] arr, int k) {
		
		Set<Integer> hashSet = new LinkedHashSet<>();
		for(int i : arr) {
			hashSet.add(i);
		}
		
		List<Integer> answer = new ArrayList<>(hashSet);
		
		if(answer.size() >= k) {
			while (answer.size() > k) {
				answer.remove(answer.size() - 1);
					
				}
			}else {
				for (int i = answer.size(); i < k; i++) {
					answer.add(-1);
				}
			}
		
		
		return answer.stream().mapToInt(i -> i).toArray();
	}
		
}