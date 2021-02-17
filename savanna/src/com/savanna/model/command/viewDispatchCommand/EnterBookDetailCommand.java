package com.savanna.model.command.viewDispatchCommand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;

public class EnterBookDetailCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int book_no = Integer.parseInt(request.getParameter("book_no")); //parseint 사전처리
		BookVO vo = BookDAO.getBookDetail(book_no);
		request.setAttribute("vo", vo);

		return "BookDetail.jsp";
	}
}
