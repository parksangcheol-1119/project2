package project1;

import java.util.Scanner;

import project1.ver04.PhoneBookManager;

/*
-PhoneInfo 클래스에서 생일과 관련된 멤버변수와 코드를 삭제한다.
-다음 2개의 클래스를 추가한다.
#  Class PhoneSchoolInfo extends PhoneInfo{
String 전공;
Int 학년;
}
#  Class PhoneCompanyInfo extends PhoneInfo {
String 회사명;
}
-프로그램의 흐름을 담당하는  PhoneBookManager 클래스를 정의한다.
-나머지는 실행결과를 보고 확인하도록 한다.


 */
public class PhoneBookVer04 {

	public static void printMenu() {
		System.out.println("------------메뉴-----------");
		System.out.println("1.데이터입력" + "2.데이터검색");
		System.out.println("3.데이터삭제" + "4.주소록 출력");
		System.out.println("5.프로그램 종료");
		System.out.println("--------------------------");
		System.out.println("숫자를 입력하세요");
	}
	
	public static void main(String[] args) {

		//입력받기
		Scanner scan = new Scanner(System.in);
		PhoneBookManager manager = new PhoneBookManager();
	
		while(true) {
			
			printMenu();
			
			int select = scan.nextInt();
			
			switch(select) {
			
			case 1:
				manager.newmenu();
				break;
			case 2:
				manager.search();
				break;
			case 3:
				manager.delete();
				break;
			case 4:
				manager.dataAllshow();
				break;
			case 5:
				System.out.println("종료합니다");
				return;
			}//switch문
		}//while문
	}//메인

}//클래스
