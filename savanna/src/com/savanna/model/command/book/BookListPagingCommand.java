package com.savanna.model.command.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;
	
public class BookListPagingCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		new ListPaging<BookVO>().PagingDistributor(new BookDAO(), request);
		return "book/bookList.jsp";
	}

	public boolean isLoginValidate() {
		return true;
	}

}
