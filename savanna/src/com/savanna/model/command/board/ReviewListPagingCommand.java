package com.savanna.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.ReviewDAO;
import com.savanna.model.vo.ReviewVO;

public class ReviewListPagingCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		new ListPaging<ReviewVO>().PagingDistributor(new ReviewDAO(), request);
		return "board/list.jsp";
	}
	public boolean isLoginValidate() {
		return true;
	}
}
