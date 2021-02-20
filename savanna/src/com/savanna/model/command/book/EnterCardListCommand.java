package com.savanna.model.command.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;

public class EnterCardListCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!isLoginValidate()) {
			System.out.println("invalid login attempt");
			return null;
		}
		System.out.println("login success");
		List<BookVO> list = new BookDAO().getPagedList(new ListPaging<BookVO>().getRecordRange(0, 10));
		request.setAttribute("list", list);
		return "book/cardList2.jsp";
	}
	public boolean isLoginValidate() {
		return true;
	}
}
