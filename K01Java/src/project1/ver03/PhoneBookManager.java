package project1.ver03;

import java.util.Scanner;

/*
 저장, 검색, 삭제의 기능을 담당하는 PhoneBookManager클래스를 정의해서 프로그램을 완성하자.
 */
public class PhoneBookManager {

	
	PhoneInfo[]Manager = new PhoneInfo[100];
	int cnt = 0;
	
	
	
	
	//저장
	//배열 퀴즈 성적 참고
	public void save() {
		Scanner scan = new Scanner(System.in);//입력받기
		String name;
		String phoneNumber; //멤버
		String birthday;
		
		System.out.println("데이터 입력을 시작합니다..");
		System.out.println("이름:");
		name = scan.nextLine();
		System.out.println("전화번호:");
		phoneNumber = scan.nextLine();
		System.out.println("생년월일:");
		birthday = scan.nextLine();
		
		PhoneInfo save = new PhoneInfo(name, phoneNumber, birthday);
		
		Manager[cnt] = save;
		cnt++;
		
	}
	
	//검색
	public void search() {
	
		boolean a = false;
		Scanner scan = new Scanner(System.in);//입력받기
		System.out.println("검색하세요:");
		String search = scan.nextLine();
		for(int i = 0; i<cnt ; i++) {
			Manager[i].showPhoneInfo();
			System.out.println("출력을 완료하였습니다");
			a = true;
		}
	
	}
	
public void dataAllshow() {
		
		for (int i=0 ; i<cnt ; i++) {
			Manager[i].showPhoneInfo();
		}
	}
	//삭제                
	public void delete() {
		Scanner scan = new Scanner(System.in);//입력받기
		String delete  =scan.nextLine();
		System.out.println("delete할 정보를 입력하세요");
		
		int deleteIndex = -1;
		
		for(int i=0 ; i<cnt ; i++) {
			if(delete.compareTo(Manager[i].name)==0) {
				Manager[i] = null;
				deleteIndex--;
				System.out.println("이름이 삭제되었습니다.");
				break;
			}
			
		}
		if(deleteIndex == -1) {
			System.out.println("데이터가 없습니다.");
		}
		else {
			for (int i=deleteIndex ; i<deleteIndex ; i++) {
				Manager[i] = Manager[i+1];
			}
			
		}
		
	}
	
	
}
