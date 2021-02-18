package com.savanna.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.ReviewDAO;
import com.savanna.model.vo.ReviewVO;

public class ReviewInsertCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("ReviewInsert");
		ReviewVO rvo = new ReviewVO();
		
		rvo.setId(request.getParameter("id"));
		rvo.setBook_no((Integer.parseInt(request.getParameter("book_no"))));
		rvo.setRev_content(request.getParameter("rev_content"));
		rvo.setRev_pwd(request.getParameter("rev_pwd"));
		
		int result = ReviewDAO.insert(rvo);
		System.out.println(result);
		return "controller?type=PagedAdminLogin";
	}

}
