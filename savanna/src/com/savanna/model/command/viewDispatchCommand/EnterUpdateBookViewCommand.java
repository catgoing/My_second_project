package com.savanna.model.command.viewDispatchCommand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.BookDAO;
import com.savanna.model.command.Command;
import com.savanna.model.vo.BookVO;

public class EnterUpdateBookViewCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("going update view of " + request.getParameter("book_no"));
		BookVO vo = BookDAO.getBookDetail(parseBookNo(request));
		vo.setPub_date(parsePubDate(vo.getPub_date()));
		request.setAttribute("vo", vo);
		
		return "updatebook.jsp";
	}
	private String parsePubDate(String PUB_DATE) {
		return PUB_DATE.substring(0, 10);
	}
	private int parseBookNo(HttpServletRequest request) {
		return Integer.parseInt(request.getParameter("book_no"));
	}
}
