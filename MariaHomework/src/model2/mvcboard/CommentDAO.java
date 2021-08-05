package model2.mvcboard;
 
import java.util.List;
import java.util.Vector;

import common.ConnectionPool;

public class CommentDAO extends ConnectionPool {

	public CommentDAO() {
		super();
	}	
	//글 작성하기
	public int commentInsert(CommentDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO mycomment ( "
				+ " board_idx, name, pass, comments) "
				+ " VALUES ( "
				+ " ?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getBoard_idx());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getComments());
			result = psmt.executeUpdate();
		} 
		catch(Exception e) {
			System.out.println("댓글 입력중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	//mvcboard의 일련번호를 매개변수로 받아 해당 댓글을 조회하는 메소드
	public List<CommentDTO> commentSelectList(String board_idx){
		
		List<CommentDTO> comments = new Vector<CommentDTO>();
		
		//댓글 작성일을 시:분 까지 출력하기 위해 to_char()함수를 사용함.
		String query = "SELECT idx, board_idx, name, pass, comments, "
				+ " date_format(postdate,'%Y-%m-%d %H:%i') "
				+ " FROM mycomment "
				+ " WHERE board_idx=? "
				+ " ORDER BY idx DESC";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, board_idx);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				
				dto.setIdx(rs.getString(1));			
				dto.setBoard_idx(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPass(rs.getString(4));
				dto.setComments(rs.getString(5).replaceAll("\r\n", "<br/>"));
				//dto.setCommentsEdit(rs.getString(5));
				dto.setPostdate(rs.getString(6));
								
				comments.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("댓글 조회중 예외발생");
			e.printStackTrace();
		}
		return comments;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//내용보기
	public CommentDTO commentSelectView(CommentDTO dto){
		
		String query = "SELECT * FROM mycomment "
				+ " WHERE idx=? and board_idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getIdx());
			psmt.setString(2, dto.getBoard_idx());
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString(1));			
				dto.setBoard_idx(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPass(rs.getString(4));
				dto.setComments(rs.getString(5));
				dto.setPostdate(rs.getString(6));
			}
		}
		catch(Exception e) {
			System.out.println("댓글 조회중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	//수정처리
	public int commentUpdate(CommentDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE mycomment SET "
					+ " name=?, comments=? "
					+ " WHERE idx=? and board_idx=? and pass=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getComments());
			psmt.setString(3, dto.getIdx()); 
			psmt.setString(4, dto.getBoard_idx()); 
			psmt.setString(5, dto.getPass());
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("댓글 수정중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	//삭제처리
	public int commentDelete(CommentDTO dto) {
		int result = 0;
		try {
			String query = "DELETE FROM mycomment "
					+ " WHERE idx=? and board_idx=? and pass=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getIdx());
			psmt.setString(2, dto.getBoard_idx());
			psmt.setString(3, dto.getPass());
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("댓글 삭제중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	

}
