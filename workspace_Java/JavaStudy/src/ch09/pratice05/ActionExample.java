package ch09.pratice05;

public class ActionExample {

	public static void main(String[] args) {
		Action action = new Action() {
			
			@Override
			public void work() {
				System.out.println("존나격렬하게 일하기 싫다.");
				
			}
		};
				
				
		action.work();
				
				
				
	}

}
