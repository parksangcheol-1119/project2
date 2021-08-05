package project1;

import project1.ver01.PhoneInfo;

public class PhoneBookVer01 {

	public static void main(String[] args) {

		PhoneInfo phoneinfo = new PhoneInfo("성낙현", "010-7906-3600", "751130");
		phoneinfo.showPhoneInfo();
		
		PhoneInfo phoneinfo2 = new PhoneInfo("류상미", "010-7669-4120");
		phoneinfo2.showPhoneInfo();
	}

}
