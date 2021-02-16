package del;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.DAO;
import com.savanna.model.vo.MemberVO;



public class IdCheckCommand2 implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
//		String result = "";
		MemberVO vo1 = new MemberVO();
		vo1.setId(id);
		
		int result = DAO.idCheck(vo1);
//		System.out.println(id1);
//		
//		if(!"".equals(id1.getId())) {
//			result = id1.getId();
//		}
		System.out.println("result : " + result);
		
		request.setAttribute("result", result);	
		
		
		return "signUp.jsp";
	}

}
