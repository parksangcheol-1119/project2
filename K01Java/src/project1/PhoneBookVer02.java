package project1;

import java.util.Scanner;
import project1.ver02.PhoneInfo;

/*
 프로그램 사용자로부터 데이터를 입력받는 형태로 변경하시오.
단 반복문을 이용해서 프로그램의 흐름이 계속 유지되도록 해야한다. 사용자가 종료를 명령하지
 않으면 다음과 같은 과정이 반복적으로 이루어진다.
키보드를 통한 데이터입력 -> 생성자를 통한 인스턴스생성 -> showPhoneInfo() 메소드호출
매 실행시 마다 기존 생성된 인스턴스는 유지되지 않아도 된다.(다음단계에서 진행)

실행결과>
선택하세요...
1. 데이터 입력
2. 프로그램 종료
선택: 1
이름: 성낙현
전화번호: 010-7906-3600
생년월일: 75.11.30
 
입력된 정보 출력...
name: 성낙현
phone: 010-7906-3600
birth: 75.11.30
 
선택하세요...
1. 데이터 입력
2. 프로그램 종료
선택: 2
프로그램을 종료합니다.


 */

public class PhoneBookVer02 {

		//13 인터페이스 04번 참고하기	
		//이름 전화번호 생일 입력받기
	public static void input(){
		
	Scanner scan = new Scanner(System.in);
	
	String name;
	String phoneNumber;
	String birthday;

	System.out.print("이름: ");
	name = scan.nextLine();
	
	System.out.print("전화번호: ");
	phoneNumber =scan.nextLine();
	
	System.out.print("생년월일: ");
	birthday = scan.nextLine();
	
	//if로 될까 
	/*if문(조건문, 분기문)
	형식1
		if(조건문){
			실행문1;
			실행문2;
		}
	-if문의 조건문은 반드시 비교식 혹은 논리식 이어야 한다. 
	-즉 결과값이 boolean타입(true, false)이여야 한다. 
	-실행할 문장이 하나인경우 중괄호 생략이 가능하다. 
	*/
	if(birthday==null) {
		PhoneInfo phoneinfo = new PhoneInfo(name, phoneNumber);
		phoneinfo.showPhoneInfo();
	}
	else {
		PhoneInfo phoneinfo = new PhoneInfo(name, phoneNumber, birthday);
		phoneinfo.showPhoneInfo();
	}
	
		
	}//인풋 끝

			
	
	
	/*
	실행결과>
	선택하세요...
	1. 데이터 입력
	2. 프로그램 종료
	*/
	
	public static void menu() {//스캐너 메뉴
		System.out.println("선택하세요..");
		System.out.println("1. 데이터입력");
		System.out.println("2. 프로그램 종료");
		System.out.println("선택:");
	}//메뉴
	
	public static void main(String[] args) {

		/*
		 단 반복문을 이용해서 프로그램의 흐름이 계속 유지되도록 해야한다. 
		 while문
	: 반복의 횟수가 정해져있지 않을때 주로 사용하는
	반복문이다. 반복의 횟수가 명확할때는 주로 for문을
	사용한다. 
	형식]
		반복을 위한 변수의 초기값 선언;
		while(반복의조건){
			실행문;
			변수의 증감식; <= 반복문 탈출을 위한 연산
		}
		반복의 조건이 false일때 while문을 탈출한다. 
		※반복문의 처음으로 돌아가면 무조건 반복의 조건을 확인한다.
 */
		 //반복의 조건을 확인해야하니까 탈출을 종료로?
	
		Scanner scan = new Scanner(System.in);
		
		while(true) {//사실일때
			menu();//메뉴호출
		
			int sel = scan.nextInt();//인트타입 스캔
		
		switch(sel) {
		case 1:
				input();
				break;//브레이크 없으면 모두다 실행				
		case 2:
			System.out.println("프로그램을 종료합니다");
			return;
		}
		/*
		switch문
			if문처럼 조건에 따라 분기하는 제어문으로, 정수식의 값과
			동일한 부분을 찾아 실행하는 형태를 가지고있다. 
			형식]
				switch(산술식 or 정수식){
				case 값1:
					실행문1; break;
				case 값2:
					실행문2; break;
				default:
					위의 값과 매칭되지 않을때 실행되는 문장
					else와 같은 의미라 보면된다. 
				}
			※ switch문 내부에서 break문을 만나게되면 실행이
			중지되고 밖으로 탈출하게 된다. 
			※ 만약 break문이 없다면 그 아래의 모든 실행문이
			실행되게 된다. 
		 */
		
		}//while문

	}//메인

}// PhoneBookVer02 클래스 끝
