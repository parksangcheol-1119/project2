package ex21jdbc.connect;

public interface IConnect {

	/*
 멤버 상수
 	: 인터페이스에 선언된 변수는 무조건 public static final이
 	붙어 정적 상수로 선언된다.
 	
 	ex13interface 3번교안 참고
 	
 	-멤버로는 추상메소드와 상수로만 구성된다. 
	메소드 -> public abstract
	상수 -> public static final
-인터페이스는 생성자가 없다. 
 */
	
	String ORACLE_DRIVER = "oracle.jdbc.OracleDriver";
	String ORACLE_URL = "jdbc:oracle:thin://@localhost:1521:xe";
	
	
	/*
	 멤버추상메소드
	 	:public abstract가 붙어 추상메소드로 선언된다.
	 */
	void connect(String user, String pass);//DB연결
	void execute();//각 쿼리 실행
	void close();//자원반납
	
	//사용자 입력을 위한 추상메소드 선언
	String scanValue(String title);
}
