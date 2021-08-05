package project1;

import java.util.Scanner;

import project1.ver02.PhoneInfo;

public class PhoneBookVer02 {
	
	public static void addInfo() {
		Scanner scan = new Scanner(System.in);
		String name, phoneNumber, birthday;
		
		System.out.print("이름 : ");name  = scan.nextLine();
		System.out.print("전화번호 : ");phoneNumber = scan.nextLine();
		System.out.print("생년월일 : ");birthday = scan.nextLine();
		
		if(birthday=="") {
			PhoneInfo phInf = new PhoneInfo(name, phoneNumber);
			phInf.showPhoneInfo();
		}
		else {
			PhoneInfo phInf = new PhoneInfo(name, phoneNumber, birthday);
			phInf.showPhoneInfo();
		}
	}
	
	public static void menu() {
		System.out.println("===============메뉴===============");
		System.out.println("[1] 데이터 입력 | [2] 프로그램 종료");
		System.out.println("==================================");
		System.out.print("※ 메뉴 선택(정수입력) : ");
	}

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
	
		while(true) {
			
			menu();
			
			int select = scan.nextInt();
			
			switch(select) {
			
			case 1:
				addInfo();
				break;
				
			case 2:
				System.out.println("프로그램을 종료합니다.");
				return;
			}
			
		}

	}

}
