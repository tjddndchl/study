package pratice.submit01;

import java.util.ArrayList;
import java.util.Iterator;

public class Example7 {

	public static void main(String[] args) {
		ArrayList<Integer>weekLotto =null;
		weekLotto =makeLotto();
		System.out.println(weekLotto);
		

	}
	
	public static ArrayList<Integer> makeLotto(){
		ArrayList<Integer> num = new ArrayList<Integer>();
		for(int i=0; i<6;i++) {
			num.add(i, (int)(Math.random()*45+1));
			for(int j=0; j<i; j++) {
				if(num.get(i)==num.get(j)) {
					num.set(i, j);
					i--;
				}
			}
		}
		
		return num;
		
//		}
//		
//		
//
//	
//	public static ArrayList<Integer> makeLotto(String[] numarr){
//		ArrayList<Integer> num = new ArrayList<Integer>();
//		String[] = new String [6];
//		for(int i=0; i<6;i++) {
//			
//			num.add(i, (int)(Math.random()*45+1));
//			
//		}
//		return num;
		
	
	}

}
