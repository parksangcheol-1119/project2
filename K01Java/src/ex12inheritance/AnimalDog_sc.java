package ex12inheritance;

/*
연습문제]  AnimalDog 클래스 정의
	강아지를 표현한 클래스 
	- Dog is a Animal이 성립하므로 상속관계로 표현하기에 
		적합한 모델
	
	멤버변수
		강아지의종류 : 푸들, 포매라니안 등 -> dogKind
		이름 -> name
	멤버메소드
		bark() : 강아지가 짖는것을 표현
			출력결과 : 이름이 XX이고 종(포유류)이 
				YY인 강아지가 짖는다.
		showDog() : 강아지의 현재상태(멤버변수)를 출력하는 
			메소드
	인자생성자
		: 부모클래스까지 초기화할수 있도록 구성할것
 */


public class AnimalDog_sc extends Animal_sc {

	//확장한 멤버변수
	String dogKind;
	String name;
	
	void brek() {
		System.out.printf("\n이름이 %s이고 종이 %s인 강아지가 짖는다\n.", name, species);
		}

	void showDog() {
		
		/*
		여기에 사용된 슈퍼는 부모클래스의객체를 가르키는 의미로
		부모클래스의 쇼애니멀 메소드를 호출한다.
		 */
		super.showAnimal();
		System.out.println("종류는:"+ dogKind);
		System.out.println("이름은:"+ name);
	}
	//생성자 메소드
	public AnimalDog_sc(String species, int age, String gender, String dogKind, String name) {
		
		/*
		자식클래스에서는 반드시 부모클래스의 객체를 먼저 생성해야 한다.
		여기서 사용된 super()는 부모클래스의 생성자 메소드르를 호출하는 
		용도로 사용된다.
		 */
		super(species, age, gender);
		
	//자신의 멤버변수를 초기화한다.
		this.dogKind = dogKind;
		this.name = name;
	}
	
}
