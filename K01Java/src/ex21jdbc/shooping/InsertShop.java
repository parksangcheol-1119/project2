package ex21jdbc.shooping;


import ex21jdbc.connect.IConnectImpl;

/*
 상품입력 
 PreparedStatement객체를 사용하여 작성한다.
클래스명 : ex21jdbc.shopping.InsertShop
상품명, 상품가격, 상품코드를 scanValue() 메소드로 입력받아 사용한다. 
입력이 완료되면 입력된 행의 갯수를 반환하여 출력한다. 
   goods_name varchar2(30),--상품명
   goods_price number(10),--상품가격
   p_code number(10)--상품코드
 */
public class InsertShop extends IConnectImpl{

	public InsertShop() {
		super("KOSMO", "1234");
	}
	

	public void execute() {
		
		String sql = "INSERT INTO sh_goods VALUES"
				+ "(goods_seq.NEXTVAL, ?, ? SYSDATE, ?)";
		
	try {
		
		psmt = con.prepareStatement(sql);
		
		psmt.setString(1, scanValue("상품명"));
		psmt.setString(2, scanValue("상품가격"));
		psmt.setString(3, scanValue("상품코드"));
		
		int row = psmt.executeUpdate();
		
		System.out.println(row + "행이 입력되었습니다.");		
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		close();
	}
	
	}
	public static void main(String[] args) {

		new InsertShop().execute();
	}

}
