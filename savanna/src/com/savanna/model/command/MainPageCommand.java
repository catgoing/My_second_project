package com.savanna.model.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.dao.StaticBookDAO;
import com.savanna.model.vo.BookVO;

public class MainPageCommand implements Command {
	String keyword = null;
	public MainPageCommand() {
	}
	public MainPageCommand(String keyword) {
		this.keyword = keyword;
	}
	public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<BookVO> list;
		if (keyword == null || keyword.equals("")) {
			list = new BookDAO().getPagedBookList(new ListPaging().getRecordRange(1, BookDAO.getBookCount()));
		} else {
			Map<String, String> map = new HashMap<>();
			map.put("keyword", keyword);
			StaticBookDAO.searchBookCount(map);

			list = StaticBookDAO.searchBook(map);
		}
		request.setAttribute("list", list);
		return "mainResolved.jsp";
	}
}
