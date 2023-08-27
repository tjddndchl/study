package ch08_interpace.pratice5;

public class Tv implements Remocon{
	
	@Override
	public void PowerOn() {
		// TODO Auto-generated method stub
		System.out.println("티비를 킵니다.");
	}

	public static void main(String[] args) {
		Remocon r = new Tv();
		r.PowerOn();

	}

}
