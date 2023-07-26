package pratice.submit01;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;

public class Example7 {

	public static void main(String[] args) {
		ArrayList<Integer>weekLotto =null;
		String[] numArr = {"1", "18"};
		weekLotto =makeLotto(numArr);
		System.out.println(weekLotto.toString());
		

	}
	
	public static ArrayList<Integer> makeLotto(){
		ArrayList<Integer> num = new ArrayList<Integer>();
		for(int i=0; i<6;i++) {
			num.add(i, (int)(Math.random()*45+1));
			for(int j=0; j<i; j++) {
				if(num.get(i)==num.get(j)) {
					num.remove(i);
					i--;
				}
			}
		}
		
		return num;
		

		
	
	}
	public static ArrayList<Integer> makeLotto(String [] strArr){
		ArrayList<Integer> num = new ArrayList<Integer>();
		for (int i=0;i<strArr.length;i++){
		num.add(Integer.parseInt(strArr[i]));
		}
		
		for(int k=0; k<6-strArr.length;k++) {
			num.add(k, (int)(Math.random()*45+1));
			for(int j=0; j<k; j++) {
				if(num.get(k)==num.get(j)) {
					num.remove(k);
					k--;
				}
			}
		}
		
		
		
		Collections.sort(num);
		return num;

	}
	
}
