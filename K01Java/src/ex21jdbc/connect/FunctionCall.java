package ex21jdbc.connect;

import java.sql.SQLException;
import java.sql.Types;

public class FunctionCall extends IConnectImpl {

	public  FunctionCall() {
		super("KOSMO", "1234");
	}
	
	public void execute() {
		try {
			csmt = con.prepareCall("{? = call fillAsterik(?)}");
			csmt.registerOutParameter(1, Types.VARCHAR);
			csmt.setString(2, scanValue("아이디"));
			csmt.execute();
			System.out.println("함수의반환값:"+ csmt.getString(1));
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	
	public static void main(String[] args) {

		new FunctionCall().execute();
	}

}
