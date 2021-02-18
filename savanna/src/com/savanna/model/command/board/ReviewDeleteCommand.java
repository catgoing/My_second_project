package com.savanna.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.ReviewDAO;

public class ReviewDeleteCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rev_no = request.getParameter("rev_no"); //parseint 사전처리
		int result = ReviewDAO.delete(rev_no);
		System.out.println(result);

		return "controller?type=PagedAdminLogin";
	}
}
