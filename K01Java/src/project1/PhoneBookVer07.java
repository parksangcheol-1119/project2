package project1;
/*
 동명이인이 있다고 가정했을때 3단계에서 진행한 배열을 이용해서는 구조적으로 중복을 막을수 없다. 
 이번에는 중복 저장을 허용하지 않는 HashSet<E> 클래스를 대상으로 저장이 되도록 해보자. 
“이름이 같으면 다른 정보가 달라도 동일한 객체(인스턴스)로 간주한다”
즉 동일한 이름을 입력하는 경우라면 덮어쓸지 여부를 물어본후 처리한다.


 */
import java.util.InputMismatchException;
import java.util.Scanner;

import project1.ver06.MenuSelectException;
import project1.ver06.Menultem;
import project1.ver06.PhoneBookManager;


public class PhoneBookVer07 {

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
