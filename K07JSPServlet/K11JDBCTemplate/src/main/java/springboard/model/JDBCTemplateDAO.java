package springboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;import org.springframework.jdbc.core.PreparedStatementSetter;

import model.JdbcTemplateConst;


/*
JdbcTemplate 관련 주요 메소드
	- Object queryForObject(String sql, RowMapper rm)
		하나의 레코드나 결과값을 반환하는 Select 계열의 쿼리문을
		실행할 때 사용한다
		
	- Object queryForObject(String sql, Object[] args, Rowmapper rm)
		인파라미터가 있고, 하나의 레코드를 반환하는 select 계열의
		쿼리문 실행에 사용한다.
		
	- List query(String sql, RowMapper rm)
		여러개의 레코드를 반환하는 select 계열의 쿼리문인 경우 사용한다.
		
	- List query(String sql, Object[] args, RowMapper rm)
		인파라미터를 가진 여러개의 레코드를 반환하는 select 계열의
		쿼리문인 경우 사용한다.
	
	- int update(String sql)
		인파라미터가 없는 update/insert/delete 쿼리문을 처리할 때 사용한다.
		
	- int update(String sql, Object[] args)
		인파라미터가 있는 update/insert/delete 쿼리문을 처리할 때 사용한다.
 */
public class JDBCTemplateDAO {

	JdbcTemplate template;
	
	/*
	컨트롤러에서 @Autowired를 통해 자동 주입받았던 빈을 정적 변수인
	JdbcTemplateConst.template에 할당했다. 이를 통해 DB 연결 정보를
	DAO에서 바로 사용할 수 있다.
	 */
	public JDBCTemplateDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("JDBCTemplateDAO 생성자 호출");
	}
	
	public void close() {
		/*
		JdbcTemplate 에서는 자원해제를 하지 않는다.
		Spring 설정 파일에서 빈을 생성하므로 자원을 해제하면 다시
		new를 통해 생성해야 하므로 자원해제를 사용하지 않는다.
		 */
	}
	
	/*****************************************************************************/
	
	// 리스트의 갯수
	public int getTotalCount(Map<String, Object> map) {
		String sql = " SELECT COUNT(*) FROM springboard ";
		
		if(map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " "
				+  " 	LIKE '%" + map.get("Word") + "%' ";
		}
		
		/*
		매개변수에 Rowmapper가 없다. 
		Object가 아니라 정수 타입으로 반환받겠다는 뜻이다. 
		 */
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
		
		/*
		Rowmapper가 select를 통해 얻어온 ResultSet을 DTO 객체에 저장한다.
		DTO 객체를 List 컬렉션에 적재하여 반환한다. 그러므로 DAO에서 개발자가
		반복적으로 하던 작업을 자동으로 처리해준다.
		 */
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
	public void write(final SpringBbsDTO springBbsDTO) {/*
		매개변수로 전달되는 값을 익명클래스 내에서 사용할 때는
		반드시 final로 선언하여 값의 변경이 불가는하게 처리해야한다.
		final로 선언하지 않으면 에러가 발생한다.( JAVA의 규칙 )
	*/
		template.update(new PreparedStatementCreator() {
			
			/*
			답변형 게시판에서 원본 글인 경우 idx와 bgroup은 반드시 일치해야 한다.
			리스트에서 게시물 정렬 시 bgroup을 통해 order by 절을 구성하기 때문이다.
			또한 nextval은 한 문장에서 여러번 사용하더라도 항상 같은 시퀀스를 반환한다.
			 */
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
			/*
			하나의 결과를 반환하는 select 계열의 쿼리문을 실행할 때는
			queryForObject() 메소드를 사용한다. 단, 반환 결과가 0이거나
			2 이상이면 예외를 발생시키므로 반드시 예외처리를 하는 것이 좋다.
			 */
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
			/*
			 일련번호는 시퀀스를 사용하므로 반드시 1이상의 값을 가지게 된다.
			 따라서 0 이하의 값이 반환된다면 패스워드 검증 실패라 판단할 수 있다.
			 */
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
	
	/*
	답변글을 입력하기 전에 현재 step 보다 큰 게시물들을 일괄적으로
	step + 1 해서 뒤로 밀어주는 작업을 진행한다.
	 */
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
