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


//클래스는 사람을 생각

public class CheckCard3 {


	//멤버변수 : 주어진 조건에 따라 적절히 정의한다.
	private long cardNumber;
	private String owner;
	private int balace;
	private int point;
	/*
	 정보은닉이란 멤버변수를 private으로 만들어서 클래스 외부에서는
	 접근하지 못하게 하는것이다. 
	 */
	
	
	//카드번호가 정상인지 확인하기 위한 메소드
	public boolean cardNumberRange(long cn) {
		//정수의 범위내에서 16자리는 이와같이 표현할 수 있다.
		if(cn>=1000_0000_0000_0000L &&
				cn<=9999_9999_9999_9999L) {
			return true;
		}
		else {
			return false;
		}
	}
	/*
	 초기화메소드
	 생성자가 아닌 일반적인 멤버메소드를 만들때에는
	 무조근 public void를 붙여놓고 시작한다. 차후 반환타입이 있는경우
	 void를 해당 반환타입으로 변경하면 된다.
	 */
	public void initMembers(long cardNumber, String owner, 
			int balace, int point) {
		/*
		멤버변수를 멤버메소드에서 사용할때는 무조건 this를 붙인다.
		 */
		this.cardNumber = cardNumber;
		this.owner = owner;
		this.balace = balace;
		this.point = point;
	}
	
	/*
	멤버변수를 정의하였다면 생성자는 무조건 자동생성 메뉴를 사용한다.
	마우스 오른쪽 클릭 -> source -> generate constructor 선택
	 
	 ※생성자는 멤버메소드와는 다르게 반환형이 없고 클래스와 이름이 동일하다
	 */
	
	
	/*
	 멤버변수가 private로 선언되면 클래스 내부에서만 접근가능하므로
	 외부에서의 접근을 위해 getters/setters를 무조건 생성해야 한다.
	
	※게터 세터도 자동완성으로
	마우스 오른쪽 클릭 - > source -> getters/setters -> 멤버변수 클릭
	 */
	public long getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(long cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getBalace() {
		return balace;
	}

	public void setBalace(int balace) {
		this.balace = balace;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	//기본생성자
	public CheckCard3() {}
	//     ↓ 복사 + 붙여넣기 (){}
	//인자생성자
	public CheckCard3(long cardNumber, String owner, int balace, int point) {
		
		if(cardNumberRange(cardNumber)==false){
			System.out.println();
			return;//생성자에서 return은 사용할 수 있고, 실행만 종료된다.
		}
		/*
		카드번호에 오류가 있어 return이 실행되면 아래 문장이
		실행되지 않으므로, 초기값이 없는 빈 객체가 생성되게 된다.
		 */
		this.cardNumber = cardNumber;
		this.owner = owner;
		this.balace = balace;
		this.point = point;
	}
	public CheckCard3(long cardNumber, String owner, int balace) {
		super();
		this.cardNumber = cardNumber;
		this.owner = owner;
		this.balace = balace;
		this.point = 0;
	}
	public CheckCard3(long cardNumber, String owner) {
		super();
		this.cardNumber = cardNumber;
		this.owner = owner;
		this.balace = 0;
		this.point = 0;
	}



	//멤버메소드 : 
	
	//충전(입금) 
	public void charge(int amount) {
		if(amount%10000==0) {
			this.balace += amount;

			System.out.printf("%s님 %원 충전완료", owner, amount);
			System.out.printf("[잔고]%d원 입니다.", balace);
		}
		else {
			System.out.println("충전불능: 10000원단위로만 가능함.");
		}
		//잔고에서 결제할 금액만큼 차감한다.
			

	}
	
	
	//결제 
	public void payment(int amount) {
		
		//잔고가 결제금액보다 크거나 같으면 정상결제됨
		if(this.balace >= amount) {
			//잔고에서 결제할 금액만큼 차감한다.
			this.balace -= amount;
			//카드를 사용할때 적립금이 발생되므로 여기서 호출한다.
			savingPoint(amount);
		}
		else {
			System.out.printf("%s님 잔고가 부족합니다.", owner);
			}
		}
		
	

	/*
	나는 은행권가면 말아먹겠다 마이너스금액이 늘어나네
	 */
	
	
	
	//적립 : 사용금액의 0.1%를 적립해야된다. 
	public void savingPoint(int amount) {
		/*
		 좁은 지역에서 생성한 변수는 넓은 지역에서 사용할 수 없다.
		 넓은 지역에서 생성한 변수는 좁은 지역에서 사용할 수 없다.
		 지역변수는 해당 지역을 벗어나면 메모리에서 소멸된다.
		 */
		
		double plusPoint =0;
		
		if(amount>10000) {
			 plusPoint = (amount*0.3);
			
		}
		
		else {
			 plusPoint = (amount*0.1);
			
		}
		
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
	public void showState() {
		System.out.println("카드번호:"+this.cardNumber);
		System.out.println("소유쟈:"+this.owner);
		System.out.println("잔고:"+this.balace);
		System.out.println("포인트:"+this.point);
	}
}
