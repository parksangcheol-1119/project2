package bokang.sub;
/*
체크카드 클래스 Ver.02

버전02에서 추가부분
	1. 멤버변수 초기화 메소드 정의 
		메소드명 : initMembers()
	2. 기본생성자, 인자생성자 정의
	3. 멤버변수 정보은닉
	4. getter/setter 메소드 추가
 */



public class CheckCard2 {


	//멤버변수
	long cardNumber;
	String owner;
	int balace;
	int point;
	

		
//멤버메소드
	//충전(입금) 
	void charge(int amount) {
		//현재 잔고에 충전할 금액을 더해준다.
		this.balace += amount;
	}
	
	
	//결제 
	void payment(int amount) {
		//잔고에서 결제할 금액만큼 차감한다.
		this.balace -= amount;
		//카드를 사용할때 적립금이 발생되므로 여기서 호출한다.
		savingPoint(amount);
	}
	
	
	//적립 : 사용금액의 0.1%를 적립해야된다. 
	void savingPoint(int amount) {
		double plusPoint = (amount*0.1);
		//복합대입연산자
		this.point += plusPoint;
		/*
		 복합대입연산자의 특성상 형은 항상 좌측항을 따라간다.
		 따라서 형변환에 대한 에러가 발생하지 않는다.
		 하지만 아래처럼 풀어서 쓰면 에러가 발생한다.
		 */
		//this.point = this.point + plusPoint
	}
	
	
	//현재상태출력
	void showState() {
		System.out.println("카드번호:"+this.cardNumber);
		System.out.println("소유쟈:"+this.owner);
		System.out.println("잔고:"+this.balace);
		System.out.println("포인트:"+this.point);
	}
	
	
}
