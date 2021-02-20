package com.savanna.model.command.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;

public class UpdateBookCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("UPDATING Book");
		System.out.println(request.getParameter("pub_date"));

		BookVO vo = new BookVO(Integer.parseInt(request.getParameter("book_no"))
							, request.getParameter("book_name")
							, request.getParameter("writer")
							, request.getParameter("publisher")
							, request.getParameter("pub_date")
							, Integer.parseInt(request.getParameter("price"))
							, request.getParameter("book_desc")
							, Integer.parseInt(request.getParameter("stock"))
							, request.getParameter("category")
							);
		int result = BookDAO.updateBook(vo);
		System.out.println(result);
		return "controller?type=StockManagerPage";
	}
}
