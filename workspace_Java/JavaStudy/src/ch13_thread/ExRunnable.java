package ch13_thread;
//(2) 스레드 사용 2번째 방법 Runnable 인터페이스 구현
public class ExRunnable implements Runnable{
	int num;
	String name;
	
	public ExRunnable(int num, String name) {
		super();
		this.num = num;
		this.name = name;
	}

	@Override
	public void run() {
		for(int i = num; i<=num; i++ ) {
		System.out.println(this.name+" " +i);
		//Thread.sleep()// 현재 실행중인 스레드 멈추는것
		
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
		
			e.printStackTrace();
		}
		}
		
	}
	
}
