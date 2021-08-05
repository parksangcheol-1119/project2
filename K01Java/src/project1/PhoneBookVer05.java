package project1;

import java.util.Scanner;

import project1.ver05.Menultem;
import project1.ver05.PhoneBookManager;

/*
기존 프로그램은 메뉴입력을 할 때 이름이 부여된 상수가 아닌 정수로 처리되고 있다.
때문에 Ver05 에서는 interface 기반의 상수표현에 의한 처리를 해보도록 한다. 이를 통하여 코드는 보다 명확해 질 것이다.

1.데이터입력
2.데이터검색
3.데이터삭제
4.출력
5.프로그램종료

1.일반
2.학교동창
3.회사동료
위의 메뉴를 interface형 상수로 처리해본다.


 */
public class PhoneBookVer05 {

	public static void printMenu() {
		System.out.println("------------메뉴-----------");
		System.out.println("1.데이터입력" + "2.데이터검색");
		System.out.println("3.데이터삭제" + "4.주소록 출력");
		System.out.println("5.프로그램 종료");
		System.out.println("--------------------------");
	}
	
	public static void main(String[] args) {

		//입력받기
		Scanner scan = new Scanner(System.in);
		PhoneBookManager manager = new PhoneBookManager();
	
		while(true) {
			
			printMenu();
			
			int select = scan.nextInt();
			
			switch(select) {
			
			case Menultem.save:
				manager.newmenu();
				break;
			case Menultem.search:
				manager.search();
				break;
			case Menultem.delete:
				manager.delete();
				break;
			case Menultem.print:
				manager.dataAllshow();
				break;
			case Menultem.exit:
				System.out.println("종료합니다");
				return;
			}//switch문
		}//while문
	}//메인

}//클래스
