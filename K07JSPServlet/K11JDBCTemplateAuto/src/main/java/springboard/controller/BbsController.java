package springboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.JdbcTemplateConst;
import springboard.command.BbsCommandImpl;
import springboard.command.DeleteActionCommand;
import springboard.command.EditActionCommand;
import springboard.command.EditCommand;
import springboard.command.ListCommand;
import springboard.command.ReplyActionCommand;
import springboard.command.ReplyCommand;
import springboard.command.ViewCommand;
import springboard.command.WriteActionCommand;
import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

/*
기본 패키지로 설정한 곳에 컨트롤러를 선언하면 요청이 들어왔을 때 Auto Scan된다.
 */
@Controller
public class BbsController {

	BbsCommandImpl command = null;
	
	@Autowired
	ListCommand listCommand;

	
	/*****************************************************************************/
	// 게시판 리스트
	
	@RequestMapping("/board/list.do")
	public String list(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = listCommand;
		command.execute(model);
		
		return "07Board/list";
	}
	
	/*****************************************************************************/
	
	@RequestMapping("/board/write.do")
	public String write(Model model) {
		return "07Board/write";
	}
	
	// 글쓰기 처리 - post 방식으로 전송되므로 value, method를 둘다 명시했다.
	@RequestMapping(value="/board/writeAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, SpringBbsDTO springBbsDTO) {
		
		model.addAttribute("springBbsDTO", springBbsDTO);
		command = new WriteActionCommand();
		command.execute(model);
		
		// redirect:이동할페이지경로(요청명)
		return "redirect:list.do?nowPage=1";
	}
	
	
	/*****************************************************************************/
	
	// 글 내용보기
	@RequestMapping("/board/view.do")
	public String view(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = new ViewCommand();
		command.execute(model);
		
		return "07Board/view";
	}
	
	
	/*****************************************************************************/
	
	// 패스워드 검증 폼
	@RequestMapping("/board/password.do")
	public String password(Model model, HttpServletRequest req) {
		// 3개의 파라미터 중 일련번호는 받아서 model에 저장
		model.addAttribute("idx", req.getParameter("idx"));
		return "07Board/password";
	}
	
	// 패스워드 검증 처리
	@RequestMapping("/board/passwordAction.do")
	public String passwordAction(Model model, HttpServletRequest req) {
		String modePage=null;
		String mode = req.getParameter("mode");
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		String pass = req.getParameter("pass");
		
		JDBCTemplateDAO dao = new JDBCTemplateDAO();
		
		int rowExist = dao.password(idx, pass);
		if(rowExist <= 0) {
			model.addAttribute("isCorrMsg", "패스워드가 일치하지 않습니다.");
			model.addAttribute("idx", idx);
			
			modePage = "07Board/password";
		}
		// 수정 처리
		else if(mode.equals("edit")){
			model.addAttribute("req", req);
			command = new EditCommand();
			command.execute(model);
			
			modePage = "07Board/edit";
		}
		else if(mode.equals("delete")){
			model.addAttribute("req", req);
			command = new DeleteActionCommand();
			command.execute(model);
			
			model.addAttribute("nowPage", nowPage);
			modePage = "redirect:list.do";
		}
		return modePage;
	}
	
	/*****************************************************************************/
	
	@RequestMapping("/board/editAction.do")
	public String editAction(HttpServletRequest req, Model model, SpringBbsDTO springBbsDTO) {
		
		model.addAttribute("springBbsDTO", springBbsDTO);
		command = new EditActionCommand();
		command.execute(model);
		
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		
		return "redirect:view.do";
	}
	
	/*****************************************************************************/
	
	@RequestMapping("/board/reply.do")
	public String reply(HttpServletRequest req, Model model) {
		
		System.out.println("reply() 메소드 호출");
		
		model.addAttribute("req", req);
		command = new ReplyCommand();
		command.execute(model);
		
		model.addAttribute("idx", req.getParameter("idx"));
		
		return "07Board/reply";
	}
	
	@RequestMapping("/board/replyAction.do")
	public String replyAction(HttpServletRequest req, Model model, SpringBbsDTO springBbsDTO) {
		
		model.addAttribute("springBbsDTO", springBbsDTO);
		model.addAttribute("req", req);
		
		command = new ReplyActionCommand();
		command.execute(model);
		
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		
		return "redirect:list.do";
	}
}
