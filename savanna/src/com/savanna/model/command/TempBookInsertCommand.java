package com.savanna.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.dao.DAO;
import com.savanna.model.vo.BookVO;

public class TempBookInsertCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BookVO> list = DAO.getBookList();
		System.out.println(list.toString());
		request.setAttribute("list", list);

		return "tempbookinsert.jsp";
	}

}
