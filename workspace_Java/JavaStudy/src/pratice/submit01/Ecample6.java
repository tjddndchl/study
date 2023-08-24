package pratice.submit01;

import java.util.concurrent.CountDownLatch;

public class Ecample6 {

	public static void main(String[] args) {
		
		//01.명함만들기
		BusinessCard("이앞길","010-9610-2328","tjddndchl1@naver.com");
		
	//02.같은 성 찾기	
	String[] nameLiSt = {"김규영","김동현","김상준","김성윤","김세준","노윤기"
			,"박근혜","사원기","송현지","신가희","예준서","윤가영"
			,"윤서준","이규환","이상희","이영규","이재우","이호제"
			,"임지윤","정민형","조하은","최민혁","최성웅"};
		
	searchName("최",nameLiSt);	
	//최댓값 최솟값 찾기
	int[] intArr = {23, 456, 213, 32, 464, 1, 2, 4};
			MaxMin(intArr);
	
		
	}
	public static void BusinessCard(String name,String number, String email) {
		System.out.printf("이름 :%s\n전화번호:%s\n이메일:%s\n",name,number,email);
			
			}
	public static void searchName(String seong,String[] member) {
			String a = "";
			int count = 0;
			for(int i=0; i<member.length;i++) {
					Boolean b = member[i].substring(0,1).contains(seong);
					
					if(b==true) {
						a+=member[i]+"씨 ";
						count++;
					}
//					for(int i =0; i<Arr.length; i++) {
//						if(arr[i].substring(0,1).equals(first)) {
//							count++
//							nm=Arr[i]+"씨";
//						}
//					}
					
					
					
				}
			
			System.out.printf("%s씨성을 가진 동기분이 총 %d명있습니다.\n",seong,count);
			System.out.printf("%s ",a);
			System.out.println();
	
			}
	
		public static void MaxMin(int [] number) {
			int max = number[0];
			int min = number[0];
			for(int i=0; i<number.length;i++) {
				if (number[i]>max) {
					max=number[i];
				}
				if (number[i]<min) {
					min= number[i];
				}
			}
			System.out.println("최대값은:"+ max);
			System.out.println("최소값은:"+ min);
			
			
			
		
		
		
		}
		
		
}
	
	
	
	
	
	
			
		
		
		
	
	


