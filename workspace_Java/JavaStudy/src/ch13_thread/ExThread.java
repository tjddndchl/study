package ch13_thread;

import oracle.net.ano.SupervisorService;

public class ExThread extends Thread{
	int num;

	public ExThread(int num, String name) {
		super(name);
		this.num = num;
	}
	public void run() {
		for(int i = num; i <= num +5; i++) {
			//현재실행중인 thread 이름 출력
			System.out.println(super.getName()+" " + i);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
