package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;


 

public class MemberDAO {

	//DAO의 기본 멤버변수
	Connection con;//DB연결
	Statement stmt;//정적 쿼리 전송 및 실행
	PreparedStatement psmt;//동적 쿼리전송 및 실행
	ResultSet rs;//select결과반환
	
	public MemberDAO(ServletContext application) {
		try {
			String drv = application.getInitParameter("MariaDriver");
			String url = application.getInitParameter("MariaConnectURL");
			String id = application.getInitParameter("MariaUser");
			String pwd = application.getInitParameter("MariaPass");
			
			Class.forName(drv);			 
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("Member 연결성공");			 
		}
		catch(Exception e) {
			System.out.println("Member 연결시 예외발생");
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			System.out.println("마리아디비 자원반납시 예외발생");
		}
	}	
	public int memberRegist(MemberDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO member ( "
				+ " id, NAME, pass, birthday, zipcode, address1, address2, "
				+ " email, email2, phone ) "
				+ " VALUES ( "
				+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getNAME());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getBirthday());
			psmt.setString(5, dto.getZipcode());
			psmt.setString(6, dto.getAddress1());
			psmt.setString(7, dto.getAddress2());
			psmt.setString(8, dto.getEmail());
			psmt.setString(9, dto.getEmail2());
			psmt.setString(10, dto.getPhone());
			

			//쿼리문 실행
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("회원가입 처리중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	//게시물 조회하기
	public MemberDTO memberView(String id) {
		MemberDTO dto = new MemberDTO();
		
		String query = "SELECT * FROM member " + 
				" WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {				
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getNAME());
				psmt.setString(3, dto.getPass());
				psmt.setString(5, dto.getBirthday());
				psmt.setString(6, dto.getZipcode());
				psmt.setString(7, dto.getAddress1());
				psmt.setString(8, dto.getAddress2());
				psmt.setString(9, dto.getEmail());
				psmt.setString(10, dto.getEmail2());
				psmt.setString(11, dto.getPhone());
				psmt.setString(12, dto.getCheckbox1());
				psmt.setString(13, dto.getCheckbox2());
			
			}
		}
		catch(Exception e) {
			System.out.println("회원정보 조회중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	public int memberCount(Map<String, Object> map) {
		int totalCount = 0;	
		
		String query = "SELECT COUNT(*) FROM member ";
		//검색 파라미터가 있는 경우라면 where절을 추가한다. 
		if(map.get("searchWord")!=null) {
			query += " WHERE "+ map.get("searchField") +" "
					+ " LIKE '%"+ map.get("searchWord") +"%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 카운트중 예외발생");
			e.printStackTrace();
		}

		return totalCount;
	}
	public List<MemberDTO> memberList(Map<String,Object> map){
		
		List<MemberDTO> members = new Vector<MemberDTO>();
	
		String query = "SELECT * FROM member ";
		if(map.get("searchWord")!=null){
			query +=" WHERE "+ map.get("searchField") +" "
			  +" LIKE '%"+ map.get("searchWord") +"%' "; 
		}
		query += " ORDER BY regidate DESC ";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);	
			 
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setId(rs.getString("id"));
				dto.setNAME(rs.getString("NAME"));
				dto.setPass(rs.getString("pass"));  
				dto.setBirthday(rs.getString("birthday"));   
				dto.setZipcode(rs.getString("zipcode")); 
				dto.setAddress1(rs.getString("address1"));  
				dto.setAddress2(rs.getString("address2")); 
				dto.setEmail(rs.getString("email")); 
				dto.setEmail2(rs.getString("email2"));  
				dto.setPhone(rs.getString("phone"));  
				dto.setCheckbox1(rs.getString("checkbox1"));  
				dto.setCheckbox2(rs.getString("checkbox2"));  
				dto.setRegidate(rs.getString("regidate"));
				
				
				
				members.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("회원 목록 조회1중 예외발생");
			e.printStackTrace();
		}
		return members;
	}
	//게시판 목록 출력시 페이지 처리
	public List<MemberDTO> memberListPage(Map<String,Object> map){
		List<MemberDTO> members = new Vector<MemberDTO>();

		String query = " "
				+" SELECT * FROM ( "
				+"	 SELECT Tb.*, ROWNUM rNum FROM ( "
				+"	    SELECT * FROM member ";
		if(map.get("searchWord")!=null)
		{
			query +=" WHERE "+ map.get("searchField") +" "
					+" LIKE '%"+ map.get("searchWord") +"%' "; 
		}
		query += " "
				+"    	ORDER BY regidate DESC "
				+"    ) Tb "
				+" ) "
				+" WHERE rNum BETWEEN ? AND ?";
		System.out.println("페이지쿼리:"+query);
		try {
			psmt = con.prepareStatement(query);
			//between절의 start와 end값을 인파라미터 설정
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setNAME(rs.getString("NAME"));
				dto.setPass(rs.getString("pass"));  
				dto.setBirthday(rs.getString("birthday"));   
				dto.setZipcode(rs.getString("zipcode")); 
				dto.setAddress1(rs.getString("address1"));  
				dto.setAddress2(rs.getString("address2")); 
				dto.setEmail(rs.getString("email")); 
				dto.setEmail2(rs.getString("email2"));  
				dto.setPhone(rs.getString("phone"));  
				dto.setCheckbox1(rs.getString("checkbox1"));  
				dto.setCheckbox2(rs.getString("checkbox2"));  
				dto.setRegidate(rs.getString("regidate"));
				
				members.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("회원 목록 조회2중 예외발생");
			e.printStackTrace();
		}
		return members;
	}
	public int memberUpdate(MemberDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE member SET "
				+ " pass=?, name=?, birthday=?, "
				+ " zipcode=?, address1=?, address2=?, "
				+ " email1=?, =?, phone=? "
				+ " WHERE id=?";
			//쿼리문 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getNAME());
			psmt.setString(3, dto.getBirthday());
			psmt.setString(4, dto.getZipcode());
			psmt.setString(5, dto.getAddress1());
			psmt.setString(6, dto.getAddress2());
			psmt.setString(7, dto.getEmail());
			psmt.setString(10, dto.getEmail2());
			psmt.setString(11, dto.getPhone());
			psmt.setString(12, dto.getCheckbox1());
			psmt.setString(13, dto.getCheckbox2());
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("회원가입 처리중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public int memberDelete(String id) {
		int result = 0;
		try {
			String query = "DELETE FROM member WHERE id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 삭제중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
}
