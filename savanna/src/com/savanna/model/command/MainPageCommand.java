package com.savanna.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;

public class MainPageCommand implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<BookVO> list = new BookDAO().getPagedBookList(new ListPaging().getRecordRange(1, 12));
		request.setAttribute("list", list);
		return "mainResolved.jsp";
	}
}
