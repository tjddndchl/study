package com.javelec.store;

public class MainClass {
	public static void main(String[] args) {
		
		
		HeadQuaterStore store1 = new StoreNum1();
		store1.orderKimChijjige();
		store1.orderBuDae();
		store1.orderBiBim();
		store1.orderSunDaeGuk();
		store1.orderGongGibap();
		
		System.out.println("===============================");
		
		HeadQuaterStore store2 = new StroreNum2();
		store2.orderBiBim();
		store2.orderBuDae();
		store2.orderGongGibap();
		store2.orderKimChijjige();
		store2.orderSunDaeGuk();
		
		
	}
}
