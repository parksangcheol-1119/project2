package springboard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

public class ReplyActionCommand implements BbsCommandImpl{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		SpringBbsDTO dto = (SpringBbsDTO)map.get("springBbsDTO");
		JDBCTemplateDAO dao = new JDBCTemplateDAO();

		dao.reply(dto);
	}
}
