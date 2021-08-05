package project1;

import java.util.InputMismatchException;
import java.util.Scanner;

import project1.ver06.PhoneBookManager;

import project1.ver06.MenuItem.Select;
import project1.ver06.MenuSelectException;

public class PhoneBookVer06 {
	
	public static void printMenu() {
		System.out.println();
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
			
			int select = 0;
			
			try {
				select = scan.nextInt();
				System.out.println();
			
				if(select < 0) {
					MenuSelectException ex = new MenuSelectException();
					throw ex;
				}
				else if(select > 5) {
					MenuSelectException ex2 = new MenuSelectException();
					throw ex2;
				}
				switch(select) {
				
				case Select.INPUT:
					manager.dataInput();
					break;
				case Select.SEARCH:
					manager.dataSearch();
					break;
				case Select.DELETE:
					manager.dataDelete();
					break;
				case Select.ALLSHOW:
					manager.dataAllshow();
					break;
				case Select.EXIT:
					System.out.println("※ 프로그램을 종료합니다.");
					return;
				}
			}
			catch (InputMismatchException e) {
				System.out.println("정수를 입력해주세요.");
				scan.nextLine();
			}
			catch (MenuSelectException e) {
				System.out.println(e.getMessage());
			}
			
		}

	}

}
