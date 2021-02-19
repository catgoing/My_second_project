package com.savanna.model.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;

public class MemListCommand implements Command{
	String cPage;

	public MemListCommand(String cPage) {
		this.cPage = cPage;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		new ListPaging<MemberVO>().PagingDistributor(new MemberDAO(), request);
		request.setAttribute("cPage", cPage);

		return "member/memList.jsp";
	}
}
