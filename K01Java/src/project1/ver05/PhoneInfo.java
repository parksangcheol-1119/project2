package project1.ver05;
/*
 생일에 대한 정보 지우기 , 없어도 되는걸 남겨야겠지??
 폰북매니저에서도 birthday 지우기
 */

//보강 3번 클래스파트 참고
public class PhoneInfo {//클래스명

	String name;//이름 멤버
	String phoneNumber;//전화번호 멤버
	String birthday;//생년월일 멤버
	
	//인스턴스생성
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
