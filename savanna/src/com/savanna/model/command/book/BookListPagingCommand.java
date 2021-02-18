package com.savanna.model.command.book;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.PagingFactory;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.PageVO;

public class BookListPagingCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PageVO page = PagingFactory.getPage(BookDAO.getBookCount(), request.getParameter("cPage"));
		request.setAttribute("pvo", page);
		
		List<?> list = BookDAO.getPagedBookList(getRecordRange(page.getCurPageRecordBeginIdx(), page.getCurPageRecordEndIdx()));
		request.setAttribute("list", list);
		
		return "book/bookList.jsp";
	}
	
	public Map<String, Integer> getRecordRange(int recordBeginIdx, int recordEndIdx) {
		return new HashMap<String, Integer>() {{
					put("begin", recordBeginIdx);
					put("end", recordEndIdx);
				}};
	}

	public boolean isLoginValidate() {
		return true;
	}

}
