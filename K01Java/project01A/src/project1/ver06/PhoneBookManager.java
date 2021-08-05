package project1.ver06;

import java.util.InputMismatchException;
import java.util.Scanner;

import project1.ver06.SubMenuItem.Classfication;

public class PhoneBookManager {
	
	private PhoneInfo[] allInfo;
	private int numPhoneInfo;
	
	public PhoneBookManager (int num) {
		allInfo = new PhoneInfo[num];
		numPhoneInfo = 0;
	}
	
	public void dataInput() {
		
		Scanner scan = new Scanner(System.in);
		
		while(true) {
			int select = 0;
			
			System.out.println();
			System.out.println("=============================================");
			System.out.println("[1] 일반 | [2] 동창 | [3] 회사 | [4]돌아가기");
			System.out.println("=============================================");
			System.out.print("※ 메뉴 선택(정수입력) : ");
			try {
				select = scan.nextInt();
				System.out.println();
				
				if(select < 0) {
					MenuSelectException ex = new MenuSelectException();
					throw ex;
				}
				else if  (select > 4){
					MenuSelectException ex2 = new MenuSelectException();
					throw ex2;
				}
				if(select == Classfication.NORMAL) {
					normalDataInput();
					break;
				}
				if(select == Classfication.SCHOOL) {
					schoolDataInput();
					break;
				}
				if(select == Classfication.COMPANY) {
					companyDataInput();
					break;
				}
				if(select == Classfication.RETURN) {
					break;
				}
			}
			catch (InputMismatchException e) {
				System.out.println("정수를 입력해주세요.");
				scan.nextLine();
			}
			catch (MenuSelectException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public void normalDataInput() {
		
		Scanner scan = new Scanner(System.in);
		String name, phoneNumber;
		
		System.out.print("이름 : ");name  = scan.nextLine();
		System.out.print("전화번호 : ");phoneNumber = scan.nextLine();
		
		PhoneInfo phInf = new PhoneInfo(name, phoneNumber);
		allInfo[numPhoneInfo++] = phInf;
			
		System.out.println();
		System.out.println("※ 정보입력완료");
		
	}
	
	public void schoolDataInput() {
		
		Scanner scan = new Scanner(System.in);
		try {
			String name, phoneNumber, major;
			int grade;
			
			System.out.print("이름 : ");name  = scan.nextLine();
			System.out.print("전화번호 : ");phoneNumber = scan.nextLine();
			System.out.print("전공 : ");major = scan.nextLine();
			System.out.print("학년 : ");grade = scan.nextInt();
			System.out.println();
			
			PhoneSchoolInfo phInf = new PhoneSchoolInfo(name, phoneNumber,
														major, grade);
			allInfo[numPhoneInfo++] = phInf;
			
			System.out.println();
			System.out.println("※ 정보입력완료");
		}
		catch (InputMismatchException e) {
			System.out.println("※ [학년]에 정수를 입력해주세요.");
			dataInput();
		}
	}
	
	public void companyDataInput() {
		
		Scanner scan = new Scanner(System.in);
		String name, phoneNumber, companyName;
		
		System.out.print("이름 : ");name  = scan.nextLine();
		System.out.print("전화번호 : ");phoneNumber = scan.nextLine();
		System.out.print("회사명 : ");companyName = scan.nextLine();
		
		PhoneCompanyInfo phInf = new PhoneCompanyInfo(name, phoneNumber,
												companyName);
		allInfo[numPhoneInfo++] = phInf;
		
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
		System.out.print("※ 삭제할이름 : ");
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
