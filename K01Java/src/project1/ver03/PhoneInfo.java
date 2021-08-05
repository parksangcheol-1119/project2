package project1.ver03;
/*
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
 

 */

//보강 3번 클래스파트 참고
public class PhoneInfo {//클래스명

	String name;//이름 멤버
	String phoneNumber;//전화번호 멤버
	String birthday;//생년월일 멤버
	
	//인스턴스생성
	//멤버 3개있는거
	public PhoneInfo(String name, String phoneNumber, String birthday) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.birthday = birthday;
	}
	
	//생년월일 없어도 되는거
	public PhoneInfo(String name, String phoneNumber) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.birthday = "입력되지않음";
	}
	
	//정보를 출력할 수 있는 메소드
	public void showPhoneInfo() {
		System.out.println("입력된 정보 출력...");
		System.out.println("name:"+ name);
		System.out.println("phone:"+ phoneNumber);
		System.out.println("birth:"+ birthday);
	}
	
}
