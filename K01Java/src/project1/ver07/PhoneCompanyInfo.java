package project1.ver07;
/*
 #  Class PhoneCompanyInfo extends PhoneInfo {
String 회사명;
}
 */
public class PhoneCompanyInfo extends PhoneInfo {
//자동완성
	String company;
	
	public PhoneCompanyInfo(String name, String phoneNumber, String company) {
		super(name, phoneNumber);
		this.company = company;
	}
	
	public void showPhoneInfo() {
		super.showPhoneInfo();
		System.out.println("회사명:"+ company);
	}

}
