package bokang;


import bokang.sub.CheckCard1;
import bokang.sub.CheckCard3;
import bokang.sub.CheckCard5;

public class R05Class {

	public static void main(String[] args) {

		
		/*
		 체크카드 클래스 ver1
		 
		  숫자를 구분할때 구분자로 언더바를 사용할 수 있다.
		  JDK7.0부터 지원되었으며 숫자사이에 쓰는것만 허용된다.
		  잘못된방법]
		  	3._123432
		  	123_456_
		  	_123_456
		 	위와 같이 언더바로 시작하거나 끝날 수 없고, 소수점과
		 	연결해서도 사용할 수 없다.
		 */
		CheckCard1 cc1 = new CheckCard1();
		cc1.cardNumber = 1111_2222_3333_4444L;
		cc1.owner = "홍길동";
		cc1.balace = 10000;
		cc1.point = 0;

		cc1.payment(5000);//5000원 결제
		cc1.payment(1000000);//10000원 결제
		cc1.showState();//상태를 보면 금액이 마이너스가 된다.
		cc1.balace = 10000;
	
	/*********************************************/
	
		/*
		 체크카드 버전 2번 
		 
		 */
	//객체생성후 초기화 메소드를 통해 멤버변수 초기화
	CheckCard3 cc3 = new CheckCard3();
	cc3.initMembers(9876_5432_1098_7654L, "김말똥", 3000, 0);
	
	//인자생성자를 통해 객체생성과 동시에 멤버변수 초기화
	CheckCard3 cc4 = new CheckCard3(1111_2222_3333_4444L,
			"김소똥", 15000, 0);
	
	
	cc3.charge(7000);
	cc3.payment(9000);
	cc3.showState();
	
	cc4.charge(5000);
	cc4.payment(19000);
	cc4.showState();

//	멤버변수가 private으로 선언되었으므로 직접 접근은 불가능하다.	
//	cc3.balance = 100000;
//	cc3.point = 300;
	
	System.out.println("###########################################");
	System.out.println("체크카드 버전 5번");
		
	
	

//	체크카드 3번(나한테는 5번)
	CheckCard5 cc5 = new CheckCard5(1234_4567_9012_3456L, "정상소유", 120000,0);
	cc5.payment(110000);
	cc5.payment(30000);
	cc5.showState();
	
	
	//카드번호가 15자리이므로 빈객체가 생성된다.
	CheckCard5 cc6 = new CheckCard5(111_2222_3333_4444L, "비정상");
	cc6.payment(4000);
	cc6.showState();
		
	
	}
}
