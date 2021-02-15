package com.savanna.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.BookDAO;
import com.savanna.model.vo.BookVO;

public class DeleteBookCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int book_no = Integer.parseInt(request.getParameter("book_no")); //parseint 사전처리
		int result = BookDAO.deleteBook(book_no);
		System.out.println(result);

		return "controller?type=adminlogin";
	}
}
