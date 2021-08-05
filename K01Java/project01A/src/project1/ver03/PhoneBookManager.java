package project1.ver03;

import java.util.Scanner;

public class PhoneBookManager {
	
	private PhoneInfo[]  ;
	private int numPhoneInfo;
	
	public PhoneBookManager (int num) {
		allInfo = new PhoneInfo[num];
		numPhoneInfo = 0;
	}
	
	public void dataInput() {
		
		Scanner scan = new Scanner(System.in);
		String name, phoneNumber, birthday;
		
		System.out.print("이름 : ");name  = scan.nextLine();
		System.out.print("전화번호 : ");phoneNumber = scan.nextLine();
		System.out.print("생년월일 : ");birthday = scan.nextLine();
		
		if(birthday=="") {
			PhoneInfo phInf = new PhoneInfo(name, phoneNumber);
			allInfo[numPhoneInfo++] = phInf;
		}
		else {
			PhoneInfo phInf = new PhoneInfo(name, phoneNumber, birthday);
			allInfo[numPhoneInfo++] = phInf;
		}
		System.out.println();
		System.out.println("※ 정보입력완료");
	}
	
	public void dataAllshow() {
		
		for (int i=0 ; i<numPhoneInfo ; i++) {
			allInfo[i].showPhoneInfo();
		}
	}
	
	public void dataDelete() {
		
		Scanner scan = new Scanner(System.in);
		System.out.println("※ 삭제할이름 : ");
		String delName = scan.nextLine();
		
		int delIndex = -1;
		
		for (int i=0 ; i<numPhoneInfo ; i++) {
			if(delName.compareTo(allInfo[i].name)==0) {
				System.out.println(allInfo[i].name +" 정보가 삭제되었습니다.");
				allInfo[i]=null;
				delIndex=i;
				numPhoneInfo--;
				break;
			}
		}
		
		if(delIndex == -1) {
			System.out.println("※삭제할 데이터가 없습니다.");
		}
		
		else {
			for (int i=delIndex ; i<numPhoneInfo ; i++) {
				allInfo[i] = allInfo[i+1];
			}
		}
	}
	
	public void dataSearch() {
		
		int find = 0;
		Scanner scan = new Scanner(System.in);
		System.out.print("※ 검색할이름 : ");
		String searchName = scan.nextLine();
		
		for (int i=0 ; i<numPhoneInfo ; i++) {
			
			if(searchName.compareTo(allInfo[i].name)==0) {
				
				System.out.println("※ 입력한 정보를 불러왔습니다.");
				allInfo[i].showPhoneInfo();
				find = 1;
			}
		}
		
		if (find == 0) {
			System.out.println("※ 찾는 정보가 없습니다.");
		}
	}
	
}
