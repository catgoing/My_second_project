package com.savanna.model.command.book;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPagingCommand;
import com.savanna.model.command.paging.PagingFactory;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.PageVO;

public class AbstractedBookListPagingCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		new ListPagingCommand<BookVO>().PagingDistributor(new BookDAO(), request);
		return "book/bookList.jsp";
	}

	public boolean isLoginValidate() {
		return true;
	}

}
