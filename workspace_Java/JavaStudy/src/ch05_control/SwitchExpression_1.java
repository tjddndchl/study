package ch05_control;

public class SwitchExpression_1 {

	public static void main(String[] args) {
		char grade ='a';
		
		switch (grade) {
		case 'A', 'a'->{ 
			System.out.println("우수 회원입니다.");
			break;
		}
		case 'B', 'b'->{
			System.out.println("일반 회원입니다.");
			break;
		}
		default->{
			System.out.println("손님입니다.");
		}
		}
		String grade1 ="B";
		int score1 = 0;
		switch(grade1) {
		case "A":
			score1 = 100;
			break;
		case "B":
			int result = 100-20;
			score1 = result;
			break;
		default:
			score1 = 60;
		}
		System.out.println("score1:"+ score1);
		
		int time = (int)(Math.random()*4) + 8;
		System.out.println("현재시간 :"+time+"시");
		
		switch (time) {
		case 8:
			System.out.println("출근합니다.");
			break;
		case 9:
			System.out.println("회의를 합니다..");
			break;
		case 10:
			System.out.println("업무를 봅니다..");
			break;
		case 11:
			System.out.println("외근을 나갑니다.");
			break;

		default:
			break;
		}
	}

}
