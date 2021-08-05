package project1;

import java.util.InputMismatchException;
import java.util.Scanner;

import project1.ver06.MenuSelectException;
import project1.ver06.Menultem;
import project1.ver06.PhoneBookManager;

/*
-예외처리1 : 메뉴를 입력할 때 1~5이외의 정수를 입력했을경우 MenuSelectException(개발자정의) \
예외를 발생시키고 이를 적절히 처리해보자.
-예외처리2 : 메뉴를 선택할 때 정수대신 문자열을 입력하면 InputMismatchException 예외가 발생될것이다.
 이를 적절히 예외처리 해보자.
-예외처리3 : 이클립스에서는 검색결과가 없을때 NullPointerException이 발생한다. 
이를 적절히 처리해보자.(테스트시 발생여부가 확인되지 않는다면 그냥 넘어간다)

조건
- 메뉴입력은 nextInt(); 를 사용한다.
- 예외가 발생할 경우 메시지를 띄워주고 메뉴를 재선택 하도록 처리한다. 즉 프로그램이 종료되지 않도록 한다.


 */
public class PhoneBookVer06 {

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
			try {
			
			int select = scan.nextInt();
			PhoneBookManager.scan.nextLine();//이게 버퍼 날리는거
			
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
			}//switch
//			}//try //왜 오류가 나는지 모르겠다.. 여쭤볼것
//			catch(MenuSelectException e) {
//				System.out.println(e.getMessage());
//				System.out.println("1~5이내의 정수를 입력해주세요");
//				
			}//catch
			catch(InputMismatchException e) {
				System.out.println("입력은 숫자로 하세요");
				System.out.println("문자는 허용되지 않습니다");
				System.out.println(e.getMessage());
				PhoneBookManager.scan.nextLine();
				
			}
		}//while문
		}//while문
	}//메인



//클래스
