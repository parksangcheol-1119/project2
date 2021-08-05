package springboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import model.JdbcTemplateConst;

@Repository
public class JDBCTemplateDAO {

	@Autowired
	JdbcTemplate template;
	public JDBCTemplateDAO() {
		System.out.println("JDBCTemplateDAO 생성자 호출");
	}
	
	/*****************************************************************************/
	
	// 리스트의 갯수
	public int getTotalCount(Map<String, Object> map) {
		String sql = " SELECT COUNT(*) FROM springboard ";
		
		if(map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " "
				+  " 	LIKE '%" + map.get("Word") + "%' ";
		}
		
		return template.queryForObject(sql, Integer.class);
	}
	
	/*****************************************************************************/
	
	// 리스트 출력 (페이지 처리 없음)
	public ArrayList<SpringBbsDTO> list(Map<String, Object> map){
		
		String sql = ""
				+ " SELECT * FROM springboard ";
		if(map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " "
				+  " 	LIKE '%" + map.get("Word") + "%' ";
		}
		sql += " ORDER BY bgroup DESC, bstep ASC";
		
		return (ArrayList<SpringBbsDTO>)template.query(sql, 
					new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
	}
	
	/*****************************************************************************/
	
	public ArrayList<SpringBbsDTO> listPage( Map<String, Object> map ){

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = ""
				+"SELECT * FROM ("
				+"    SELECT Tb.*, rownum rNum FROM ("
				+"        SELECT * FROM springboard ";				
			if(map.get("Word")!=null){
				sql +=" WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' ";				
			}			
			sql += " ORDER BY bgroup DESC, bstep ASC"
			+"    ) Tb"
			+")"
			+" WHERE rNum BETWEEN "+start+" and "+end;
		
		return (ArrayList<SpringBbsDTO>)
			template.query(sql, 
				new BeanPropertyRowMapper<SpringBbsDTO>( SpringBbsDTO.class ));
	}
	
	/*****************************************************************************/
	
	//글쓰기 처리1
	public void write(final SpringBbsDTO springBbsDTO) {
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = " INSERT INTO springboard ( "
						+ " idx, name, title, contents, hits "
						+ ", bgroup, bstep, bindent, pass) "
						+ " VALUES ( "
						+ " springboard_seq.NEXTVAL, ?, ?, ?, 0, "
						+ " springboard_seq.NEXTVAL, 0, 0, ?) ";
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, springBbsDTO.getName());
				psmt.setString(2, springBbsDTO.getTitle());
				psmt.setString(3, springBbsDTO.getContents());
				psmt.setString(4, springBbsDTO.getPass());
				
				return psmt;
			}
		});
	}
	
	/*****************************************************************************/
	
	// 조회수 증가 처리
	public void updateHit(final String idx) {
		String sql = " UPDATE springboard SET "
				+ " hits=hits+1 "
				+ " WHERE idx=?";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(idx));
			}
		});
	}
	
	/*****************************************************************************/
	
	// 상세 보기 처리
	public SpringBbsDTO view(String idx) {
		updateHit(idx);
		
		SpringBbsDTO dto = new SpringBbsDTO();
		String sql = " SELECT * FROM springboard "
				+ " WHERE idx=" + idx;
		try {
			dto = template.queryForObject(sql, 
					new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
		}
		catch (Exception e) {
			System.out.println("View() 실행 시 예외 발생");
		}
		return dto;
	}
	
	/*****************************************************************************/
	
	// 패스워드 검증하기
	public int password(String idx, String pass) {
		int retNum = 0;
		String sql = " SELECT * FROM springboard "
				+ " WHERE pass=" + pass + " AND idx=" + idx;
		try {
			SpringBbsDTO dto = template.queryForObject(sql, 
					new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
			retNum = dto.getIdx();
		}
		catch (Exception e) {
			System.out.println("password() 예외발생");
		}
		return retNum;
	}
	
	/*****************************************************************************/
	
	// 게시물 수정 처리
	public void edit(final SpringBbsDTO dto) {
		String sql = " UPDATE springboard "
				+ " SET name=?, title=?, contents=? "
				+ " WHERE idx=? AND pass=? ";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getTitle());
				ps.setString(3, dto.getContents());
				ps.setInt(4, dto.getIdx());
				ps.setString(5, dto.getPass());
			}
		});
	}
	
	/*****************************************************************************/
	
	public void delete(final String idx, final String pass) {
		String sql = " DELETE FROM springboard "
				+ " WHERE idx=? AND pass=? ";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, idx);
				ps.setString(2, pass);
			}
		});
	}
	
	/*****************************************************************************/
	
	// 답변글 쓰기 처리
	public void reply(final SpringBbsDTO dto) {
		
		replyPrevUpdate(dto.getBgroup(), dto.getBstep());
		
		// 답변글도 새로운 게시물이므로 일련번호를 새로운 시퀀스로 입력해야한다.
		String sql = " INSERT INTO springboard ( "
				+ " idx, name, title, contents, pass, "
				+ " bgroup, bstep, bindent) "
				+ " VALUES ( "
				+ " springboard_seq.NEXTVAL, ?, ?, ?, ?, "
				+ " ?, ?, ?)";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getTitle());
				ps.setString(3, dto.getContents());
				ps.setString(4, dto.getPass());
				ps.setInt(5, dto.getBgroup());
				ps.setInt(6, dto.getBstep()+1);
				ps.setInt(7, dto.getBindent()+1);
			}
		});
	}
	
	/*****************************************************************************/
	
	public void replyPrevUpdate(final int strGroup, final int strStep) {
		String sql = " UPDATE springboard "
				+ " SET bstep = bstep+1 "
				+ " WHERE bgroup=? AND bstep>?";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, strGroup);
				ps.setInt(2, strStep);
			}
		});
	}
}
