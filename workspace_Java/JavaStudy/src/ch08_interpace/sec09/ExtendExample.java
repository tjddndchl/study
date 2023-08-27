package ch08_interpace.sec09;

public class ExtendExample {

	public static void main(String[] args) {
		InterfaceCImpl impl = new InterfaceCImpl();
		
		InrerfaceA ia = impl;
		ia.methodA();
		System.out.println();
		
		InerfaceB ib = impl;
		ib.methodB();
		System.out.println();
		
		InterfaceC ic =impl;
		ic.methodA();
		ic.methodB();
		ic.methodC();

	}

}
