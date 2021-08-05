package project1;

import java.util.Scanner;

import project1.ver03.PhoneBookManager;

/*
 3단계[배열] : PhoneBookVer03.java
객체배열을 이용해서, 프로그램 사용자가 입력하는 정보가 최대 100개까지 유지되도록 프로그램을 변경하시오.
그리고 다음과 같은 기능을 추가로 삽입한다.
-저장 : 이름, 전화번호, 생년월일 정보를 대상으로 저장의 과정을 진행한다.
-검색 : 이름을 기준으로 데이터를 찾아서 해당 데이터를 출력한다.
-삭제 : 이름을 기준으로 데이터를 찾아서 삭제의 과정을 진행한다. 단 배열의 중간에 저장된 데이터를 
삭제할경우 해당 요소의 뒤에 저장된 요소들을 한칸씩 앞으로 이동시키는 형태로 삭제를 진행한다.
[1,2,3,4,5] 좌측배열에서 인덱스 3을 지웠다면 [1,2,4,5] 처럼 되어야 한다.
 
끝으로 저장, 검색, 삭제의 기능을 담당하는 PhoneBookManager클래스를 정의해서 프로그램을 완성하자.

멤버메소드명 
메뉴출력 : printMenu()
입력 : dataInput()
검색 : dataSearch()
삭제 : dataDelete()
주소록전체출력 : dataAllShow()

 */
public class PhoneBookVer03 {

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
				manager.save();
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
