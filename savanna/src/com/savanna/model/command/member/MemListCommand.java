package com.savanna.model.command.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.MemberVO;
import com.savanna.model.vo.Paging;

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
		
		new ListPaging<BookVO>().PagingDistributor(new BookDAO(), request);
		request.setAttribute("cPage", cPage);
		
		return "member/memList.jsp";
	}
}
