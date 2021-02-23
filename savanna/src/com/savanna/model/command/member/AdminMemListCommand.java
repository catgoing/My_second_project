package com.savanna.model.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;

public class AdminMemListCommand implements Command{
	String cPage;

	public AdminMemListCommand(String cPage) {
		this.cPage = cPage;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String command = "memList";
		
		new ListPaging<MemberVO>().PagingDistributor(new MemberDAO(), request, 10, 5);
		request.setAttribute("cPage", cPage);
		request.setAttribute("command", command);

		return "member/adminMemList.jsp";
	}
}
