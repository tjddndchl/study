package ecample9;

import java.util.Scanner;

public class BankApplication {
	private static Account[] accountArray = new Account[100];
	private static  Scanner scanner =  new Scanner(System.in);
		
	
		
	

	public static void main(String[] args) {
		
	boolean run = true;
	while (run) {
		System.out.println("-----------------------------------------");
		System.out.println("1.계좌생성|2.계좌목록|3.예금|4.출금|5.종료");
		System.out.println("-----------------------------------");
		System.out.println("선택>.");
		
		int seletNo = scanner.nextInt();
		if(seletNo==1) {
			createAccount();
		}else if(seletNo==2) {
			accountList();
		}else if(seletNo==3) {
			deposit();
		}else if(seletNo==4) {
			withdraw();
		}else if(seletNo==5) {
			run = false;
		}
		
		}
	System.out.println("프로그램종료");
	}
	//계좌생성하기
	private static void createAccount() {
		System.out.println("---------");
		System.out.println("계좌생성");
		System.out.println("-----------");
		System.out.println("계좌번호: ");
		String ano = scanner.next();
		System.out.println("계좌주: ");
		String name = scanner.next();
		System.out.println("초기입금금액: ");
		int balance = scanner.nextInt();
		Account newAccount = new Account(ano, name, balance);
		for(int i=0; i<accountArray.length; i++) {
			if(accountArray[i] == null) {
				accountArray[i] = newAccount;
				System.out.println("결과: 계좌가 생성되었습니다.");
				break;
			}
		}
	}
	//계좌목록보기
	private static void accountList() {
		System.out.println("-------");
		System.out.println("계좌목록");
		System.out.println("----------");
		for(int i=0; i<accountArray.length; i++) {
			Account account = accountArray[i];
			if( account != null) {
				System.out.println(account.getAno());
				System.out.println("        ");
				System.out.println(account.getName());
				System.out.println("        ");
				System.out.println(account.getBalance());
				System.out.println();
			}
		}
	}
	//예금하기
	private static void deposit() {
		System.out.println("---------------");
		System.out.println("예금");
		System.out.println("---------------");
		System.out.println("계좌번호: ");
		String ano = scanner.next();
		System.out.println("예금액: ");
		//계좌번호로 Account 찾기

		int money = scanner.nextInt();
		Account account = findAccount(ano);
		if(account==null) {
			System.out.println("결과: 계좌가 없습니다.");
			return;
		}
		System.out.println("예금전:" + account.getBalance());
		account.setBalance(account.getBalance() + money);
		System.out.println("결과: 예금이 성공되었습니다.");
		System.out.println("잔액:" + account.getBalance());
	}
	//출금하기
	private static void withdraw() {
		System.out.println("-----------");
		System.out.println("출금");
		System.out.println("-----------");
		System.out.println("계좌번호: ");
		String ano = scanner.next();
		System.out.println("출금:   ");
		int money = scanner.nextInt();
		Account account = findAccount(ano);
		if(account == null) {
			System.out.println("결과: 계좌가 없습니다.");
			return;
		}
		System.out.println("출금전: " + account.getBalance());
		account.setBalance(account.getBalance() - money);
		System.out.println("결과: 출금이 성공되었습니다.");
		//예금 출금 후 잔액 출력
		System.out.println("잔액: " + account.getBalance());
	}
	//계좌 찾기
	private static Account findAccount(String ano) {
		Account account = null;
		for(int i=0; i<accountArray.length; i++) {
			if(accountArray[i] != null) {
				String dbAno = accountArray[i].getAno();
				if(dbAno.equals(ano)) {
					account =accountArray[i];
					break;
				}
			}
		}
		return account;
	}
}
