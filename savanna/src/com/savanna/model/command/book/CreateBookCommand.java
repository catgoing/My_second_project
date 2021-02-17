package com.savanna.model.command.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.BookDAO;
import com.savanna.model.command.Command;
import com.savanna.model.vo.BookVO;

public class CreateBookCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Creating Book");
		BookVO vo = new BookVO(Integer.parseInt("0")
							, request.getParameter("book_name")
							, request.getParameter("writer")
							, request.getParameter("publisher")
							, request.getParameter("pub_date")
							, Integer.parseInt(request.getParameter("price"))
							, request.getParameter("book_desc")
							, Integer.parseInt(request.getParameter("stock"))
							, request.getParameter("category")
							);
		int result = BookDAO.insertBook(vo);
		System.out.println(result);
		return "controller?type=PagedAdminLogin";
	}
}
