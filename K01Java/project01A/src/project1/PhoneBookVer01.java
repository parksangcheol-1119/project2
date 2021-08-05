package project1;

import project1.ver01.PhoneInfo;

public class PhoneBookVer01 {

	public static void main(String[] args) {
		
		PhoneInfo phInf = new PhoneInfo("문경건","010-5363-8764","960120");
		phInf.showPhoneInfo();
		
		PhoneInfo phInf2 = new PhoneInfo("김첨지","010-5555-5555");
		phInf2.showPhoneInfo();

	}

}
