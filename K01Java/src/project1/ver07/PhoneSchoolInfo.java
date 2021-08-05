package project1.ver07;
/*
 Class PhoneSchoolInfo extends PhoneInfo{
String 전공;
Int 학년;
}
 */
public class PhoneSchoolInfo extends PhoneInfo {
//자동완성
	
	String major;
	int haknun;
	
	public PhoneSchoolInfo(String name, String phoneNumber,
			String major, int haknun) {
		super(name, phoneNumber);
		this.major = major;
		this.haknun = haknun;
	}

	//상속파트니까 오버라이딩
	public void showPhoneInfo() {
		super.showPhoneInfo();
		System.out.println("전공:" + major);
		System.out.println("학년:" + haknun + "학년");
		
	}
}
