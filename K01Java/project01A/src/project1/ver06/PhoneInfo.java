package project1.ver06;

public class PhoneInfo {
	
	String name;
	String phoneNumber;
	
	public PhoneInfo() {}
	public PhoneInfo(String name, String phoneNumber) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
	}
	
	public void showPhoneInfo() {
		System.out.println("==========입력정보출력==========");
		System.out.println("이름 : "+ name);
		System.out.println("전화번호 : "+ phoneNumber);
	}	
	
}
