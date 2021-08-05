package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

public class CommentController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	
	protected void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if(commandStr.equals("/commentWrite.comm")) {
			commentWrite(req, resp);
		}/*
		else if(commandStr.equals("/commentEdit.comm")) {
			commentEdit(req, resp);
		}
		else if(commandStr.equals("/commentEditAction.comm")) {
			commentEditAction(req, resp);
		}
		else if(commandStr.equals("/commentDelete.comm.comm")) {
			commentDelete(req, resp);
		}
		else if(commandStr.equals("/commentDeleteAction.comm")) {
			commentDeleteAction(req, resp);
		}
		*/
	}
	
	private void commentWrite(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
			System.out.println("댓글쓰기");
			
			String board_idx = req.getParameter("board_idx");
			String name = req.getParameter("name");
			String pass = req.getParameter("pass");
			String comments= req.getParameter("comments");
			
			CommentDTO dto = new CommentDTO();
			dto.setBoard_idx(board_idx);
			dto.setName(name);
			dto.setPass(pass);
			dto.setComments(comments);
			
			CommentDAO dao = new CommentDAO();
			int result = dao.commentInsert(dto);
			if(result==1)
				resp.sendRedirect("./View.do?idx="+board_idx);
			else
				JSFunction.alertBack(resp, "댓글 작성에 실패했습니다");
		}
}