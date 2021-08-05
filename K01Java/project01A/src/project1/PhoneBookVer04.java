package project1;

import java.util.Scanner;

import project1.ver04.PhoneBookManager;

public class PhoneBookVer04 {
	
	public static void printMenu() {
		System.out.println("========================"
				+ "====================메뉴================="
				+ "==========================");
		System.out.println("[1] 데이터 입력 | [2] 데이터 검색"
				+ " | [3] 데이터 삭제 | [4] 주소록 출력 | [5] 프로그램 종료");
		System.out.println("=================================="
				+ "==========================================="
				+ "==============");
		System.out.print("※ 메뉴 선택(정수입력) : ");
	}

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		PhoneBookManager manager =  new PhoneBookManager(100);
	
		while(true) {
			
			printMenu();
			
			int select = scan.nextInt();
			
			switch(select) {
			
			case 1:
				manager.dataInput();
				break;
			case 2:
				manager.dataSearch();
				break;
			case 3:
				manager.dataDelete();
				break;
			case 4:
				manager.dataAllshow();
				break;
			case 5:
				System.out.println("※ 프로그램을 종료합니다.");
				return;
			}
			
		}

	}

}
