package ch08_interpace.pratice08;

import ch14_jdbc_conn.jdbc.connectionFactory;

public class Example {

	public static void action(A a) {
		a.method1();
		if(a instanceof C c) {
			c.method2();
		}
	}
	
	public static void main(String[] args) {
		action(new B());
		action(new C());
			
	}

}
