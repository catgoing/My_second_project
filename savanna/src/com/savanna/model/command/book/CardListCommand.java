package com.savanna.model.command.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;

public class CardListCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BookVO> list = BookDAO.getBookList();
		request.setAttribute("list", list);

		return "book/cardList2.jsp";
	}
}
