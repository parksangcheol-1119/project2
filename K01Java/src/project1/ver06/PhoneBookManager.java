package project1.ver06;

import java.util.Scanner;

/*
 저장, 검색, 삭제의 기능을 담당하는 PhoneBookManager클래스를 정의해서 프로그램을 완성하자.
 4번째거 추가할 내용들
 
 1. 일반 2. 동창 3. 회사
 
 2.동창 선택시 
 이름 전화번호 전공 학년
 
 3. 회사 선택시
 이름 전화번호 회사
 
 
 교안 인터페이스 4번 참고
 
 
 */



public class PhoneBookManager{

	public static Scanner scan = new Scanner(System.in);
	
	PhoneInfo[]Manager = new PhoneInfo[100];
	int cnt = 0;
	
	
	
	public void newmenu() {//새로운 메뉴
		
			
			Scanner scan = new Scanner(System.in);
		
			System.out.println("1.일반"+ "2.동창"+"3.회사");
			System.out.println("선택>>");
			
			int select = scan.nextInt();
			
			if(select ==SubMenultem.normal) {
				save();
			}
			if(select ==SubMenultem.pernio) {
				collegesave();
			}
			if(select ==SubMenultem.peer) {
				addcompany();
			}
		
		}
	
	
	//저장
	//배열 퀴즈 성적 참고 (3버전 이전 데이터)
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
		
		PhoneInfo save = new PhoneInfo(name, phoneNumber);
		
		Manager[cnt] = save;
		cnt++;
		
	}
	
	//전공 검색용
	//전공 + 학년
	public void collegesave() {
		
		Scanner scan = new Scanner(System.in);
		String name;
		String phoneNumber;
		String major;//전공
		int haknun;//학년
		
		System.out.println("이름:");
		name = scan.nextLine();
		System.out.println("전화번호:");
		phoneNumber = scan.nextLine();
		System.out.println("전공:");
		major = scan.nextLine();
		System.out.println("학년:");
		haknun = scan.nextInt();//인트형이니까 넥스트 인트
		
		PhoneSchoolInfo univ = new PhoneSchoolInfo(name, phoneNumber, major, haknun);
		
		Manager[cnt++] = univ;
		
		System.out.println(" ");
		
		
	}
	
	
	//회사 관련 이름, 전화번호, 회사 출력
	
	public void addcompany() {
		
		Scanner scan = new Scanner(System.in);
		String name;
		String phoneNumber;
		String company;
		
		System.out.println("이름:");
		name = scan.nextLine();
		System.out.println("전화번호:");
		phoneNumber = scan.nextLine();
		System.out.println("회사:");
		company = scan.nextLine();
		
		PhoneCompanyInfo companyname = new PhoneCompanyInfo(name, phoneNumber, company);
	
		Manager[cnt++] = companyname;
		
		System.out.println(" ");
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
