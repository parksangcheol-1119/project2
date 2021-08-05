package project1.ver06;

public class PhoneSchoolInfo extends PhoneInfo {
	
	String major;
	int grade;
	
	public PhoneSchoolInfo(String name, String PhoneNumber, 
			String major, int grade) 
	{
		super(name, PhoneNumber);
		this.major = major;
		this.grade = grade;
	}
	
	@Override
	public void showPhoneInfo () {
		super.showPhoneInfo();
		System.out.println("전공 : "+ major );
		System.out.println("학년 : "+ grade +"학년");
	}
}
